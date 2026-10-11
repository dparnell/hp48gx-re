* HP 48GX ROM revision R, #1C017-#1F01E: User commands
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: xDER %12 xPICT xGRAPH xDRAW PUTLIST xRAD xOBJ> xPARAMETRIC xFUNCTION x>LIST POLAR
* Follows on from the previous file (at #1C017 in the original ROM).

* [1] [2] -> [3]
* ROMPTR 002 07A CROSS
* refs (1): 189EA
        CON(1)  8                                * 1C017  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C018  library
        CON(3)  #07A                             * 1C01B  command
        RPL
xCROSS:
        ::                                       * 1C01E
          CK2&Dispatch                           * 1C023
          BINT68                                 * 1C028
          MATCROSS                               * 1C02D
        ;                                        * 1C032

* [B] [[A]] [Z] ->  []' [[B]] [[A]] [[Z]] -> [[]]'
* ROMPTR 002 07B RSD
* refs (1): 189EA
        CON(1)  8                                * 1C037  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C038  library
        CON(3)  #07B                             * 1C03B  command
xRSD:
        ::                                       * 1C03E
          CK3&Dispatch                           * 1C043
          3ARRY                                  * 1C048
          MATRSD                                 * 1C04D
        ;                                        * 1C052

* slots of 002 07B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1C057  end of the slots: property byte (meaning not yet known)

* x y -> xy/100
* ROMPTR 002 07C %
* refs (4): 189EA 55C4C 55C65 55C7E
        CON(1)  0                                * 1C059  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C05A  library
        CON(3)  #07C                             * 1C05D  command
x%:
        ::                                       * 1C060
          CK2&Dispatch                           * 1C065
          BINT17                                 * 1C06A
          %OF                                    * 1C06F
          BINT26                                 * 1C074
          %SYM%OF                                * 1C079
          SYMREAL                                * 1C07E
          SYM%%OF                                * 1C083
          SYMSYM                                 * 1C088
          SYM%OF                                 * 1C08D
          EXTREAL                                * 1C092
          UM%                                    * 1C097
          EXTSYM                                 * 1C09C
          %SYM%OF                                * 1C0A1
          SYMEXT                                 * 1C0A6
          SYM%%OF                                * 1C0AB
          BINT30                                 * 1C0B0

%(2r):
          ::                                     * 1C0B5
            SWAP                                 * 1C0BA
            UM%                                  * 1C0BF
          ;                                      * 1C0C4
        ;                                        * 1C0C9

* slots of 002 07C (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1C0CE  end of the slots: property byte (meaning not yet known)

* x y -> 100y/x
* ROMPTR 002 07D %T
* refs (4): 189EA 55CE2 55CFB 55D14
        CON(1)  0                                * 1C0D0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C0D1  library
        CON(3)  #07D                             * 1C0D4  command
x%T:
        ::                                       * 1C0D7
          CK2&Dispatch                           * 1C0DC
          BINT17                                 * 1C0E1
          %T                                     * 1C0E6
          BINT26                                 * 1C0EB
          %SYM%T                                 * 1C0F0
          SYMREAL                                * 1C0F5
          SYM%%T                                 * 1C0FA
          SYMSYM                                 * 1C0FF
          SYM%T                                  * 1C104
          2EXT                                   * 1C109
          UM%T                                   * 1C10E
          BINT30                                 * 1C113
          UM%T                                   * 1C118
          EXTREAL                                * 1C11D
          UM%T                                   * 1C122
          EXTSYM                                 * 1C127
          %SYM%T                                 * 1C12C
          SYMEXT                                 * 1C131
          SYM%%T                                 * 1C136
        ;                                        * 1C13B

* slots of 002 07D (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1C140  end of the slots: property byte (meaning not yet known)

* x1 x2 -> x3
* ROMPTR 002 07E %CH
* refs (4): 189EA 55C97 55CB0 55CC9
        CON(1)  0                                * 1C142  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C143  library
        CON(3)  #07E                             * 1C146  command
x%CH:
        ::                                       * 1C149
          CK2&Dispatch                           * 1C14E
          BINT17                                 * 1C153
          %CH                                    * 1C158
          BINT26                                 * 1C15D
          %SYM%CH                                * 1C162
          SYMREAL                                * 1C167
          SYM%%CH                                * 1C16C
          SYMSYM                                 * 1C171
          SYM%CH                                 * 1C176
          2EXT                                   * 1C17B
          UM%CH                                  * 1C180
          BINT30                                 * 1C185
          UM%CH                                  * 1C18A
          EXTREAL                                * 1C18F
          UM%CH                                  * 1C194
          EXTSYM                                 * 1C199
          %SYM%CH                                * 1C19E
          SYMEXT                                 * 1C1A3
          SYM%%CH                                * 1C1A8
        ;                                        * 1C1AD

* -> x
* ROMPTR 002 07F RAND
* refs (1): 189EA
        CON(1)  8                                * 1C1B2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C1B3  library
        CON(3)  #07F                             * 1C1B6  command
xRAND:
        ::                                       * 1C1B9
          CK0                                    * 1C1BE
          %RAN                                   * 1C1C3
        ;                                        * 1C1C8

* x ->
* ROMPTR 002 080 RDZ
* refs (1): 189EA
        CON(1)  8                                * 1C1CD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C1CE  library
        CON(3)  #080                             * 1C1D1  command
xRDZ:
        ::                                       * 1C1D4
          CK1&Dispatch                           * 1C1D9
          BINT1                                  * 1C1DE
          %RANDOMIZE                             * 1C1E3
        ;                                        * 1C1E8

* slots of 002 080 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1C1ED  end of the slots: property byte (meaning not yet known)

* n k -> Cn,k
* ROMPTR 002 081 COMB
* refs (4): 189EA 55D2D 55D46 55D5F
        CON(1)  0                                * 1C1EF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C1F0  library
        CON(3)  #081                             * 1C1F3  command
xCOMB:
        ::                                       * 1C1F6
          CK2&Dispatch                           * 1C1FB
          BINT17                                 * 1C200
          %COMB                                  * 1C205
          BINT26                                 * 1C20A
          %SYMCOMB                               * 1C20F
          SYMREAL                                * 1C214
          SYM%COMB                               * 1C219
          SYMSYM                                 * 1C21E
          SYMCOMB                                * 1C223
        ;                                        * 1C228

* slots of 002 081 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1C22D  end of the slots: property byte (meaning not yet known)

* n k -> n'
* ROMPTR 002 082 PERM
* refs (4): 189EA 55D78 55D91 55DAA
        CON(1)  0                                * 1C22F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C230  library
        CON(3)  #082                             * 1C233  command
xPERM:
        ::                                       * 1C236
          CK2&Dispatch                           * 1C23B
          BINT17                                 * 1C240
          %PERM                                  * 1C245
          BINT26                                 * 1C24A
          %SYMPERM                               * 1C24F
          SYMREAL                                * 1C254
          SYM%PERM                               * 1C259
          SYMSYM                                 * 1C25E
          SYMPERM                                * 1C263
        ;                                        * 1C268

* n ->
* ROMPTR 002 083 SF
* refs (3): 189EA 4008F D3D85
        CON(1)  8                                * 1C26D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C26E  library
        CON(3)  #083                             * 1C271  command
xSF:
        ::                                       * 1C274
          CK1&Dispatch                           * 1C279
          BINT1                                  * 1C27E
          sf(r)                                  * 1C283
        ;                                        * 1C288

* refs (1): 1C283
sf(r):
        ::                                       * 1C28D
          r=>s;r>0?                              * 1C292
          case                                   * 1C297
          SetUserFlag                            * 1C29C
          SetSysFlag                             * 1C2A1
          ChkDelLastArg                          * 1C2A6
        ;                                        * 1C2AB

* refs (4): 1C292 1C2F3 1C336 1C4C4
r=>s;r>0?:
        ::                                       * 1C2B0
          DUP                                    * 1C2B5
          %ABSCOERCE                             * 1C2BA
          SWAP                                   * 1C2BF
          %0>                                    * 1C2C4
        ;                                        * 1C2C9

* n ->
* ROMPTR 002 084 CF
* refs (4): 189EA 400BC D3D45 D3F69
        CON(1)  8                                * 1C2CE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C2CF  library
        CON(3)  #084                             * 1C2D2  command
xCF:
        ::                                       * 1C2D5
          CK1&Dispatch                           * 1C2DA
          BINT1                                  * 1C2DF
          cf(r)                                  * 1C2E4
        ;                                        * 1C2E9

* refs (1): 1C2E4
cf(r):
        ::                                       * 1C2EE
          r=>s;r>0?                              * 1C2F3
          ITE                                    * 1C2F8
          ClrUserFlag                            * 1C2FD
          ClrSysFlag                             * 1C302
        ;                                        * 1C307

* n -> 0/1
* ROMPTR 002 085 FS?
* refs (2): 189EA D3E56
        CON(1)  8                                * 1C30C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C30D  library
        CON(3)  #085                             * 1C310  command
xFS?:
        ::                                       * 1C313
          CK1&Dispatch                           * 1C318
          BINT1                                  * 1C31D
          fs?(r)                                 * 1C322
        ;                                        * 1C327

* refs (1): 1C322
fs?(r):
        ::                                       * 1C32C

* refs (1): 1C37E
fs?(r)?:
          ::                                     * 1C331
            r=>s;r>0?                            * 1C336
            ITE                                  * 1C33B
            TestUserFlag                         * 1C340
            TestSysFlag                          * 1C345
          ;                                      * 1C34A
          COERCEFLAG                             * 1C34F
        ;                                        * 1C354

* n -> 0/1
* ROMPTR 002 086 FC?
* refs (1): 189EA
        CON(1)  8                                * 1C359  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C35A  library
        CON(3)  #086                             * 1C35D  command
xFC?:
        ::                                       * 1C360
          CK1&Dispatch                           * 1C365
          BINT1                                  * 1C36A
          fc?(r)                                 * 1C36F
        ;                                        * 1C374

* refs (1): 1C36F
fc?(r):
        ::                                       * 1C379
          fs?(r)?                                * 1C37E
          NOT                                    * 1C383
          COERCEFLAG                             * 1C388
        ;                                        * 1C38D

* ->
* ROMPTR 002 087 DEG
* refs (3): 189EA B912C C6218
        CON(1)  8                                * 1C392  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C393  library
        CON(3)  #087                             * 1C396  command
xDEG:
        ::                                       * 1C399
          CK0                                    * 1C39E
          SETDEG                                 * 1C3A3
        ;                                        * 1C3A8

* ->
* ROMPTR 002 088 RAD
* refs (13): 189EA B9136 C624F D2FC1 D31E7 D338A ...
        CON(1)  8                                * 1C3AD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3AE  library
        CON(3)  #088                             * 1C3B1  command
xRAD:
        ::                                       * 1C3B4
          CK0                                    * 1C3B9
          SETRAD                                 * 1C3BE
        ;                                        * 1C3C3

* ->
* ROMPTR 002 089 GRAD
* refs (3): 189EA B9140 C6295
        CON(1)  8                                * 1C3C8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3C9  library
        CON(3)  #089                             * 1C3CC  command
xGRAD:
        ::                                       * 1C3CF
          CK0                                    * 1C3D4
          SETGRAD                                * 1C3D9
        ;                                        * 1C3DE

* n ->
* ROMPTR 002 08A FIX
* refs (2): 189EA C6111
        CON(1)  8                                * 1C3E3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3E4  library
        CON(3)  #08A                             * 1C3E7  command
xFIX:
        ::                                       * 1C3EA
          CK1&Dispatch                           * 1C3EF
          BINT1                                  * 1C3F4
          fix(r)                                 * 1C3F9
        ;                                        * 1C3FE

* refs (1): 1C3F9
fix(r):
        ::                                       * 1C403
          COERCE                                 * 1C408
          DOFIX                                  * 1C40D
        ;                                        * 1C412

* n ->
* ROMPTR 002 08B SCI
* refs (2): 189EA C6144
        CON(1)  8                                * 1C417  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C418  library
        CON(3)  #08B                             * 1C41B  command
xSCI:
        ::                                       * 1C41E
          CK1&Dispatch                           * 1C423
          BINT1                                  * 1C428
          sci(r)                                 * 1C42D
        ;                                        * 1C432

* refs (1): 1C42D
sci(r):
        ::                                       * 1C437
          COERCE                                 * 1C43C
          DOSCI                                  * 1C441
        ;                                        * 1C446

* n ->
* ROMPTR 002 08C ENG
* refs (2): 189EA C6177
        CON(1)  8                                * 1C44B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C44C  library
        CON(3)  #08C                             * 1C44F  command
xENG:
        ::                                       * 1C452
          CK1&Dispatch                           * 1C457
          BINT1                                  * 1C45C
          eng(r)                                 * 1C461
        ;                                        * 1C466

* refs (1): 1C461
eng(r):
        ::                                       * 1C46B
          COERCE                                 * 1C470
          DOENG                                  * 1C475
        ;                                        * 1C47A

* ->
* ROMPTR 002 08D STD
* refs (2): 189EA C60D9
        CON(1)  8                                * 1C47F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C480  library
        CON(3)  #08D                             * 1C483  command
xSTD:
        ::                                       * 1C486
          CK0                                    * 1C48B
          DOSTD                                  * 1C490
        ;                                        * 1C495

* n -> 0/1
* ROMPTR 002 08E FS?C
* refs (1): 189EA
        CON(1)  8                                * 1C49A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C49B  library
        CON(3)  #08E                             * 1C49E  command
xFS?C:
        ::                                       * 1C4A1
          CK1&Dispatch                           * 1C4A6
          BINT1                                  * 1C4AB
          fs?c(r)                                * 1C4B0
        ;                                        * 1C4B5

* refs (1): 1C4B0
fs?c(r):
        ::                                       * 1C4BA

* refs (1): 1C53E
fs?c(r)?:
          ::                                     * 1C4BF
            r=>s;r>0?                            * 1C4C4

UserFs?c(r)?:
            ITE                                  * 1C4C9

* # -> flag
TestUserClr:
            ::                                   * 1C4CE
              DUP                                * 1C4D3
              TestUserFlag                       * 1C4D8
              SWAP                               * 1C4DD
              ClrUserFlag                        * 1C4E2

SysFs?c(r)?:
            ;                                    * 1C4E7

* # -> flag
TestSysClr:
            ::                                   * 1C4EC
              DUP                                * 1C4F1
              TestSysFlag                        * 1C4F6
              SWAP                               * 1C4FB
              ClrSysFlag                         * 1C500
            ;                                    * 1C505
          ;                                      * 1C50A
          COERCEFLAG                             * 1C50F
        ;                                        * 1C514

* n -> 0/1
* ROMPTR 002 08F FC?C
* refs (2): 189EA D3EA1
        CON(1)  8                                * 1C519  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C51A  library
        CON(3)  #08F                             * 1C51D  command
xFC?C:
        ::                                       * 1C520
          CK1&Dispatch                           * 1C525
          BINT1                                  * 1C52A
          fc?c(r)                                * 1C52F
        ;                                        * 1C534

* refs (1): 1C52F
fc?c(r):
        ::                                       * 1C539
          fs?c(r)?                               * 1C53E
          NOT                                    * 1C543
          COERCEFLAG                             * 1C548
        ;                                        * 1C54D

* ->
* ROMPTR 002 090 BIN
* refs (2): 189EA C57BC
        CON(1)  8                                * 1C552  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C553  library
        CON(3)  #090                             * 1C556  command
xBIN:
        ::                                       * 1C559
          CK0                                    * 1C55E
          DOBIN                                  * 1C563
        ;                                        * 1C568

* ->
* ROMPTR 002 091 DEC
* refs (2): 189EA C5738
        CON(1)  8                                * 1C56D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C56E  library
        CON(3)  #091                             * 1C571  command
xDEC:
        ::                                       * 1C574
          CK0                                    * 1C579
          DODEC                                  * 1C57E
        ;                                        * 1C583

* ->
* ROMPTR 002 092 HEX
* refs (2): 189EA C56F6
        CON(1)  8                                * 1C588  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C589  library
        CON(3)  #092                             * 1C58C  command
xHEX:
        ::                                       * 1C58F
          CK0                                    * 1C594
          DOHEX                                  * 1C599
        ;                                        * 1C59E

* ->
* ROMPTR 002 093 OCT
* refs (2): 189EA C577A
        CON(1)  8                                * 1C5A3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5A4  library
        CON(3)  #093                             * 1C5A7  command
xOCT:
        ::                                       * 1C5AA
          CK0                                    * 1C5AF
          DOOCT                                  * 1C5B4
        ;                                        * 1C5B9

* n -> #n ->
* ROMPTR 002 094 STWS
* refs (1): 189EA
        CON(1)  8                                * 1C5BE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5BF  library
        CON(3)  #094                             * 1C5C2  command
xSTWS:
        ::                                       * 1C5C5
          CK1&Dispatch                           * 1C5CA
          BINT1                                  * 1C5CF
          XEQSTWS                                * 1C5D4
          BINT11                                 * 1C5D9

stws(b):
          ::                                     * 1C5DE
            HXS>#                                * 1C5E3
            dostws                               * 1C5E8
          ;                                      * 1C5ED
        ;                                        * 1C5F2

* -> n
* ROMPTR 002 095 RCWS
* refs (1): 189EA
        CON(1)  8                                * 1C5F7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5F8  library
        CON(3)  #095                             * 1C5FB  command
xRCWS:
        ::                                       * 1C5FE
          CK0                                    * 1C603
          XEQRCWS                                * 1C608
        ;                                        * 1C60D

* -> {#s1 #u1 #s2 #u2}
* ROMPTR 002 096 RCLF
* refs (1): 189EA
        CON(1)  8                                * 1C612  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C613  library
        CON(3)  #096                             * 1C616  command
xRCLF:
        ::                                       * 1C619
          CK0                                    * 1C61E
          RCLSYSF                                * 1C623
          RCLUSERF                               * 1C628
          TWO{}N                                 * 1C62D
        ;                                        * 1C632

* -> hxs
* refs (8): 1C623 8D534 8D607 8D71A 8EDAC B51BC ...
RCLSYSF:
        CON(5)  (*)+5                            * 1C637  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 1C63C
        D0=(5)  SystemFlags                      * 1C643
        GOTO    L_1C661                          * 1C64A

* -> hxs
* refs (1): 1C628
RCLUSERF:
        CON(5)  (*)+5                            * 1C64E  primitive code object
        GOSBVL  SAVPTR                           * 1C653
        D0=(5)  UserFlags                        * 1C65A
L_1C661:
        A=DAT0  W                                * 1C661
        P=      15                               * 1C665
        GOSBVL  PUSHhxs                          * 1C667
        A=DAT0  A                                * 1C66E
        D0=D0+  5                                * 1C671
        PC=(A)                                   * 1C674

* {#s1 #u1 #s2 #u2} ->
* ROMPTR 002 097 STOF
* refs (1): 189EA
        CON(1)  8                                * 1C678  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C679  library
        CON(3)  #097                             * 1C67C  command
        RPL
xSTOF:
        ::                                       * 1C67F
          CK1&Dispatch                           * 1C684
          BINT5                                  * 1C689
          DOSTOALLF0                             * 1C68E
          BINT11                                 * 1C693
          DOSTOSYSF                              * 1C698
        ;                                        * 1C69D

* {} ->
* refs (1): 1C68E
DOSTOALLF0:
        ::                                       * 1C6A2
          INNERCOMP                              * 1C6A7
          #2<>                                   * 1C6AC
          case                                   * 1C6B1
          SETSIZEERR                             * 1C6B6
          CK&DISPATCH0                           * 1C6BB
          2HXS                                   * 1C6C0
          STOALLFcont                            * 1C6C5
        ;                                        * 1C6CA

* hxs_usr hxs_sys ->
* refs (1): 1C6C5
STOALLFcont:
        ::                                       * 1C6CF
          STOUSERF                               * 1C6D4
          DOSTOSYSF                              * 1C6D9
        ;                                        * 1C6DE

* hxs ->
* refs (2): 1C698 1C6D9
DOSTOSYSF:
        ::                                       * 1C6E3
          STOSYSF                                * 1C6E8
          ChkDelLastArg                          * 1C6ED
        ;                                        * 1C6F2

* hxs ->
* refs (1): 1C6D4
STOUSERF:
        CON(5)  (*)+5                            * 1C6F7  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 1C6FC
        D1=D1+  5                                * 1C6FF
        D=D+1   A                                * 1C702
        CD1EX                                    * 1C704
        RSTK=C                                   * 1C707
        D1=D1+  5                                * 1C709
        A=DAT1  A                                * 1C70C
        LC(5)   #00006                           * 1C70F
        C=A-C   A                                * 1C716
        P=C     0                                * 1C718
        D1=D1+  5                                * 1C71C
        A=0     W                                * 1C71F
        A=DAT1  WP                               * 1C722
        D1=(5)  UserFlags                        * 1C726
        GOTO    L_1C767                          * 1C72D

* hxs ->
* refs (7): 1C6E8 B51F3 B5207 B89D1 B89F9 D14B9 ...
STOSYSF:
        CON(5)  (*)+5                            * 1C731  primitive code object
        C=DAT1  A                                * 1C736
        D1=D1+  5                                * 1C739
        D=D+1   A                                * 1C73C
        CD1EX                                    * 1C73E
        RSTK=C                                   * 1C741
        D1=D1+  5                                * 1C743
        A=DAT1  A                                * 1C746
        LC(5)   #00006                           * 1C749
        C=A-C   A                                * 1C750
        P=C     0                                * 1C752
        D1=D1+  5                                * 1C756
        A=0     W                                * 1C759
        A=DAT1  WP                               * 1C75C
        D1=(5)  SystemFlags                      * 1C760
L_1C767:
        DAT1=A  W                                * 1C767
        C=RSTK                                   * 1C76B
        D1=C                                     * 1C76D
        P=      0                                * 1C770
        A=DAT0  A                                * 1C772
        D0=D0+  5                                * 1C775
        PC=(A)                                   * 1C778

* ob1 .. obn n -> {}
* ROMPTR 002 098 →LIST
* refs (9): 189EA 43D9F D3C78 D3CF7 D3E10 D3E6F ...
        CON(1)  8                                * 1C77C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C77D  library
        CON(3)  #098                             * 1C780  command
        RPL
x>LIST:
        ::                                       * 1C783
          CKN                                    * 1C788
          {}N                                    * 1C78D
        ;                                        * 1C792

* x y -> (x,y) [X] [Y] -> [(x,y)]
* ROMPTR 002 099 R→C
* refs (1): 189EA
        CON(1)  8                                * 1C797  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C798  library
        CON(3)  #099                             * 1C79B  command
xR>C:
        ::                                       * 1C79E
          CK2&Dispatch                           * 1C7A3
          BINT17                                 * 1C7A8
          %>C%                                   * 1C7AD
          BINT68                                 * 1C7B2
          MATR>C                                 * 1C7B7
        ;                                        * 1C7BC

* slots of 002 099 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #08                              * 1C7C1  end of the slots: property byte (meaning not yet known)

* (x,y) -> x [] -> []'
* ROMPTR 002 09A RE
* refs (7): 189EA 54EAF 5549F 55580 5BDFC 84625 ...
        CON(1)  0                                * 1C7C3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C7C4  library
        CON(3)  #09A                             * 1C7C7  command
xRE:
        ::                                       * 1C7CA
          CK1&Dispatch                           * 1C7CF
          BINT1                                  * 1C7D4
          NOP                                    * 1C7D9
          BINT2                                  * 1C7DE
          C>Re%                                  * 1C7E3
          BINT4                                  * 1C7E8
          MATRE                                  * 1C7ED
          BINT10                                 * 1C7F2
          re(ex)                                 * 1C7F7
          BINT14                                 * 1C7FC
          CARCOMP                                * 1C801
        ;                                        * 1C806

* slots of 002 09A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  MANMENUCX                        * 1C80B  slot 0
        CON(2)  #08                              * 1C810  end of the slots: property byte (meaning not yet known)

* (x,y) -> y [] -> []'
* ROMPTR 002 09B IM
* refs (7): 189EA 54EC8 55445 5558F 5BE01 84639 ...
        CON(1)  0                                * 1C812  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C813  library
        CON(3)  #09B                             * 1C816  command
xIM:
        ::                                       * 1C819
          CK1&Dispatch                           * 1C81E
          BINT1                                  * 1C823
          DROP%0                                 * 1C828
          BINT2                                  * 1C82D
          C>Im%                                  * 1C832
          BINT4                                  * 1C837
          MATIM                                  * 1C83C
          BINT10                                 * 1C841
          SYMIM                                  * 1C846
        ;                                        * 1C84B

* slots of 002 09B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  MANMENUCX                        * 1C850  slot 0

* ob start end -> ob' ob= [[]], $, {}, grob, PICT start,end = n, {n m}, (n,m)
* ROMPTR 002 09C SUB
* refs (3): 189EA D22B2 D22D0
        CON(1)  8                                * 1C855  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C856  library
        CON(3)  #09C                             * 1C859  command
xSUB:
        ::                                       * 1C85C
          CK3&Dispatch                           * 1C861
          STRREALREAL                            * 1C866
          XEQSUB$                                * 1C86B
          LISTREALREAL                           * 1C870
          sub(st,2r)                             * 1C875
          #       C55                            * 1C87A  3157
          sub(go,2li)                            * 1C884
          #       C22                            * 1C889  3106
          sub(go,2c)                             * 1C893
          BINT0                                  * 1C898
          ROMPTR  0E8 01F                        * 1C89D
        ;                                        * 1C8A8
        BSS     14                               * 1C8AD

* $ % %' -> $'
* refs (1): 1C86B
XEQSUB$:
        ::                                       * 1C8BB
          COERCE2                                * 1C8C0
          SUB$                                   * 1C8C5
        ;                                        * 1C8CA

* refs (1): 1C875
sub(st,2r):
        ::                                       * 1C8CF
          COERCE2                                * 1C8D4
          SUBCOMP                                * 1C8D9
        ;                                        * 1C8DE

* ob pos new -> ob' ob= [[]] or [] or {} or $ or PICT pos= N or {n m} or (n,m)
* ROMPTR 002 09D REPL
* refs (3): 189EA D234A D2368
        CON(1)  8                                * 1C8E3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C8E4  library
        CON(3)  #09D                             * 1C8E7  command
xREPL:
        ::                                       * 1C8EA
          CK3&Dispatch                           * 1C8EF
          #       C5C                            * 1C8F4  3164
          repl(go,li,go)                         * 1C8FE
          #       C2C                            * 1C903  3116
          repl(go,c,go)                          * 1C90D
          #       313                            * 1C912  787
          repl(st,s,st)                          * 1C91C
          #       515                            * 1C921  1301
          OBJ_4FA7A                              * 1C92B
          BINT0                                  * 1C930
          ROMPTR  0E8 020                        * 1C935
        ;                                        * 1C940
        BSS     14                               * 1C945

* {} -> ob1...obn n
* ROMPTR 002 09E LIST→
* refs (1): 189EA
        CON(1)  8                                * 1C953  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C954  library
        CON(3)  #09E                             * 1C957  command
xLIST>:
        ::                                       * 1C95A
          CK1&Dispatch                           * 1C95F
          BINT5                                  * 1C964
          XEQLIST>                               * 1C969
        ;                                        * 1C96E

* comp -> obn..ob1 %n
* refs (2): 1C969 1CFB2
XEQLIST>:
        ::                                       * 1C973
          INNERCOMP                              * 1C978
          UNCOERCE                               * 1C97D
        ;                                        * 1C982

* (x,y) -> x y [C]   -> [R] [I]
* ROMPTR 002 09F C→R
* refs (1): 189EA
        CON(1)  8                                * 1C987  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C988  library
        CON(3)  #09F                             * 1C98B  command
xC>R:
        ::                                       * 1C98E
          CK1&Dispatch                           * 1C993
          BINT2                                  * 1C998
          C%>%                                   * 1C99D
          BINT4                                  * 1C9A2
          MATC>R                                 * 1C9A7
        ;                                        * 1C9AC

* ob -> n -> {N m} -> #nw #nh
* ROMPTR 002 0A0 SIZE
* refs (5): 189EA D2F23 D3D58 D3D62 D4015
        CON(1)  8                                * 1C9B1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C9B2  library
        CON(3)  #0A0                             * 1C9B5  command
xSIZE:
        ::                                       * 1C9B8
          CK1&Dispatch                           * 1C9BD
          BINT3                                  * 1C9C2
          LEN$>%                                 * 1C9C7
          BINT4                                  * 1C9CC
          size(ar)                               * 1C9D1
          BINT5                                  * 1C9D6
          LENCOMP>%                              * 1C9DB
          BINT10                                 * 1C9E0
          size(ex)                               * 1C9E5
          BINT12                                 * 1C9EA
          size(go)                               * 1C9EF
          BINT8                                  * 1C9F4
          size(PICT)                             * 1C9F9
          BINT14                                 * 1C9FE
          LENCOMP>%                              * 1CA03
          BINT0                                  * 1CA08

* ob -> %1
DROP%1:
          ::                                     * 1CA0D
            DROP                                 * 1CA12
            %1                                   * 1CA17
          ;                                      * 1CA1C
        ;                                        * 1CA21

* $ ->  %
* refs (1): 1C9C7
LEN$>%:
        ::                                       * 1CA26
          LEN$                                   * 1CA2B
          UNCOERCE                               * 1CA30
        ;                                        * 1CA35

* comp -> %n
* refs (2): 1C9DB 1CA03
LENCOMP>%:
        ::                                       * 1CA3A
          LENCOMP                                * 1CA3F
          UNCOERCE                               * 1CA44
        ;                                        * 1CA49

* refs (2): 1C9D1 31C77
size(ar):
        ::                                       * 1CA4E
          DIMLIMITS                              * 1CA53
          UNCOERCE{}2                            * 1CA58
        ;                                        * 1CA5D

* refs (3): 1C9EF 1CAA3 4B1FC
size(go):
        ::                                       * 1CA62
          GROBDIM                                * 1CA67
          UNCOERCE2                              * 1CA6C
          %>#                                    * 1CA71
          SWAP                                   * 1CA76
          %>#                                    * 1CA7B
        ;                                        * 1CA80

* refs (1): 1C9F9
size(PICT):
        ::                                       * 1CA85
          '                                      * 1CA8A
          xPICT                                  * 1CA8F
          EQUALNOTcase                           * 1CA94
          %1                                     * 1CA99
          GBUFF                                  * 1CA9E
          size(go)                               * 1CAA3
        ;                                        * 1CAA8

* str substring -> n/0 {} ob -> n/0
* ROMPTR 002 0A1 POS
* refs (1): 189EA
        CON(1)  8                                * 1CAAD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CAAE  library
        CON(3)  #0A1                             * 1CAB1  command
xPOS:
        ::                                       * 1CAB4
          CK2&Dispatch                           * 1CAB9
          OBJ_64C34                              * 1CABE
          pos(cp,_)                              * 1CAC3
          BINT51                                 * 1CAC8
          XEQPOS$                                * 1CACD
        ;                                        * 1CAD2

* $ $find/chr -> %pos -> %0
* refs (3): 1CACD 2568F 321B6
XEQPOS$:
        ::                                       * 1CAD7
          BINT1                                  * 1CADC
          POS$                                   * 1CAE1
          UNCOERCE                               * 1CAE6
        ;                                        * 1CAEB

* refs (1): 1CAC3
pos(cp,_):
        ::                                       * 1CAF0
          EQUALPOSCOMP                           * 1CAF5
          UNCOERCE                               * 1CAFA
        ;                                        * 1CAFF

* ob -> $
* ROMPTR 002 0A2 →STR
* refs (1): 189EA
        CON(1)  8                                * 1CB04  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB05  library
        CON(3)  #0A2                             * 1CB08  command
x>STR:
        ::                                       * 1CB0B
          CK1                                    * 1CB10
          DO>STR                                 * 1CB15
        ;                                        * 1CB1A

* $ -> ob
* ROMPTR 002 0A3 STR→
* refs (2): 189EA 2DD97
        CON(1)  8                                * 1CB1F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB20  library
        CON(3)  #0A3                             * 1CB23  command
xSTR>:
        ::                                       * 1CB26
          CK1&Dispatch                           * 1CB2B
          BINT3                                  * 1CB30
          DOSTR>                                 * 1CB35
        ;                                        * 1CB3A

* $ -> n
* ROMPTR 002 0A4 NUM
* refs (1): 189EA
        CON(1)  8                                * 1CB3F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB40  library
        CON(3)  #0A4                             * 1CB43  command
xNUM:
        ::                                       * 1CB46
          CK1&Dispatch                           * 1CB4B
          BINT3                                  * 1CB50
          DONUM                                  * 1CB55
        ;                                        * 1CB5A

* n -> $
* ROMPTR 002 0A5 CHR
* refs (1): 189EA
        CON(1)  8                                * 1CB5F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB60  library
        CON(3)  #0A5                             * 1CB63  command
xCHR:
        ::                                       * 1CB66
          CK1&Dispatch                           * 1CB6B
          BINT1                                  * 1CB70
          DOCHR                                  * 1CB75
        ;                                        * 1CB7A

* ob -> %type
* ROMPTR 002 0A6 TYPE
* refs (4): 189EA 3C150 D3C15 D3C5A
        CON(1)  8                                * 1CB7F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB80  library
        CON(3)  #0A6                             * 1CB83  command
xTYPE:
        ::                                       * 1CB86
          CK1                                    * 1CB8B

* ob -> ob %type
* refs (6): 15CD4 18751 1CE6E 2F130 B9536 D6CC1
XEQTYPE:
          ::                                     * 1CB90
            CK&DISPATCH0                         * 1CB95
            BINT1                                * 1CB9A
            %0_2A2B4                             * 1CB9F
            BINT2                                * 1CBA4
            %1                                   * 1CBA9
            BINT3                                * 1CBAE
            %2                                   * 1CBB3
            BINT4                                * 1CBB8
            dup;type(ar)                         * 1CBBD
            BINT5                                * 1CBC2
            %5                                   * 1CBC7
            BINT6                                * 1CBCC
            %6                                   * 1CBD1
            BINT7                                * 1CBD6
            %7                                   * 1CBDB
            BINT8                                * 1CBE0
            OBJ_1CDD4                            * 1CBE5
            BINT9                                * 1CBEA
            %9                                   * 1CBEF
            BINT11                               * 1CBF4
            %10                                  * 1CBF9
            BINT12                               * 1CBFE

* 11
* refs (5): 4C045 B7320 B7632 B78D0 B9270
%11:
            %       1.1E1                        * 1CC03
            BINT13                               * 1CC18

* 12
* refs (18): 9921A A4B96 AD1E6 AE26C B4FC0 B4FFD ...
%12:
            %       1.2E1                        * 1CC1D
            BINT14                               * 1CC32

* 13
* refs (4): 8CEDD AF1C2 B5760 B763C
%13:
            %       1.3E1                        * 1CC37
            BINT15                               * 1CC4C

* 14
* refs (1): B7641
%14:
            %       1.4E1                        * 1CC51
            BINT31                               * 1CC66

* 20
* refs (1): B765F
%20:
            %       2E1                          * 1CC6B
            BINT47                               * 1CC80

* 15
* refs (1): B7646
%15:
            %       1.5E1                        * 1CC85
            #       3F                           * 1CC9A  63

* 21
* refs (1): B7664
%21:
            %       2.1E1                        * 1CCA4
            #       4F                           * 1CCB9  79

* 22
* refs (1): B7669
%22:
            %       2.2E1                        * 1CCC3
            #       5F                           * 1CCD8  95

* 23
* refs (1): B766E
%23:
            %       2.3E1                        * 1CCE2
            #       6F                           * 1CCF7  111

* 24
%24:
            %       2.4E1                        * 1CD01
            #       7F                           * 1CD16  127

* 25
%25:
            %       2.5E1                        * 1CD20
            #8F_64D2E                            * 1CD35

* 16
* refs (3): B764B D34CF D35D7
%16:
            %       1.6E1                        * 1CD3A
            backup                               * 1CD4F

* 17
* refs (1): B7650
%17:
            %       1.7E1                        * 1CD54

* 175d AFh
BINT_AFh:
            #       AF                           * 1CD69  175

* 26
%26:
            %       2.6E1                        * 1CD73
            BINT0                                * 1CD88

* 27
%27:
            %       2.7E1                        * 1CD8D
          ;                                      * 1CDA2
          SWAPDROP                               * 1CDA7
        ;                                        * 1CDAC

* refs (1): 1CBBD
dup;type(ar):
        ::                                       * 1CDB1
          DUP                                    * 1CDB6
          TYPERARRY?                             * 1CDBB
          ITE                                    * 1CDC0
          %3                                     * 1CDC5
          %4                                     * 1CDCA
        ;                                        * 1CDCF

* refs (1): 1CBE5
OBJ_1CDD4:
        ::                                       * 1CDD4
          DUPROM-WORD?                           * 1CDD9
          NOTcase                                * 1CDDE
          %8                                     * 1CDE3
          ?OKINALG                               * 1CDE8
          case                                   * 1CDED

* 18
* refs (1): B7655
%18:
          %       1.8E1                          * 1CDF2

* 19
* refs (1): B765A
%19:
          %       1.9E1                          * 1CE07
        ;                                        * 1CE1C

* name -> n
* ROMPTR 002 0A7 VTYPE
* refs (1): 189EA
        CON(1)  8                                * 1CE21  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CE22  library
        CON(3)  #0A7                             * 1CE25  command
xVTYPE:
        ::                                       * 1CE28
          CK1&Dispatch                           * 1CE2D
          BINT6                                  * 1CE32
          vtype(nm)                              * 1CE37
          BINT7                                  * 1CE3C
          vtype(nm)                              * 1CE41
          BINT13                                 * 1CE46
          OBJ_1CE82                              * 1CE4B
        ;                                        * 1CE50

* refs (2): 1CE37 1CE41
vtype(nm):
        ::                                       * 1CE55
          SAFE@                                  * 1CE5A

* refs (1): 1CED2
OBJ_1CE5F:
          ::                                     * 1CE5F
            NOTcase                              * 1CE64
            %-1                                  * 1CE69
            XEQTYPE                              * 1CE6E
            SWAPDROP                             * 1CE73
          ;                                      * 1CE78
        ;                                        * 1CE7D

* refs (1): 1CE4B
OBJ_1CE82:
        ::                                       * 1CE82
          ERRSET                                 * 1CE87
          ::                                     * 1CE8C
            rcl(to)                              * 1CE91
            TRUE                                 * 1CE96
          ;                                      * 1CE9B
          ERRTRAP                                * 1CEA0
          ::                                     * 1CEA5
            ERROR@                               * 1CEAA
            #       204                          * 1CEAF  516
            #<>case                              * 1CEB9
            ERRJMP                               * 1CEBE
            ERRORCLR                             * 1CEC3
            FALSE                                * 1CEC8
          ;                                      * 1CECD
          OBJ_1CE5F                              * 1CED2
        ;                                        * 1CED7

* 'l=r' -> l r
* ROMPTR 002 0A8 EQ→
* refs (1): 189EA
        CON(1)  8                                * 1CEDC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CEDD  library
        CON(3)  #0A8                             * 1CEE0  command
xEQ>:
        ::                                       * 1CEE3
          CK1&Dispatch                           * 1CEE8
          BINT9                                  * 1CEED
          SPLITEQ                                * 1CEF2
          BINT1                                  * 1CEF7
          %0_2A2B4                               * 1CEFC
          BINT2                                  * 1CF01
          %0_2A2B4                               * 1CF06
          BINT6                                  * 1CF0B
          %0_2A2B4                               * 1CF10
          BINT7                                  * 1CF15
          %0_2A2B4                               * 1CF1A
          BINT14                                 * 1CF1F
          %0_2A2B4                               * 1CF24
        ;                                        * 1CF29

* sym -> arg1 arg2
* refs (4): 158A0 1CEF2 20D83 B4C37
SPLITEQ:
        ::                                       * 1CF2E
          INNERCOMP                              * 1CF33
          AEQ1stcase                             * 1CF38
          x=                                     * 1CF3D

* meta&ob -> 'M_rest''MetaLast'
drppargsym:
          ::                                     * 1CF42
            plDRPpZparg                          * 1CF47
            CKSYMBN                              * 1CF4C
            pshm1                                * 1CF51
            CKSYMBN                              * 1CF56
            SWAPDROP                             * 1CF5B
          ;                                      * 1CF60
          CKSYMBN                                * 1CF65
          %0_2A2B4                               * 1CF6A
        ;                                        * 1CF6F

* ob -> ?
* ROMPTR 002 0A9 OBJ→
* refs (12): 189EA D3647 D3BBA D3D99 D3D9E D3DD4 ...
        CON(1)  8                                * 1CF74  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CF75  library
        CON(3)  #0A9                             * 1CF78  command
xOBJ>:
        ::                                       * 1CF7B
          CK1&Dispatch                           * 1CF80
          BINT13                                 * 1CF85
          TAG>                                   * 1CF8A
          BINT2                                  * 1CF8F
          C%>%                                   * 1CF94
          BINT3                                  * 1CF99
          DOSTR>                                 * 1CF9E
          BINT4                                  * 1CFA3
          DOARRY>                                * 1CFA8
          BINT5                                  * 1CFAD
          XEQLIST>                               * 1CFB2
          BINT9                                  * 1CFB7
          EXPR>                                  * 1CFBC
          BINT14                                 * 1CFC1
          UMU>                                   * 1CFC6
        ;                                        * 1CFCB

* sym -> arg1..argn %n ob
* refs (1): 1CFBC
EXPR>:
        ::                                       * 1CFD0
          symcomp                                * 1CFD5
          EXPLODE                                * 1CFDA
          OBJ_5FA2C                              * 1CFDF
          NOTcase                                * 1CFE4
          MISLIBERR                              * 1CFE9
          SWAP                                   * 1CFEE
          UNCOERCE                               * 1CFF3
          SWAP                                   * 1CFF8
        ;                                        * 1CFFD

* x1..xn n -> [] x11...xnm {n m} -> [[]]
* ROMPTR 002 0AA →ARRY
* refs (4): 189EA D36AC D3E7E D40E2
        CON(1)  8                                * 1D002  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D003  library
        CON(3)  #0AA                             * 1D006  command
x>ARRY:
        ::                                       * 1D009
          CK1&Dispatch                           * 1D00E
          BINT5                                  * 1D013
          ->arry(li)                             * 1D018
          BINT1                                  * 1D01D
          XEQ>VECTOR                             * 1D022
        ;                                        * 1D027

* F%..F% %n -> [%F]
* refs (7): 1D022 1DEB1 1DF26 2C31F 4CB5E CC4F0 ...
XEQ>VECTOR:
        ::                                       * 1D02C
          ONE{}N                                 * 1D031
          XEQ>ARRAY                              * 1D036
        ;                                        * 1D03B

* refs (1): 1D018
->arry(li):
        ::                                       * 1D040
          DUPDUP                                 * 1D045
          OBJ_1DF30                              * 1D04A
          1GETABND                               * 1D04F

* F%..F% {#n #m} -> [F%]
* refs (5): 1D036 24861 24AB5 368EA 4CB4F
XEQ>ARRAY:
          ::                                     * 1D054
            COERCE{}2                            * 1D059
            DUPINCOMP                            * 1D05E
            #1=?SKIP                             * 1D063
            #*OVF                                * 1D068
            CKNFLOATS                            * 1D06D
            ROTSWAP                              * 1D072
            MAKEARRY                             * 1D077
            >ARRY                                * 1D07C
          ;                                      * 1D081
        ;                                        * 1D086

* [] -> x1...xn {n} [[]] -> x11...xnm {n m}
* ROMPTR 002 0AB ARRY→
* refs (1): 189EA
        CON(1)  8                                * 1D08B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D08C  library
        CON(3)  #0AB                             * 1D08F  command
xARRY>:
        ::                                       * 1D092
          CK1&Dispatch                           * 1D097
          BINT4                                  * 1D09C
          DOARRY>                                * 1D0A1
        ;                                        * 1D0A6

* [] -> F%..F% {#n #m}
* refs (4): 1CFA8 1D0A1 1DD5B 368D1
DOARRY>:
        ::                                       * 1D0AB
          ONE_DO_ARRY                            * 1D0B0
          INDEX@                                 * 1D0B5
          PULLEL                                 * 1D0BA
          SWAP                                   * 1D0BF
          LOOP                                   * 1D0C4
          DIMLIMITS                              * 1D0C9
          UNCOERCE{}2                            * 1D0CE
        ;                                        * 1D0D3

* ob size -> ob' name size -> ob= [] or [[]] size = {n} or {n m}
* ROMPTR 002 0AC RDM
* refs (1): 189EA
        CON(1)  8                                * 1D0D8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D0D9  library
        CON(3)  #0AC                             * 1D0DC  command
xRDM:
        ::                                       * 1D0DF
          CK2&Dispatch                           * 1D0E4
          BINT69                                 * 1D0E9
          rdm(ar,li)                             * 1D0EE
          BINT101                                * 1D0F3
          rdm(gn,li)                             * 1D0F8
          BINT117                                * 1D0FD
          rdm(ln,li)                             * 1D102
        ;                                        * 1D107

* refs (1): 1D0EE
rdm(ar,li):
        ::                                       * 1D10C
          OBJ_1DFDF                              * 1D111
          COERCE{}2                              * 1D116
          MATREDIM                               * 1D11B
        ;                                        * 1D120

* refs (1): 1D0F8
rdm(gn,li):
        ::                                       * 1D125
          OBJ_1DFDF                              * 1D12A
          over;RclInVars(nm)                     * 1D12F
          dup;ar?#BAT!                           * 1D134
          ROTDROPSWAP                            * 1D139
          COERCE{}2                              * 1D13E
          @rdm(ar,ls)                            * 1D143
          DROP                                   * 1D148
        ;                                        * 1D14D

* refs (1): 1D102
rdm(ln,li):
        ::                                       * 1D152
          OBJ_1DFDF                              * 1D157
          over;RclInVars(nm)                     * 1D15C
          dup;ar?#BAT!                           * 1D161
          SWAP                                   * 1D166
          COERCE{}2                              * 1D16B
          MATREDIM                               * 1D170
          sto(nm,_)                              * 1D175
        ;                                        * 1D17A

* { n } x -> [] { n k } x -> [[]] [] x -> []'
* ROMPTR 002 0AD CON
* refs (1): 189EA
        CON(1)  8                                * 1D17F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D180  library
        CON(3)  #0AD                             * 1D183  command
xCON:
        ::                                       * 1D186
          CK2&Dispatch                           * 1D18B
          BINT81                                 * 1D190
          con(li,nb)                             * 1D195
          BINT82                                 * 1D19A
          con(li,nb)                             * 1D19F
          BINT65                                 * 1D1A4
          MATCON                                 * 1D1A9
          BINT66                                 * 1D1AE
          con(ar,c)                              * 1D1B3
          BINT97                                 * 1D1B8
          con(gn,r)                              * 1D1BD
          BINT98                                 * 1D1C2
          con(gn,c)                              * 1D1C7
          BINT113                                * 1D1CC
          con(ln,r)                              * 1D1D1
          #       72                             * 1D1D6  114
          con(ln,c)                              * 1D1E0
        ;                                        * 1D1E5

* refs (2): 1D195 1D19F
con(li,nb):
        ::                                       * 1D1EA
          DUP                                    * 1D1EF
          OBJ_1DF30                              * 1D1F4
          3GETLAM                                * 1D1F9
          1ABNDSWAP                              * 1D1FE
          CK2NOLASTWD                            * 1D203
          SWAP                                   * 1D208
          COERCE{}2                              * 1D20D
          SWAP                                   * 1D212
          MAKEARRY                               * 1D217
        ;                                        * 1D21C

* refs (1): 1D1B3
con(ar,c):
        ::                                       * 1D221
          SWAP                                   * 1D226
          dup;ca?#BAT!                           * 1D22B
          SWAP                                   * 1D230
          MATCON                                 * 1D235
        ;                                        * 1D23A

* refs (1): 1D1BD
con(gn,r):
        ::                                       * 1D23F
          over;RclInVars(nm)                     * 1D244
          dup;ar?#BAT!                           * 1D249
          ROTDROPSWAP                            * 1D24E
          @con(ar,nb)                            * 1D253
          DROP                                   * 1D258
        ;                                        * 1D25D

* refs (1): 1D1C7
con(gn,c):
        ::                                       * 1D262
          over;RclInVars(nm)                     * 1D267
          dup;ar?#BAT!                           * 1D26C
          dup;ca?#BAT!                           * 1D271
          ROTDROPSWAP                            * 1D276
          @con(ar,nb)                            * 1D27B
          DROP                                   * 1D280
        ;                                        * 1D285

* refs (1): 1D1D1
con(ln,r):
        ::                                       * 1D28A
          over;RclInVars(nm)                     * 1D28F
          dup;ar?#BAT!                           * 1D294
          SWAP                                   * 1D299
          MATCON                                 * 1D29E
          sto(nm,_)                              * 1D2A3
        ;                                        * 1D2A8

* refs (1): 1D1E0
con(ln,c):
        ::                                       * 1D2AD
          over;RclInVars(nm)                     * 1D2B2
          dup;ar?#BAT!                           * 1D2B7
          dup;ca?#BAT!                           * 1D2BC
          SWAP                                   * 1D2C1
          MATCON                                 * 1D2C6
          sto(nm,_)                              * 1D2CB
        ;                                        * 1D2D0

* n -> [[]] [[]] -> [[]]' name -> [[]]
* ROMPTR 002 0AE IDN
* refs (1): 189EA
        CON(1)  8                                * 1D2D5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D2D6  library
        CON(3)  #0AE                             * 1D2D9  command
xIDN:
        ::                                       * 1D2DC
          CK1&Dispatch                           * 1D2E1
          BINT1                                  * 1D2E6
          idn(r)                                 * 1D2EB
          BINT4                                  * 1D2F0
          MATIDN                                 * 1D2F5
          BINT6                                  * 1D2FA
          idn(gn)                                * 1D2FF
          BINT7                                  * 1D304
          idn(ln)                                * 1D309
        ;                                        * 1D30E

* refs (1): 1D2EB
idn(r):
        ::                                       * 1D313
          COERCE                                 * 1D318
          DUP#0<>                                * 1D31D
          ?SKIP                                  * 1D322
          SETSIZEERR                             * 1D327
          DUP                                    * 1D32C
          TWO{}N                                 * 1D331
          %0_2A2B4                               * 1D336
          MAKEARRY                               * 1D33B
          MATIDN                                 * 1D340
        ;                                        * 1D345

* refs (1): 1D2FF
idn(gn):
        ::                                       * 1D34A
          dup;RclInVars(nm)                      * 1D34F
          dup;ar?#BAT!                           * 1D354
          SWAPDROP                               * 1D359
          @idn(ar)                               * 1D35E
          DROP                                   * 1D363
        ;                                        * 1D368

* refs (1): 1D309
idn(ln):
        ::                                       * 1D36D
          dup;RclInVars(nm)                      * 1D372
          dup;ar?#BAT!                           * 1D377
          MATIDN                                 * 1D37C
          sto(nm,_)                              * 1D381
        ;                                        * 1D386

* [[]] -> [[]]' name ->
* ROMPTR 002 0AF TRN
* refs (2): 189EA D4062
        CON(1)  8                                * 1D38B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D38C  library
        CON(3)  #0AF                             * 1D38F  command
xTRN:
        ::                                       * 1D392
          CK1&Dispatch                           * 1D397
          BINT4                                  * 1D39C
          MATTRN                                 * 1D3A1
          BINT6                                  * 1D3A6
          trn(gn)                                * 1D3AB
          BINT7                                  * 1D3B0
          trn(ln)                                * 1D3B5
        ;                                        * 1D3BA

* refs (1): 1D3AB
trn(gn):
        ::                                       * 1D3BF
          dup;RclInVars(nm)                      * 1D3C4
          dup;ar?#BAT!                           * 1D3C9
          SWAPDROP                               * 1D3CE
          @trn(ar)                               * 1D3D3
          DROP                                   * 1D3D8
        ;                                        * 1D3DD

* refs (1): 1D3B5
trn(ln):
        ::                                       * 1D3E2
          dup;RclInVars(nm)                      * 1D3E7
          dup;ar?#BAT!                           * 1D3EC
          MATTRN                                 * 1D3F1
          sto(nm,_)                              * 1D3F6
        ;                                        * 1D3FB

* ob pos obj -> ob' ob  = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B0 PUT
* refs (2): 189EA 1F947
        CON(1)  8                                * 1D400  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D401  library
        CON(3)  #0B0                             * 1D404  command
xPUT:
        ::                                       * 1D407
          CK3&Dispatch                           * 1D40C
          LISTREALOB                             * 1D411
          put(li,lr,_)                           * 1D416
          LISTLISTOB                             * 1D41B
          put(li,lr,_)                           * 1D420
          IDLISTOB                               * 1D425
          put(gn,lr,_)                           * 1D42A
          #       750                            * 1D42F  1872
          put(ln,lr,_)                           * 1D439
          IDREALOB                               * 1D43E
          put(gn,lr,_)                           * 1D443
          #       710                            * 1D448  1808
          put(ln,lr,_)                           * 1D452
          ARRYLISTREAL                           * 1D457
          put(ar,lr,nb)                          * 1D45C
          ARRYLISTCMP                            * 1D461
          put(ar,lr,nb)                          * 1D466
          ARRYREALREAL                           * 1D46B
          put(ar,lr,nb)                          * 1D470
          ARRYREALCMP                            * 1D475
          put(ar,lr,nb)                          * 1D47A
        ;                                        * 1D47F

* refs (2): 1D42A 1D443
put(gn,lr,_):
        ::                                       * 1D484
          OBJ_1E00C                              * 1D489
          3pick;RclInVars(nm)                    * 1D48E
          3UNROLL                                * 1D493
          CK&DISPATCH0                           * 1D498
          ARRYLISTREAL                           * 1D49D
          OBJ_1D501                              * 1D4A2
          ARRYLISTCMP                            * 1D4A7
          OBJ_1D501                              * 1D4AC
          ARRYREALREAL                           * 1D4B1
          OBJ_1D501                              * 1D4B6
          ARRYREALCMP                            * 1D4BB
          OBJ_1D501                              * 1D4C0
          LISTLISTOB                             * 1D4C5
          PutSto(nm,li,lr,_)                     * 1D4CA
          LISTREALOB                             * 1D4CF
          PutSto(nm,li,lr,_)                     * 1D4D4
        ;                                        * 1D4D9

* refs (5): 1D45C 1D466 1D470 1D47A 1D5C9
put(ar,lr,nb):
        ::                                       * 1D4DE
          OBJ_1E00C                              * 1D4E3
          OBJ_1DCC3                              * 1D4E8
          OBJ_1DC55                              * 1D4ED
          ABND                                   * 1D4F2
          BANGARRY                               * 1D4F7
        ;                                        * 1D4FC

* refs (4): 1D4A2 1D4AC 1D4B6 1D4C0
OBJ_1D501:
        ::                                       * 1D501
          4ROLLDROP                              * 1D506
          OBJ_1DCC3                              * 1D50B
          OBJ_1DC55                              * 1D510
          ABND                                   * 1D515
          @put(nb,s,ar)                          * 1D51A
        ;                                        * 1D51F

* refs (3): 1D416 1D420 1D556
put(li,lr,_):
        ::                                       * 1D524
          OBJ_1E00C                              * 1D529
          3UNROLL                                * 1D52E
          OBJ_1DB5B                              * 1D533
          SWAP                                   * 1D538
          ABND                                   * 1D53D
          PUTLIST                                * 1D542
        ;                                        * 1D547

* refs (4): 1D4CA 1D4D4 1D5AB 1D5B5
PutSto(nm,li,lr,_):
        ::                                       * 1D54C
          'EvalNoCK:_sup                         * 1D551
          put(li,lr,_)                           * 1D556
          sto(nm,_)                              * 1D55B
        ;                                        * 1D560

* refs (2): 1D439 1D452
put(ln,lr,_):
        ::                                       * 1D565
          OBJ_1E00C                              * 1D56A
          3pick;RclInVars(nm)                    * 1D56F
          3UNROLL                                * 1D574
          CK&DISPATCH0                           * 1D579
          ARRYLISTREAL                           * 1D57E
          PutSto(nm,ar,ln,nb)                    * 1D583
          ARRYLISTCMP                            * 1D588
          PutSto(nm,ar,ln,nb)                    * 1D58D
          ARRYREALREAL                           * 1D592
          PutSto(nm,ar,ln,nb)                    * 1D597
          ARRYREALCMP                            * 1D59C
          PutSto(nm,ar,ln,nb)                    * 1D5A1
          LISTLISTOB                             * 1D5A6
          PutSto(nm,li,lr,_)                     * 1D5AB
          LISTREALOB                             * 1D5B0
          PutSto(nm,li,lr,_)                     * 1D5B5
        ;                                        * 1D5BA

* refs (4): 1D583 1D58D 1D597 1D5A1
PutSto(nm,ar,ln,nb):
        ::                                       * 1D5BF
          'EvalNoCK:_sup                         * 1D5C4
          put(ar,lr,nb)                          * 1D5C9
          sto(nm,_)                              * 1D5CE
        ;                                        * 1D5D3

* ob pos obj -> [] pos' ob  = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B1 PUTI
* refs (1): 189EA
        CON(1)  8                                * 1D5D8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D5D9  library
        CON(3)  #0B1                             * 1D5DC  command
xPUTI:
        ::                                       * 1D5DF
          CK3&Dispatch                           * 1D5E4
          LISTREALOB                             * 1D5E9
          puti(li,lr,_)                          * 1D5EE
          LISTLISTOB                             * 1D5F3
          puti(li,lr,_)                          * 1D5F8
          IDLISTOB                               * 1D5FD
          puti(gn,lr,_)                          * 1D602
          IDREALOB                               * 1D607
          puti(gn,lr,_)                          * 1D60C
          #       750                            * 1D611  1872
          puti(ln,lr,_)                          * 1D61B
          #       710                            * 1D620  1808
          puti(ln,lr,_)                          * 1D62A
          ARRYLISTREAL                           * 1D62F
          puti(ar,lr,nb)                         * 1D634
          ARRYLISTCMP                            * 1D639
          puti(ar,lr,nb)                         * 1D63E
          ARRYREALREAL                           * 1D643
          puti(ar,lr,nb)                         * 1D648
          ARRYREALCMP                            * 1D64D
          puti(ar,lr,nb)                         * 1D652
        ;                                        * 1D657

* refs (2): 1D602 1D60C
puti(gn,lr,_):
        ::                                       * 1D65C
          OBJ_1E00C                              * 1D661
          3pick;RclInVars(nm)                    * 1D666
          3UNROLL                                * 1D66B
          CK&DISPATCH0                           * 1D670
          ARRYLISTREAL                           * 1D675
          @puti(ar,lr,nb)                        * 1D67A
          ARRYLISTCMP                            * 1D67F
          @puti(ar,lr,nb)                        * 1D684
          ARRYREALREAL                           * 1D689
          @puti(ar,lr,nb)                        * 1D68E
          ARRYREALCMP                            * 1D693
          @puti(ar,lr,nb)                        * 1D698
          LISTLISTOB                             * 1D69D
          PutiSto(nm,li,lr,_)                    * 1D6A2
          LISTREALOB                             * 1D6A7
          PutiSto(nm,li,lr,_)                    * 1D6AC
        ;                                        * 1D6B1

* refs (5): 1D634 1D63E 1D648 1D652 1D7AB
puti(ar,lr,nb):
        ::                                       * 1D6B6
          OBJ_1E00C                              * 1D6BB
          OBJ_1DCC3                              * 1D6C0
          OBJ_1DC55                              * 1D6C5
          OBJ_1DA02                              * 1D6CA
          BANGARRY                               * 1D6CF
          1GETABND                               * 1D6D4
        ;                                        * 1D6D9

* refs (4): 1D67A 1D684 1D68E 1D698
@puti(ar,lr,nb):
        ::                                       * 1D6DE
          OBJ_1DCC3                              * 1D6E3
          OBJ_1DC55                              * 1D6E8
          OBJ_1DA02                              * 1D6ED
          @put(nb,s,ar)                          * 1D6F2
          1GETABND                               * 1D6F7
        ;                                        * 1D6FC

* refs (3): 1D5EE 1D5F8 1D733
puti(li,lr,_):
        ::                                       * 1D701
          OBJ_1E00C                              * 1D706
          3UNROLL                                * 1D70B
          OBJ_1DB5B                              * 1D710
          OBJ_1DAED                              * 1D715
          PUTLIST                                * 1D71A
          1GETABND                               * 1D71F
        ;                                        * 1D724

* refs (4): 1D6A2 1D6AC 1D78D 1D797
PutiSto(nm,li,lr,_):
        ::                                       * 1D729
          'EvalNoCK:_sup                         * 1D72E
          puti(li,lr,_)                          * 1D733
          SWAP3PICK                              * 1D738
          SAFESTO                                * 1D73D
        ;                                        * 1D742

* refs (2): 1D61B 1D62A
puti(ln,lr,_):
        ::                                       * 1D747
          OBJ_1E00C                              * 1D74C
          3pick;RclInVars(nm)                    * 1D751
          3UNROLL                                * 1D756
          CK&DISPATCH0                           * 1D75B
          ARRYLISTREAL                           * 1D760
          PutiLSto(ln,ar,lr,nb)                  * 1D765
          ARRYLISTCMP                            * 1D76A
          PutiLSto(ln,ar,lr,nb)                  * 1D76F
          ARRYREALREAL                           * 1D774
          PutiLSto(ln,ar,lr,nb)                  * 1D779
          ARRYREALCMP                            * 1D77E
          PutiLSto(ln,ar,lr,nb)                  * 1D783
          LISTLISTOB                             * 1D788
          PutiSto(nm,li,lr,_)                    * 1D78D
          LISTREALOB                             * 1D792
          PutiSto(nm,li,lr,_)                    * 1D797
        ;                                        * 1D79C

* refs (4): 1D765 1D76F 1D779 1D783
PutiLSto(ln,ar,lr,nb):
        ::                                       * 1D7A1
          'EvalNoCK:_sup                         * 1D7A6
          puti(ar,lr,nb)                         * 1D7AB
          SWAP3PICK                              * 1D7B0
          STO                                    * 1D7B5
        ;                                        * 1D7BA

* ob n -> elm ob = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B2 GET
* refs (4): 189EA 1F85C D2F7C D2F94
        CON(1)  8                                * 1D7BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D7C0  library
        CON(3)  #0B2                             * 1D7C3  command
xGET:
        ::                                       * 1D7C6
          CK2&Dispatch                           * 1D7CB
          BINT69                                 * 1D7D0
          get(ar,lr)                             * 1D7D5
          BINT65                                 * 1D7DA
          get(ar,lr)                             * 1D7DF
          BINT85                                 * 1D7E4
          get(cp,lr)                             * 1D7E9
          BINT81                                 * 1D7EE
          get(cp,lr)                             * 1D7F3
          BINT101                                * 1D7F8
          get(nm,lr)                             * 1D7FD
          BINT117                                * 1D802
          get(nm,lr)                             * 1D807
          BINT97                                 * 1D80C
          get(nm,lr)                             * 1D811
          BINT113                                * 1D816
          get(nm,lr)                             * 1D81B
        ;                                        * 1D820

* refs (4): 1D7FD 1D807 1D811 1D81B
get(nm,lr):
        ::                                       * 1D825
          OBJ_1DFDF                              * 1D82A
          over;RclInVars(nm)                     * 1D82F
          ROTDROPSWAP                            * 1D834
          CK&DISPATCH0                           * 1D839
          BINT69                                 * 1D83E
          Get!(ar,lr)                            * 1D843
          BINT65                                 * 1D848
          Get!(ar,lr)                            * 1D84D
          BINT85                                 * 1D852
          Get!(cp,lr)                            * 1D857
          BINT81                                 * 1D85C
          Get!(cp,lr)                            * 1D861
        ;                                        * 1D866

* refs (2): 1D7D5 1D7DF
get(ar,lr):
        ::                                       * 1D86B
          OBJ_1DFDF                              * 1D870

* refs (2): 1D843 1D84D
Get!(ar,lr):
          ::                                     * 1D875
            OBJ_1DC6E                            * 1D87A
            ABND                                 * 1D87F
            PULLEL                               * 1D884
            SWAPDROP                             * 1D889
          ;                                      * 1D88E
        ;                                        * 1D893

* refs (2): 1D7E9 1D7F3
get(cp,lr):
        ::                                       * 1D898
          OBJ_1DFDF                              * 1D89D

* refs (2): 1D857 1D861
Get!(cp,lr):
          ::                                     * 1D8A2
            OBJ_1DB5B                            * 1D8A7
            ABND                                 * 1D8AC
            NTHCOMPDROP                          * 1D8B1
          ;                                      * 1D8B6
        ;                                        * 1D8BB

* ob pos -> ob' pos' elm ob = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B3 GETI
* refs (1): 189EA
        CON(1)  8                                * 1D8C0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D8C1  library
        CON(3)  #0B3                             * 1D8C4  command
xGETI:
        ::                                       * 1D8C7
          CK2&Dispatch                           * 1D8CC
          BINT69                                 * 1D8D1
          geti(ar,lr)                            * 1D8D6
          BINT65                                 * 1D8DB
          geti(ar,lr)                            * 1D8E0
          BINT85                                 * 1D8E5
          geti!(cp,lr)                           * 1D8EA
          BINT81                                 * 1D8EF
          geti!(cp,lr)                           * 1D8F4
          BINT101                                * 1D8F9
          geti(nm,lr)                            * 1D8FE
          BINT117                                * 1D903
          geti(nm,lr)                            * 1D908
          BINT97                                 * 1D90D
          geti(nm,lr)                            * 1D912
          BINT113                                * 1D917
          geti(nm,lr)                            * 1D91C
        ;                                        * 1D921

* refs (4): 1D8FE 1D908 1D912 1D91C
geti(nm,lr):
        ::                                       * 1D926
          OBJ_1DFDF                              * 1D92B
          over;RclInVars(nm)                     * 1D930
          SWAP                                   * 1D935
          CK&DISPATCH0                           * 1D93A
          BINT69                                 * 1D93F
          OBJ_1D9A8                              * 1D944
          BINT65                                 * 1D949
          OBJ_1D9A8                              * 1D94E
          BINT85                                 * 1D953
          OBJ_1D9E9                              * 1D958
          BINT81                                 * 1D95D
          OBJ_1D9E9                              * 1D962
        ;                                        * 1D967

* refs (2): 1D8D6 1D8E0
geti(ar,lr):
        ::                                       * 1D96C
          OBJ_1DFDF                              * 1D971

* refs (2): 1D9AD 31B60
geti(cp,lr):
          ::                                     * 1D976
            OBJ_1DC6E                            * 1D97B
            SWAP                                 * 1D980
            OBJ_1DA02                            * 1D985
            SWAP                                 * 1D98A
            PULLEL                               * 1D98F
            1GETABND                             * 1D994
            SWAP                                 * 1D999
          ;                                      * 1D99E
        ;                                        * 1D9A3

* refs (2): 1D944 1D94E
OBJ_1D9A8:
        ::                                       * 1D9A8
          geti(cp,lr)                            * 1D9AD
          ROTDROP                                * 1D9B2
        ;                                        * 1D9B7

* refs (3): 1D8EA 1D8F4 1D9F3
geti!(cp,lr):
        ::                                       * 1D9BC
          OBJ_1DFDF                              * 1D9C1
          OBJ_1DB5B                              * 1D9C6
          OBJ_1DAED                              * 1D9CB
          DUPROT                                 * 1D9D0
          NTHCOMPDROP                            * 1D9D5
          1GETABND                               * 1D9DA
          SWAP                                   * 1D9DF
        ;                                        * 1D9E4

* refs (2): 1D958 1D962
OBJ_1D9E9:
        ::                                       * 1D9E9
          'EvalNoCK:_sup                         * 1D9EE
          geti!(cp,lr)                           * 1D9F3
          ROTDROP                                * 1D9F8
        ;                                        * 1D9FD

* refs (3): 1D6CA 1D6ED 1D985
OBJ_1DA02:
        ::                                       * 1DA02
          BINT64                                 * 1DA07
          ClrSysFlag                             * 1DA0C
          2DUP                                   * 1DA11
          1GETLAM                                * 1DA16
          REALcase                               * 1DA1B
          ::                                     * 1DA20
            ARSIZE                               * 1DA25
            OBJ_1DB29                            * 1DA2A
            1PUTLAM                              * 1DA2F
          ;                                      * 1DA34
          DIMLIMITS                              * 1DA39
          INNER#1=                               * 1DA3E
          case                                   * 1DA43
          ::                                     * 1DA48
            OBJ_1DB29                            * 1DA4D
            ONE{}N                               * 1DA52
            1PUTLAM                              * 1DA57
          ;                                      * 1DA5C
          2DUP                                   * 1DA61
          #*                                     * 1DA66
          4PICK                                  * 1DA6B
          #=ITE                                  * 1DA70
          ::                                     * 1DA75
            3DROP                                * 1DA7A
            ONEONE                               * 1DA7F
            BINT64                               * 1DA84
            SetSysFlag                           * 1DA89
          ;                                      * 1DA8E
          ::                                     * 1DA93
            ROT#1+                               * 1DA98
            ROTDROP                              * 1DA9D
            OVER                                 * 1DAA2
            #/                                   * 1DAA7
            OVER#0=                              * 1DAAC
            ITE                                  * 1DAB1
            SWAP                                 * 1DAB6

* ob ob' # -> ob' #+1 ob
#1+ROT:
            ::                                   * 1DABB
              #1+                                * 1DAC0
              ROT                                * 1DAC5
            ;                                    * 1DACA
            DROPSWAP                             * 1DACF
          ;                                      * 1DAD4
          UNCOERCE2                              * 1DAD9
          TWO{}N                                 * 1DADE
          1PUTLAM                                * 1DAE3
        ;                                        * 1DAE8

* refs (2): 1D715 1D9CB
OBJ_1DAED:
        ::                                       * 1DAED
          BINT64                                 * 1DAF2
          ClrSysFlag                             * 1DAF7
          SWAP2DUP                               * 1DAFC
          LENCOMP                                * 1DB01
          OBJ_1DB29                              * 1DB06
          1GETLAM                                * 1DB0B
          REALcase                               * 1DB10
          1PUTLAM                                * 1DB15
          ONE{}N                                 * 1DB1A
          1PUTLAM                                * 1DB1F
        ;                                        * 1DB24

* refs (3): 1DA2A 1DA4D 1DB06
OBJ_1DB29:
        ::                                       * 1DB29
          #=casedrop                             * 1DB2E
          ::                                     * 1DB33
            %1                                   * 1DB38
            BINT64                               * 1DB3D
            SetSysFlag                           * 1DB42
          ;                                      * 1DB47
          #1+                                    * 1DB4C
          UNCOERCE                               * 1DB51
        ;                                        * 1DB56

* refs (4): 1D533 1D710 1D8A7 1D9C6
OBJ_1DB5B:
        ::                                       * 1DB5B
          DUP1LAMBIND                            * 1DB60
          DUPTYPEREAL?                           * 1DB65
          ?SKIP                                  * 1DB6A

break;<>1?:BAV!:
          ::                                     * 1DB6F
            INNERCOMP                            * 1DB74
            #1<>                                 * 1DB79
            caseSIZEERR                          * 1DB7E
          ;                                      * 1DB83
          COERCE                                 * 1DB88
          DUP#0=case                             * 1DB8D
          SETSIZEERR                             * 1DB92
          OVER                                   * 1DB97
          LENCOMP                                * 1DB9C
          OVER#<                                 * 1DBA1
          caseSIZEERR                            * 1DBA6
        ;                                        * 1DBAB

* el # M -> M'
* refs (9): 1D4F7 1D6CF 8E383 8EF00 8F04E 8F159 ...
BANGARRY:
        ::                                       * 1DBB0
          CKREF                                  * 1DBB5
          3UNROLL                                * 1DBBA
          PUTEL                                  * 1DBBF
        ;                                        * 1DBC4

* refs (2): 1D51A 1D6F2
@put(nb,s,ar):
        ::                                       * 1DBC9
          REFERENCED?                            * 1DBCE
          IT                                     * 1DBD3
          ::                                     * 1DBD8
            TOTEMPOBADJ                          * 1DBDD
            SWAPDROP                             * 1DBE2
          ;                                      * 1DBE7
          3UNROLL                                * 1DBEC
          PUTEL                                  * 1DBF1
          DROP                                   * 1DBF6
        ;                                        * 1DBFB

* ob #i {} -> {}'
* refs (15): 1D542 1D71A 41EFA 41F04 4364E 9E0F0 ...
PUTLIST:
        ::                                       * 1DC00
          3UNROLL                                * 1DC05
          2NULLLAM{}                             * 1DC0A
          BIND                                   * 1DC0F
          INNERDUP                               * 1DC14
          1GETLAM                                * 1DC19
          #-                                     * 1DC1E
          #2+ROLL                                * 1DC23
          DROP                                   * 1DC28
          2GETLAM                                * 1DC2D
          OVER                                   * 1DC32
          1GETLAM                                * 1DC37
          #-                                     * 1DC3C
          #2+UNROLL                              * 1DC41
          ABND                                   * 1DC46
          {}N                                    * 1DC4B
        ;                                        * 1DC50

* refs (4): 1D4ED 1D510 1D6C5 1D6E8
OBJ_1DC55:
        ::                                       * 1DC55
          3UNROLL                                * 1DC5A
          OBJ_1DC6E                              * 1DC5F
          SWAP                                   * 1DC64
        ;                                        * 1DC69

* refs (3): 1D87A 1D97B 1DC5F
OBJ_1DC6E:
        ::                                       * 1DC6E
          DUP1LAMBIND                            * 1DC73
          dLISTcase                              * 1DC78

chk(ar,lr):
          ::                                     * 1DC7D
            COERCE{}2                            * 1DC82
            OVER                                 * 1DC87
            ARRYEL?                              * 1DC8C
            ?SKIP                                * 1DC91
            SETSIZEERR                           * 1DC96
          ;                                      * 1DC9B
          COERCE                                 * 1DCA0
          DUP#0=case                             * 1DCA5
          SETSIZEERR                             * 1DCAA
          OVERARSIZE                             * 1DCAF
          OVER#<                                 * 1DCB4
          caseSIZEERR                            * 1DCB9
        ;                                        * 1DCBE

* refs (4): 1D4E8 1D50B 1D6C0 1D6E3
OBJ_1DCC3:
        ::                                       * 1DCC3
          3PICK                                  * 1DCC8
          TYPERARRY?                             * 1DCCD
          OVER                                   * 1DCD2
          REALcase                               * 1DCD7
          ::                                     * 1DCDC
            ?SEMI                                * 1DCE1
            Re>C%                                * 1DCE6
          ;                                      * 1DCEB
          NOT?SEMI                               * 1DCF0
          SETTYPEERR                             * 1DCF5
        ;                                        * 1DCFA

* []/() -> x y -> x y z (in current co-system)
* ROMPTR 002 0B4 V→
* refs (1): 189EA
        CON(1)  8                                * 1DCFF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DD00  library
        CON(3)  #0B4                             * 1DD03  command
xV>:
        ::                                       * 1DD06
          CK1&Dispatch                           * 1DD0B
          BINT2                                  * 1DD10
          v->(c)                                 * 1DD15
          BINT4                                  * 1DD1A
          v->(ar)                                * 1DD1F
        ;                                        * 1DD24

* refs (2): 1DD15 68C56
v->(c):
        ::                                       * 1DD29
          OBJ_1DE19                              * 1DD2E
          %%>%                                   * 1DD33
        ;                                        * 1DD38

* refs (1): 1DD1F
v->(ar):
        ::                                       * 1DD3D
          OBJ_1DD51                              * 1DD42
          %%>%                                   * 1DD47
        ;                                        * 1DD4C

* refs (2): 174D7 1DD42
OBJ_1DD51:
        ::                                       * 1DD51
          dup;ra?#BAT!                           * 1DD56
          DOARRY>                                * 1DD5B
          INNERCOMP                              * 1DD60
          #1=                                    * 1DD65
          OBJ_37DE1                              * 1DD6A
          %2                                     * 1DD6F
          EQcasedrop                             * 1DD74
          OBJ_1DE28                              * 1DD79
          %3                                     * 1DD7E
          %<>                                    * 1DD83
          case                                   * 1DD88
          SKIP                                   * 1DD8D
          BINT16                                 * 1DD92
          TestSysFlag                            * 1DD97
          NOTcase                                * 1DD9C
          SKIP                                   * 1DDA1
          3UNROLL                                * 1DDA6
          2%>%%                                  * 1DDAB
          %%R>P                                  * 1DDB0
          BINT15                                 * 1DDB5
          TestSysFlag                            * 1DDBA
          IT                                     * 1DDBF
          ::                                     * 1DDC4
            ROT                                  * 1DDC9
            %>%%                                 * 1DDCE
            ROT                                  * 1DDD3
            %%R>P                                * 1DDD8
            2@REVAL                              * 1DDDD
            SWAPROT                              * 1DDE2
          ;                                      * 1DDE7

* refs (1): 1DE4B
OBJ_1DDEC:
          ::                                     * 1DDEC
            2@REVAL                              * 1DDF1
            SWAP                                 * 1DDF6
            2@REVAL                              * 1DDFB
            SWAP                                 * 1DE00
          ;                                      * 1DE05
          ROT                                    * 1DE0A
          COLASKIP                               * 1DE0F
        ;                                        * 1DE14

* refs (3): 17572 1DD2E 352CD
OBJ_1DE19:
        ::                                       * 1DE19
          C%>%                                   * 1DE1E
          COLA                                   * 1DE23

* refs (1): 1DD79
OBJ_1DE28:
          ::                                     * 1DE28
            BINT16                               * 1DE2D
            TestSysFlag                          * 1DE32
            NOTcase                              * 1DE37
            SKIP                                 * 1DE3C
            2%>%%                                * 1DE41
            %%R>P                                * 1DE46
            OBJ_1DDEC                            * 1DE4B
            COLASKIP                             * 1DE50
          ;                                      * 1DE55
        ;                                        * 1DE5A

* x y -> [] -> ()
* ROMPTR 002 0B5 →V2
* refs (1): 189EA
        CON(1)  8                                * 1DE5F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DE60  library
        CON(3)  #0B5                             * 1DE63  command
x>V2:
        ::                                       * 1DE66
          CK2&Dispatch                           * 1DE6B
          BINT17                                 * 1DE70
          OBJ_1DE7F                              * 1DE75
        ;                                        * 1DE7A

* refs (1): 1DE75
OBJ_1DE7F:
        ::                                       * 1DE7F
          BINT16                                 * 1DE84
          TestSysFlag                            * 1DE89
          IT                                     * 1DE8E
          %POL>%REC                              * 1DE93
          BINT19                                 * 1DE98
          TestSysFlag                            * 1DE9D
          case                                   * 1DEA2
          %>C%                                   * 1DEA7
          %2                                     * 1DEAC
          XEQ>VECTOR                             * 1DEB1
        ;                                        * 1DEB6

* x y z -> []
* ROMPTR 002 0B6 →V3
* refs (1): 189EA
        CON(1)  8                                * 1DEBB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DEBC  library
        CON(3)  #0B6                             * 1DEBF  command
x>V3:
        ::                                       * 1DEC2
          CK3&Dispatch                           * 1DEC7
          3REAL                                  * 1DECC
          ->v3(3r)                               * 1DED1
        ;                                        * 1DED6

* refs (1): 1DED1
->v3(3r):
        ::                                       * 1DEDB
          BINT16                                 * 1DEE0
          TestSysFlag                            * 1DEE5
          IT                                     * 1DEEA
          ::                                     * 1DEEF
            BINT15                               * 1DEF4
            SysITE                               * 1DEF9
            %SPH>%REC                            * 1DEFE
            ::                                   * 1DF03
              3UNROLL                            * 1DF08
              %POL>%REC                          * 1DF0D
              ROT                                * 1DF12
            ;                                    * 1DF17
          ;                                      * 1DF1C
          %3                                     * 1DF21
          XEQ>VECTOR                             * 1DF26
        ;                                        * 1DF2B

* refs (11): 1D04A 1D1F4 1DFF3 1E025 330C6 C1677 ...
OBJ_1DF30:
        ::                                       * 1DF30
          3PICK                                  * 1DF35
          NULLCOMP?                              * 1DF3A
          caseSIZEERR                            * 1DF3F
          NULL{}                                 * 1DF44
          DUP                                    * 1DF49
          4NULLLAM{}                             * 1DF4E
          BIND                                   * 1DF53
          >R                                     * 1DF58
L_1DF5D:
          ticR                                   * 1DF5D
          NOT?SEMI                               * 1DF62
          DUPTYPEREAL?                           * 1DF67
          ?SKIP                                  * 1DF6C
          ::                                     * 1DF71
            CRUNCH                               * 1DF76
            CK1NoBlame                           * 1DF7B
            CK&DISPATCH1                         * 1DF80
            BINT1                                * 1DF85
            NOP                                  * 1DF8A
            BINT2                                * 1DF8F
            C>Re%                                * 1DF94
            BINT14                               * 1DF99
            ::                                   * 1DF9E
              DUP                                * 1DFA3
              2PUTLAM                            * 1DFA8
              U>nbr                              * 1DFAD
            ;                                    * 1DFB2
          ;                                      * 1DFB7
          1GETLAM                                * 1DFBC
          SWAP                                   * 1DFC1
          >TCOMP                                 * 1DFC6
          1PUTLAM                                * 1DFCB
          GOTO                                   * 1DFD0
          L_1DF5D                                * 1DFD5
        ;                                        * 1DFDA

* refs (10): 1D111 1D12A 1D157 1D82A 1D870 1D89D ...
OBJ_1DFDF:
        ::                                       * 1DFDF
          DUPTYPEREAL?                           * 1DFE4
          ?SEMI                                  * 1DFE9
          SWAPDUP                                * 1DFEE
          OBJ_1DF30                              * 1DFF3
          3GETLAM                                * 1DFF8
          1GETABND                               * 1DFFD
          CK2NOLASTWD                            * 1E002
        ;                                        * 1E007

* refs (8): 1D489 1D4E3 1D529 1D56A 1D661 1D6BB ...
OBJ_1E00C:
        ::                                       * 1E00C
          OVER                                   * 1E011
          TYPEREAL?                              * 1E016
          ?SEMI                                  * 1E01B
          ROT                                    * 1E020
          OBJ_1DF30                              * 1E025
          3GETLAM                                * 1E02A
          4GETLAM                                * 1E02F
          1ABNDSWAP                              * 1E034
          CK3NOLASTWD                            * 1E039
        ;                                        * 1E03E

* name -> {name} -> {name x1 x2} -> {x1 x2} -> x1 x2 ->
* ROMPTR 002 0B7 INDEP
* refs (6): 189EA 47A83 D372E D3902 D39BB D3AAA
        CON(1)  8                                * 1E043  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E044  library
        CON(3)  #0B7                             * 1E047  command
xINDEP:
        ::                                       * 1E04A
          CK1&Dispatch                           * 1E04F
          BINT6                                  * 1E054
          PUTINDEP                               * 1E059
          BINT5                                  * 1E05E
          PUTINDEPLIST                           * 1E063
          BINT1                                  * 1E068
          indep(2r)                              * 1E06D
        ;                                        * 1E072

* (x,y) ->
* ROMPTR 002 0B8 PMIN
* refs (1): 189EA
        CON(1)  8                                * 1E077  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E078  library
        CON(3)  #0B8                             * 1E07B  command
xPMIN:
        ::                                       * 1E07E
          CK1&Dispatch                           * 1E083
          BINT2                                  * 1E088
          pmin(c)                                * 1E08D
        ;                                        * 1E092

* (x,y) ->
* ROMPTR 002 0B9 PMAX
* refs (1): 189EA
        CON(1)  8                                * 1E097  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E098  library
        CON(3)  #0B9                             * 1E09B  command
xPMAX:
        ::                                       * 1E09E
          CK1&Dispatch                           * 1E0A3
          BINT2                                  * 1E0A8
          pmax(c)                                * 1E0AD
        ;                                        * 1E0B2

* c -> {c tick $x $y } ->
* ROMPTR 002 0BA AXES
* refs (2): 189EA D37E0
        CON(1)  8                                * 1E0B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E0B8  library
        CON(3)  #0BA                             * 1E0BB  command
xAXES:
        ::                                       * 1E0BE
          CK1&Dispatch                           * 1E0C3
          BINT2                                  * 1E0C8
          ax*s(c)                                * 1E0CD
          BINT5                                  * 1E0D2
          ax*s(li)                               * 1E0D7
        ;                                        * 1E0DC

* (x,y) -> x     ->
* ROMPTR 002 0BB CENTR
* refs (1): 189EA
        CON(1)  8                                * 1E0E1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E0E2  library
        CON(3)  #0BB                             * 1E0E5  command
xCENTR:
        ::                                       * 1E0E8
          CK1&Dispatch                           * 1E0ED
          BINT2                                  * 1E0F2
          centr(c)                               * 1E0F7
          BINT1                                  * 1E0FC

centr(r):
          ::                                     * 1E101
            %0_2A2B4                             * 1E106
            %>C%                                 * 1E10B
            centr(c)                             * 1E110
          ;                                      * 1E115
        ;                                        * 1E11A

* n_int -> #n_int ->
* ROMPTR 002 0BC RES
* refs (3): 189EA D37FA D3A88
        CON(1)  8                                * 1E11F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E120  library
        CON(3)  #0BC                             * 1E123  command
xRES:
        ::                                       * 1E126
          CK1&Dispatch                           * 1E12B
          BINT1                                  * 1E130
          res(r)                                 * 1E135
          BINT11                                 * 1E13A
          PUTRES                                 * 1E13F
        ;                                        * 1E144

* xf ->
* ROMPTR 002 0BD *H
* refs (1): 189EA
        CON(1)  8                                * 1E149  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E14A  library
        CON(3)  #0BD                             * 1E14D  command
x*H:
        ::                                       * 1E150
          CK1&Dispatch                           * 1E155
          BINT1                                  * 1E15A
          VSCALE                                 * 1E15F
        ;                                        * 1E164

* yf ->
* ROMPTR 002 0BE *W
* refs (1): 189EA
        CON(1)  8                                * 1E169  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E16A  library
        CON(3)  #0BE                             * 1E16D  command
x*W:
        ::                                       * 1E170
          CK1&Dispatch                           * 1E175
          BINT1                                  * 1E17A
          HSCALE                                 * 1E17F
        ;                                        * 1E184

* ->
* ROMPTR 002 0BF DRAW
* refs (15): 189EA C67F7 C6806 D308E D31C9 D336C ...
        CON(1)  8                                * 1E189  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E18A  library
        CON(3)  #0BF                             * 1E18D  command
xDRAW:
        ::                                       * 1E190
          CK0                                    * 1E195
          draw                                   * 1E19A
        ;                                        * 1E19F

* ->
* ROMPTR 002 0C0 AUTO
* refs (1): 189EA
        CON(1)  8                                * 1E1A4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1A5  library
        CON(3)  #0C0                             * 1E1A8  command
xAUTO:
        ::                                       * 1E1AB
          CK0                                    * 1E1B0
          AUTOSCALE                              * 1E1B5
        ;                                        * 1E1BA

* ->
* ROMPTR 002 0C1 DRAX
* refs (7): 189EA D37FF D38A3 D3938 D3A22 D3B17 ...
        CON(1)  8                                * 1E1BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1C0  library
        CON(3)  #0C1                             * 1E1C3  command
xDRAX:
        ::                                       * 1E1C6
          CK0                                    * 1E1CB
          drax                                   * 1E1D0
        ;                                        * 1E1D5

* xs ys ->
* ROMPTR 002 0C2 SCALE
* refs (1): 189EA
        CON(1)  8                                * 1E1DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1DB  library
        CON(3)  #0C2                             * 1E1DE  command
xSCALE:
        ::                                       * 1E1E1
          CK2&Dispatch                           * 1E1E6
          BINT17                                 * 1E1EB
          PUTSCALE                               * 1E1F0
        ;                                        * 1E1F5

* (xmin,ymin) (xmax,ymax) -> #width #height ->
* ROMPTR 002 0C3 PDIM
* refs (1): 189EA
        CON(1)  8                                * 1E1FA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1FB  library
        CON(3)  #0C3                             * 1E1FE  command
xPDIM:
        ::                                       * 1E201
          CK2&Dispatch                           * 1E206
          BINT34                                 * 1E20B
          pdim(2c)                               * 1E210
          2HXS                                   * 1E215
          pdim(2b)                               * 1E21A
        ;                                        * 1E21F

* name -> {name} -> {name y1 y2} -> {y1 y2} -> y1 y2 ->
* ROMPTR 002 0C4 DEPND
* refs (3): 189EA 47AA6 D3794
        CON(1)  8                                * 1E224  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E225  library
        CON(3)  #0C4                             * 1E228  command
xDEPND:
        ::                                       * 1E22B
          CK1&Dispatch                           * 1E230
          BINT6                                  * 1E235
          depnd(gn)                              * 1E23A
          BINT5                                  * 1E23F
          depnd(li)                              * 1E244
          BINT1                                  * 1E249
          OBJ_47A8D                              * 1E24E
        ;                                        * 1E253

* ->
* ROMPTR 002 0C5 ERASE
* refs (1): 189EA
        CON(1)  8                                * 1E258  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E259  library
        CON(3)  #0C5                             * 1E25C  command
xERASE:
        ::                                       * 1E25F
          CK0                                    * 1E264
          DOERASE                                * 1E269
        ;                                        * 1E26E

* {#m #n} -> (x,y)
* ROMPTR 002 0C6 PX→C
* refs (1): 189EA
        CON(1)  8                                * 1E273  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E274  library
        CON(3)  #0C6                             * 1E277  command
xPX>C:
        ::                                       * 1E27A
          CK1&Dispatch                           * 1E27F
          BINT5                                  * 1E284
          DOPX>C                                 * 1E289
        ;                                        * 1E28E

* (x,y) -> {#n #m}
* ROMPTR 002 0C7 C→PX
* refs (1): 189EA
        CON(1)  8                                * 1E293  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E294  library
        CON(3)  #0C7                             * 1E297  command
xC>PX:
        ::                                       * 1E29A
          CK1&Dispatch                           * 1E29F
          BINT2                                  * 1E2A4
          DOC>PX                                 * 1E2A9
        ;                                        * 1E2AE

* ->
* ROMPTR 002 0C8 PICTURE
* refs (17): 189EA 3B43C C680B C70D6 C70FE C7126 ...
        CON(1)  8                                * 1E2B3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2B4  library
        CON(3)  #0C8                             * 1E2B7  command
xGRAPH:
        ::                                       * 1E2BA
          CK0                                    * 1E2BF
          OBJ_4DA3F                              * 1E2C4
        ;                                        * 1E2C9

* ->
* ROMPTR 002 0C9 LABEL
* refs (2): 189EA 3E7D9
        CON(1)  8                                * 1E2CE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2CF  library
        CON(3)  #0C9                             * 1E2D2  command
xLABEL:
        ::                                       * 1E2D5
          CK0                                    * 1E2DA
          label                                  * 1E2DF
        ;                                        * 1E2E4

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CA PVIEW
* refs (1): 189EA
        CON(1)  8                                * 1E2E9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2EA  library
        CON(3)  #0CA                             * 1E2ED  command
xPVIEW:
        ::                                       * 1E2F0
          CK1&Dispatch                           * 1E2F5
          BINT2                                  * 1E2FA
          pview(c)                               * 1E2FF
          BINT5                                  * 1E304
          OBJ_4F027                              * 1E309
        ;                                        * 1E30E

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CB PIXON
* refs (1): 189EA
        CON(1)  8                                * 1E313  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E314  library
        CON(3)  #0CB                             * 1E317  command
xPIXON:
        ::                                       * 1E31A
          CK1&Dispatch                           * 1E31F
          BINT2                                  * 1E324
          pixon(c)                               * 1E329
          BINT5                                  * 1E32E
          pixon(li)                              * 1E333
        ;                                        * 1E338

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CC PIXOFF
* refs (1): 189EA
        CON(1)  8                                * 1E33D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E33E  library
        CON(3)  #0CC                             * 1E341  command
xPIXOFF:
        ::                                       * 1E344
          CK1&Dispatch                           * 1E349
          BINT2                                  * 1E34E
          pixoff(c)                              * 1E353
          BINT5                                  * 1E358
          pixoff(li)                             * 1E35D
        ;                                        * 1E362

* (x,y) -> 1/0 {#n #m} -> 1/0
* ROMPTR 002 0CD PIX?
* refs (1): 189EA
        CON(1)  8                                * 1E367  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E368  library
        CON(3)  #0CD                             * 1E36B  command
xPIX?:
        ::                                       * 1E36E
          CK1&Dispatch                           * 1E373
          BINT2                                  * 1E378
          pix?(c)                                * 1E37D
          BINT5                                  * 1E382
          pix?(li)                               * 1E387
        ;                                        * 1E38C

* (x1,y1) (x2,y2) -> {#n1 #m1} {#n2 #m2} ->
* ROMPTR 002 0CE LINE
* refs (2): 189EA 3E82F
        CON(1)  8                                * 1E391  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E392  library
        CON(3)  #0CE                             * 1E395  command
xLINE:
        ::                                       * 1E398
          CK2&Dispatch                           * 1E39D
          BINT85                                 * 1E3A2
          line(2li)                              * 1E3A7
          BINT34                                 * 1E3AC
          line(2c)                               * 1E3B1
        ;                                        * 1E3B6

* (x1,y1) (x2,y2) -> {#n1 #m1} {#n2 #m2} ->
* ROMPTR 002 0CF TLINE
* refs (2): 189EA 3E843
        CON(1)  8                                * 1E3BB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E3BC  library
        CON(3)  #0CF                             * 1E3BF  command
xTLINE:
        ::                                       * 1E3C2
          CK2&Dispatch                           * 1E3C7
          BINT85                                 * 1E3CC
          tline(2li)                             * 1E3D1
          BINT34                                 * 1E3D6
          tline(2c)                              * 1E3DB
        ;                                        * 1E3E0

* {#n1 #m1} {#n2 #m2} -> c1 c2 ->
* ROMPTR 002 0D0 BOX
* refs (2): 189EA 3E857
        CON(1)  8                                * 1E3E5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E3E6  library
        CON(3)  #0D0                             * 1E3E9  command
xBOX:
        ::                                       * 1E3EC
          CK2&Dispatch                           * 1E3F1
          BINT85                                 * 1E3F6
          box(2li)                               * 1E3FB
          BINT34                                 * 1E400
          box(2c)                                * 1E405
        ;                                        * 1E40A

* #width #height -> grob
* ROMPTR 002 0D1 BLANK
* refs (1): 189EA
        CON(1)  8                                * 1E40F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E410  library
        CON(3)  #0D1                             * 1E413  command
xBLANK:
        ::                                       * 1E416
          CK2&Dispatch                           * 1E41B
          2HXS                                   * 1E420
          blank(2b)                              * 1E425
        ;                                        * 1E42A

* -> PICT
* ROMPTR 002 0D2 PICT
* refs (17): 189EA 1CA8F 1E445 3C1AB 51152 D2FCB ...
        CON(1)  8                                * 1E42F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E430  library
        CON(3)  #0D2                             * 1E433  command
xPICT:
        ::                                       * 1E436
          CK0                                    * 1E43B
          '                                      * 1E440
          xPICT                                  * 1E445
        ;                                        * 1E44A

* g_targ {#n #m} grob -> g_targ' g_targ (x,y) grob -> g_targ' PICT ... ... ->
* ROMPTR 002 0D3 GOR
* refs (1): 189EA
        CON(1)  8                                * 1E44F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E450  library
        CON(3)  #0D3                             * 1E453  command
xGOR:
        ::                                       * 1E456
          CK3&Dispatch                           * 1E45B
          #       C5C                            * 1E460  3164

gor(go,li,go):
          ::                                     * 1E46A
            TRUE                                 * 1E46F
            g?or(go,li,go,?)                     * 1E474
          ;                                      * 1E479
          #       C2C                            * 1E47E  3116

gor(go,c,go):
          ::                                     * 1E488
            TRUE                                 * 1E48D
            g?or(go,c,go,?)                      * 1E492
          ;                                      * 1E497
          #       85C                            * 1E49C  2140
          ::                                     * 1E4A6
            TRUE                                 * 1E4AB
            g?or(PICT,c,go,?)                    * 1E4B0
          ;                                      * 1E4B5
          #       82C                            * 1E4BA  2092

gor(PHPHPc,go):
          ::                                     * 1E4C4
            TRUE                                 * 1E4C9
            g?or(PICT,c,go,?)                    * 1E4CE
          ;                                      * 1E4D3
        ;                                        * 1E4D8

* g_targ {#n #m} g_src -> g_targ' g_targ (x,y) g_src -> g_targ' PICT ... ... ->
* ROMPTR 002 0D4 GXOR
* refs (1): 189EA
        CON(1)  8                                * 1E4DD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E4DE  library
        CON(3)  #0D4                             * 1E4E1  command
xGXOR:
        ::                                       * 1E4E4
          CK3&Dispatch                           * 1E4E9
          #       C5C                            * 1E4EE  3164

gxor(go,li,go):
          ::                                     * 1E4F8
            FALSE                                * 1E4FD
            g?or(go,li,go,?)                     * 1E502
          ;                                      * 1E507
          #       C2C                            * 1E50C  3116

gxor(go,c,go):
          ::                                     * 1E516
            FALSE                                * 1E51B
            g?or(go,c,go,?)                      * 1E520
          ;                                      * 1E525
          #       85C                            * 1E52A  2140

gxor(PICT,li,go):
          ::                                     * 1E534
            FALSE                                * 1E539
            g?or(PICT,c,go,?)                    * 1E53E
          ;                                      * 1E543
          #       82C                            * 1E548  2092

gxor(PICT,c,go):
          ::                                     * 1E552
            FALSE                                * 1E557
            g?or(PICT,c,go,?)                    * 1E55C
          ;                                      * 1E561
        ;                                        * 1E566

* -> grob
* ROMPTR 002 0D5 LCD→
* refs (1): 189EA
        CON(1)  8                                * 1E56B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E56C  library
        CON(3)  #0D5                             * 1E56F  command
xLCD>:
        ::                                       * 1E572
          CK0                                    * 1E577
          DOLCD>                                 * 1E57C
        ;                                        * 1E581

* grob ->
* ROMPTR 002 0D6 →LCD
* refs (3): 189EA C713A C7149
        CON(1)  8                                * 1E586  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E587  library
        CON(3)  #0D6                             * 1E58A  command
x>LCD:
        ::                                       * 1E58D
          CK1&Dispatch                           * 1E592
          BINT12                                 * 1E597
          DO>LCD                                 * 1E59C
        ;                                        * 1E5A1

* ob n_chrsize -> grob
* ROMPTR 002 0D7 →GROB
* refs (1): 189EA
        CON(1)  8                                * 1E5A6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E5A7  library
        CON(3)  #0D7                             * 1E5AA  command
x>GROB:
        ::                                       * 1E5AD
          CK2&Dispatch                           * 1E5B2
          #       1                              * 1E5B7  1
          ->grob(_,r)                            * 1E5C1
        ;                                        * 1E5C6

* c r \Gh1 \Gh2 -> {#x #y} #r \Gh1 \Gh2 ->
* ROMPTR 002 0D8 ARC
* refs (1): 189EA
        CON(1)  8                                * 1E5CB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E5CC  library
        CON(3)  #0D8                             * 1E5CF  command
xARC:
        ::                                       * 1E5D2
          CK4&Dispatch                           * 1E5D7
          #       2111                           * 1E5DC  8465
          arc(c,3r)                              * 1E5E6
          #       5B11                           * 1E5EB  23313
          arc(li,b,2r)                           * 1E5F5
        ;                                        * 1E5FA

* ->
* ROMPTR 002 0D9 TEXT
* refs (1): 189EA
        CON(1)  8                                * 1E5FF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E600  library
        CON(3)  #0D9                             * 1E603  command
xTEXT:
        ::                                       * 1E606
          CK0                                    * 1E60B
          text                                   * 1E610
        ;                                        * 1E615

* x1 x2 ->
* ROMPTR 002 0DA XRNG
* refs (2): 189EA D36FD
        CON(1)  8                                * 1E61A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E61B  library
        CON(3)  #0DA                             * 1E61E  command
xXRNG:
        ::                                       * 1E621
          CK2&Dispatch                           * 1E626
          BINT17                                 * 1E62B
          xrng(2r)                               * 1E630
        ;                                        * 1E635

* y1 y2 ->
* ROMPTR 002 0DB YRNG
* refs (2): 189EA D370C
        CON(1)  8                                * 1E63A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E63B  library
        CON(3)  #0DB                             * 1E63E  command
xYRNG:
        ::                                       * 1E641
          CK2&Dispatch                           * 1E646
          BINT17                                 * 1E64B
          yrng(2r)                               * 1E650
        ;                                        * 1E655

* ->
* ROMPTR 002 0DC FUNCTION
* refs (9): 189EA 46DA0 512A6 A54EA A5632 A60DD ...
        CON(1)  8                                * 1E65A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E65B  library
        CON(3)  #0DC                             * 1E65E  command
xFUNCTION:
        ROMPTR  0F1 033                          * 1E661  FUNCTION
        BSS     14                               * 1E66C

* ->
* ROMPTR 002 0DD CONIC
* refs (8): 189EA 512BA A550A A5652 A610D A6255 ...
        CON(1)  8                                * 1E67A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E67B  library
        CON(3)  #0DD                             * 1E67E  command
xCONIC:
        ROMPTR  0F1 034                          * 1E681  CONIC
        BSS     14                               * 1E68C

* ROMPTR 002 0DE
* refs (9): 189EA 46DB1 512CE A54FA A5642 A60ED ...
        CON(1)  8                                * 1E69A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E69B  library
        CON(3)  #0DE                             * 1E69E  command
POLAR:
        ROMPTR  0F1 035                          * 1E6A1  POLAR
        BSS     14                               * 1E6AC

* ->
* ROMPTR 002 0DF PARAMETRIC
* refs (9): 189EA 46DC2 512E2 A552A A5672 A60FD ...
        CON(1)  8                                * 1E6BA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6BB  library
        CON(3)  #0DF                             * 1E6BE  command
xPARAMETRIC:
        ROMPTR  0F1 036                          * 1E6C1  PARAMETRIC
        BSS     14                               * 1E6CC

* ->
* ROMPTR 002 0E0 TRUTH
* refs (8): 189EA 512F6 A551A A5662 A611D A6265 ...
        CON(1)  8                                * 1E6DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6DB  library
        CON(3)  #0E0                             * 1E6DE  command
xTRUTH:
        ROMPTR  0F1 037                          * 1E6E1  TRUTH
        BSS     14                               * 1E6EC

* ROMPTR 002 0E1 SCATTER
* refs (8): 189EA 5130A A5570 A56B8 A6163 A62AB ...
        CON(1)  8                                * 1E6FA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6FB  library
        CON(3)  #0E1                             * 1E6FE  command
xSCATTER:
        ROMPTR  0F1 038                          * 1E701  SCATTER
        BSS     14                               * 1E70C

* ->
* ROMPTR 002 0E2 HISTOGRAM
* refs (8): 189EA 5131E A5550 A5698 A6143 A628B ...
        CON(1)  8                                * 1E71A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E71B  library
        CON(3)  #0E2                             * 1E71E  command
xHISTOGRAM:
        ROMPTR  0F1 039                          * 1E721  HISTOGRAM
        BSS     14                               * 1E72C

* ->
* ROMPTR 002 0E3 BAR
* refs (8): 189EA 51332 A5560 A56A8 A6153 A629B ...
        CON(1)  8                                * 1E73A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E73B  library
        CON(3)  #0E3                             * 1E73E  command
xBAR:
        ROMPTR  0F1 03A                          * 1E741  BAR
        BSS     14                               * 1E74C

* ob1 ob2 -> 1/0
* ROMPTR 002 0E4 SAME
* refs (2): 189EA D3C1F
        CON(1)  8                                * 1E75A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E75B  library
        CON(3)  #0E4                             * 1E75E  command
xSAME:
        ::                                       * 1E761
          CK2                                    * 1E766
          EQUAL                                  * 1E76B
          COERCEFLAG                             * 1E770
        ;                                        * 1E775

* slots of 002 0E4 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1E77A  end of the slots: property byte (meaning not yet known)

* x1 x2 -> x3
* ROMPTR 002 0E5 AND
* refs (4): 189EA 559A9 559C2 559DB
        CON(1)  1                                * 1E77C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E77D  library
        CON(3)  #0E5                             * 1E780  command
xAND:
        ::                                       * 1E783
          CK2&Dispatch                           * 1E788
          BINT17                                 * 1E78D
          and(2r)                                * 1E792
          2HXS                                   * 1E797
          bitAND                                 * 1E79C
          BINT26                                 * 1E7A1
          %SYMAND                                * 1E7A6
          SYMREAL                                * 1E7AB
          SYM%AND                                * 1E7B0
          SYMSYM                                 * 1E7B5
          SYMAND                                 * 1E7BA
          BINT51                                 * 1E7BF
          AND$                                   * 1E7C4
        ;                                        * 1E7C9

* slots of 002 0E5 (derivative, inverse, ...: used by the symbolic code)
#50101h:
        HXS     50105                            * 1E7CE  slot 0

* refs (1): 1E792
and(2r):
        ::                                       * 1E7DD  slot 1
          %0<>                                   * 1E7E2
          SWAP                                   * 1E7E7
          %0<>                                   * 1E7EC
          AND                                    * 1E7F1
          COERCEFLAG                             * 1E7F6
        ;                                        * 1E7FB
        CON(2)  #00                              * 1E800  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 0E6 OR
* refs (4): 189EA 559F4 55A0D 55A26
        CON(1)  1                                * 1E802  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E803  library
        CON(3)  #0E6                             * 1E806  command
xOR:
        ::                                       * 1E809
          CK2&Dispatch                           * 1E80E
          BINT17                                 * 1E813
          or(2r)                                 * 1E818
          2HXS                                   * 1E81D
          bitOR                                  * 1E822
          BINT26                                 * 1E827
          %SYMOR                                 * 1E82C
          SYMREAL                                * 1E831
          SYM%OR                                 * 1E836
          SYMSYM                                 * 1E83B
          SYMOR                                  * 1E840
          BINT51                                 * 1E845
          OR$                                    * 1E84A
        ;                                        * 1E84F

* refs (1): 1E941
* slots of 002 0E6 (derivative, inverse, ...: used by the symbolic code)
#40104h:
        HXS     40104                            * 1E854  slot 0

* refs (1): 1E818
or(2r):
        ::                                       * 1E863  slot 1
          %0<>                                   * 1E868
          SWAP                                   * 1E86D
          %0<>                                   * 1E872
          OR                                     * 1E877
          COERCEFLAG                             * 1E87C
        ;                                        * 1E881
        CON(2)  #00                              * 1E886  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 0E7 NOT
* refs (3): 189EA 54EE1 6E807
        CON(1)  5                                * 1E888  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E889  library
        CON(3)  #0E7                             * 1E88C  command
xNOT:
        ::                                       * 1E88F
          CK1&Dispatch                           * 1E894
          BINT1                                  * 1E899
          not(r)                                 * 1E89E
          BINT11                                 * 1E8A3
          bitNOT                                 * 1E8A8
          BINT10                                 * 1E8AD
          SYMNOT                                 * 1E8B2
          BINT3                                  * 1E8B7
          NOT$                                   * 1E8BC
        ;                                        * 1E8C1

* slots of 002 0E7 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D604                        * 1E8C6  slot 0

#5010h:
        HXS     0105                             * 1E8CB  slot 1

* refs (2): 1E89E 544F6
not(r):
        ::                                       * 1E8D9  slot 2
          %0=                                    * 1E8DE
          COERCEFLAG                             * 1E8E3
        ;                                        * 1E8E8
        CON(2)  #00                              * 1E8ED  end of the slots: property byte (meaning not yet known)

* # #' -> #'' $ $' -> $'' 1/0 1/0 -> 1/0
* ROMPTR 002 0E8 XOR
* refs (4): 189EA 55A3F 55A58 55A71
        CON(1)  1                                * 1E8EF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E8F0  library
        CON(3)  #0E8                             * 1E8F3  command
xXOR:
        ::                                       * 1E8F6
          CK2&Dispatch                           * 1E8FB
          BINT17                                 * 1E900
          xor(2r)                                * 1E905
          2HXS                                   * 1E90A
          bitXOR                                 * 1E90F
          BINT26                                 * 1E914
          %SYMXOR                                * 1E919
          SYMREAL                                * 1E91E
          SYM%XOR                                * 1E923
          SYMSYM                                 * 1E928
          SYMXOR                                 * 1E92D
          BINT51                                 * 1E932
          XOR$                                   * 1E937
        ;                                        * 1E93C

* slots of 002 0E8 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #40104h                          * 1E941  slot 0

* refs (1): 1E905
xor(2r):
        ::                                       * 1E946  slot 1
          %0<>                                   * 1E94B
          SWAP                                   * 1E950
          %0<>                                   * 1E955
          XOR                                    * 1E95A
          COERCEFLAG                             * 1E95F
        ;                                        * 1E964
        CON(2)  #00                              * 1E969  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0E9 ==
* refs (8): 189EA 1EA58 55A8A 55AA3 55ABC 5BAC3 ...
        CON(1)  1                                * 1E96B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E96C  library
        CON(3)  #0E9                             * 1E96F  command
x==:
        ::                                       * 1E972
          CK2&Dispatch                           * 1E977
          BINT26                                 * 1E97C
          FLOATSYM==                             * 1E981
          BINT42                                 * 1E986
          FLOATSYM==                             * 1E98B
          SYMREAL                                * 1E990
          SYMFLOAT==                             * 1E995
          OBJ_64D7E                              * 1E99A
          SYMFLOAT==                             * 1E99F
          SYMSYM                                 * 1E9A4
          SYM==                                  * 1E9A9
          BINT18                                 * 1E9AE
          ==(r,c)                                * 1E9B3
          BINT33                                 * 1E9B8
          ==(c,r)                                * 1E9BD
          2HXS                                   * 1E9C2
          HXS==HXS                               * 1E9C7
          BINT30                                 * 1E9CC
          UM=?                                   * 1E9D1
          EXTREAL                                * 1E9D6
          UM=?                                   * 1E9DB
          2EXT                                   * 1E9E0
          UM=?                                   * 1E9E5
          SYMEXT                                 * 1E9EA
          SYMFLOAT==                             * 1E9EF
          EXTSYM                                 * 1E9F4
          FLOATSYM==                             * 1E9F9
          TAGGEDANY                              * 1E9FE
          ==1tag                                 * 1EA03
          BINT13                                 * 1EA08
          ==1tag                                 * 1EA0D
          BINT0                                  * 1EA12
          OBJ_1EA30                              * 1EA17
        ;                                        * 1EA1C

* refs (5): 1EB4C 1EC3B 1ECDA 1ED79 1EE18
* slots of 002 0E9 (derivative, inverse, ...: used by the symbolic code)
#60106h:
        HXS     60106                            * 1EA21  slot 0

* refs (3): 0F58E 1EA17 1EA85
OBJ_1EA30:
        ::                                       * 1EA30  slot 1
          EQUAL                                  * 1EA35
          COERCEFLAG                             * 1EA3A
        ;                                        * 1EA3F

* refs (2): 1EA03 1EA0D
==1tag:
        ::                                       * 1EA44  slot 2
          STRIPTAGS                              * 1EA49
          STRIPTAGSl2                            * 1EA4E
          '                                      * 1EA53
          x==                                    * 1EA58
          COLA                                   * 1EA5D
          EvalNoCK                               * 1EA62
        ;                                        * 1EA67

* refs (1): 1E9B3
==(r,c):
        ::                                       * 1EA6C  slot 3
          SWAP                                   * 1EA71

* refs (1): 1E9BD
==(c,r):
          ::                                     * 1EA76
            %0_2A2B4                             * 1EA7B
            %>C%                                 * 1EA80
            OBJ_1EA30                            * 1EA85
          ;                                      * 1EA8A
        ;                                        * 1EA8F
        CON(2)  #00                              * 1EA94  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EA ≠
* refs (6): 189EA 1EB79 55AD5 55AEE 55B07 D3C64
        CON(1)  1                                * 1EA96  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EA97  library
        CON(3)  #0EA                             * 1EA9A  command
x#?:
        ::                                       * 1EA9D
          CK2&Dispatch                           * 1EAA2
          BINT26                                 * 1EAA7
          FLOATSYM<>                             * 1EAAC
          BINT42                                 * 1EAB1
          FLOATSYM<>                             * 1EAB6
          SYMREAL                                * 1EABB
          SYMFLOAT<>                             * 1EAC0
          OBJ_64D7E                              * 1EAC5
          SYMFLOAT<>                             * 1EACA
          SYMSYM                                 * 1EACF
          SYM<>                                  * 1EAD4
          BINT18                                 * 1EAD9
          OBJ_1EB8D                              * 1EADE
          BINT33                                 * 1EAE3
          OBJ_1EB97                              * 1EAE8
          2HXS                                   * 1EAED
          HXS#HXS                                * 1EAF2
          BINT30                                 * 1EAF7
          UM#?                                   * 1EAFC
          EXTREAL                                * 1EB01
          UM#?                                   * 1EB06
          2EXT                                   * 1EB0B
          UM#?                                   * 1EB10
          SYMEXT                                 * 1EB15
          SYMFLOAT<>                             * 1EB1A
          EXTSYM                                 * 1EB1F
          FLOATSYM<>                             * 1EB24
          TAGGEDANY                              * 1EB29
          OBJ_1EB65                              * 1EB2E
          BINT13                                 * 1EB33
          OBJ_1EB65                              * 1EB38
          BINT0                                  * 1EB3D
          OBJ_1EB51                              * 1EB42
        ;                                        * 1EB47

* slots of 002 0EA (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EB4C  slot 0

* refs (3): 0F5A2 1EB42 1EBA6
OBJ_1EB51:
        ::                                       * 1EB51  slot 1
          EQUALNOT                               * 1EB56
          COERCEFLAG                             * 1EB5B
        ;                                        * 1EB60

* refs (2): 1EB2E 1EB38
OBJ_1EB65:
        ::                                       * 1EB65  slot 2
          STRIPTAGS                              * 1EB6A
          STRIPTAGSl2                            * 1EB6F
          '                                      * 1EB74
          x#?                                    * 1EB79
          COLA                                   * 1EB7E
          EvalNoCK                               * 1EB83
        ;                                        * 1EB88

* refs (1): 1EADE
OBJ_1EB8D:
        ::                                       * 1EB8D  slot 3
          SWAP                                   * 1EB92

* refs (1): 1EAE8
OBJ_1EB97:
          ::                                     * 1EB97
            %0_2A2B4                             * 1EB9C
            %>C%                                 * 1EBA1
            OBJ_1EB51                            * 1EBA6
          ;                                      * 1EBAB
        ;                                        * 1EBB0
        CON(2)  #00                              * 1EBB5  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EB <
* refs (5): 189EA 55B20 55B39 55B52 D3894
        CON(1)  1                                * 1EBB7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EBB8  library
        CON(3)  #0EB                             * 1EBBB  command
x<:
        ::                                       * 1EBBE
          CK2&Dispatch                           * 1EBC3
          BINT17                                 * 1EBC8
          <(2r)                                  * 1EBCD
          2HXS                                   * 1EBD2
          HXS<HXS                                * 1EBD7
          BINT51                                 * 1EBDC
          $<$?                                   * 1EBE1
          BINT26                                 * 1EBE6
          %SYM<                                  * 1EBEB
          SYMREAL                                * 1EBF0
          SYM%<                                  * 1EBF5
          SYMSYM                                 * 1EBFA
          SYM<                                   * 1EBFF
          BINT30                                 * 1EC04
          UM<?                                   * 1EC09
          EXTREAL                                * 1EC0E
          UM<?                                   * 1EC13
          2EXT                                   * 1EC18
          UM<?                                   * 1EC1D
          SYMEXT                                 * 1EC22
          SYM%<                                  * 1EC27
          EXTSYM                                 * 1EC2C
          %SYM<                                  * 1EC31
        ;                                        * 1EC36

* slots of 002 0EB (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EC3B  slot 0

* refs (2): 0F5B6 1EBCD
<(2r):
        ::                                       * 1EC40  slot 1
          %<                                     * 1EC45
          COERCEFLAG                             * 1EC4A
        ;                                        * 1EC4F
        CON(2)  #00                              * 1EC54  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EC >
* refs (5): 189EA 55B6B 55B84 55B9D D3C9A
        CON(1)  1                                * 1EC56  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EC57  library
        CON(3)  #0EC                             * 1EC5A  command
x>:
        ::                                       * 1EC5D
          CK2&Dispatch                           * 1EC62
          BINT17                                 * 1EC67
          >(2r)                                  * 1EC6C
          2HXS                                   * 1EC71
          HXS>HXS                                * 1EC76
          BINT51                                 * 1EC7B
          $>$?                                   * 1EC80
          BINT26                                 * 1EC85
          %SYM>                                  * 1EC8A
          SYMREAL                                * 1EC8F
          SYM%>                                  * 1EC94
          SYMSYM                                 * 1EC99
          SYM>                                   * 1EC9E
          BINT30                                 * 1ECA3
          UM>?                                   * 1ECA8
          EXTREAL                                * 1ECAD
          UM>?                                   * 1ECB2
          2EXT                                   * 1ECB7
          UM>?                                   * 1ECBC
          SYMEXT                                 * 1ECC1
          SYM%>                                  * 1ECC6
          EXTSYM                                 * 1ECCB
          %SYM>                                  * 1ECD0
        ;                                        * 1ECD5

* slots of 002 0EC (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1ECDA  slot 0

* refs (2): 0F5CA 1EC6C
>(2r):
        ::                                       * 1ECDF  slot 1
          %>                                     * 1ECE4
          COERCEFLAG                             * 1ECE9
        ;                                        * 1ECEE
        CON(2)  #00                              * 1ECF3  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0ED ≤
* refs (5): 189EA 55BB6 55BCF 55BE8 D3F9A
        CON(1)  1                                * 1ECF5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ECF6  library
        CON(3)  #0ED                             * 1ECF9  command
x<=?:
        ::                                       * 1ECFC
          CK2&Dispatch                           * 1ED01
          BINT17                                 * 1ED06
          ó(2r)                                  * 1ED0B
          2HXS                                   * 1ED10
          HXS<=HXS                               * 1ED15
          BINT51                                 * 1ED1A
          $<=$?                                  * 1ED1F
          BINT26                                 * 1ED24
          %SYM<=                                 * 1ED29
          SYMREAL                                * 1ED2E
          SYM%<=                                 * 1ED33
          SYMSYM                                 * 1ED38
          SYM<=                                  * 1ED3D
          BINT30                                 * 1ED42
          UM<=?                                  * 1ED47
          EXTREAL                                * 1ED4C
          UM<=?                                  * 1ED51
          2EXT                                   * 1ED56
          UM<=?                                  * 1ED5B
          SYMEXT                                 * 1ED60
          SYM%<=                                 * 1ED65
          EXTSYM                                 * 1ED6A
          %SYM<=                                 * 1ED6F
        ;                                        * 1ED74

* slots of 002 0ED (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1ED79  slot 0

* refs (2): 0F5DE 1ED0B
ó(2r):
        ::                                       * 1ED7E  slot 1
          %<=                                    * 1ED83
          COERCEFLAG                             * 1ED88
        ;                                        * 1ED8D
        CON(2)  #00                              * 1ED92  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EE ≥
* refs (4): 189EA 55C01 55C1A 55C33
        CON(1)  1                                * 1ED94  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ED95  library
        CON(3)  #0EE                             * 1ED98  command
x>=?:
        ::                                       * 1ED9B
          CK2&Dispatch                           * 1EDA0
          BINT17                                 * 1EDA5
          ò(2r)                                  * 1EDAA
          2HXS                                   * 1EDAF
          HXS>=HXS                               * 1EDB4
          BINT51                                 * 1EDB9
          $>=$?                                  * 1EDBE
          BINT26                                 * 1EDC3
          %SYM>=                                 * 1EDC8
          SYMREAL                                * 1EDCD
          SYM%>=                                 * 1EDD2
          SYMSYM                                 * 1EDD7
          SYM>=                                  * 1EDDC
          BINT30                                 * 1EDE1
          UM>=?                                  * 1EDE6
          EXTREAL                                * 1EDEB
          UM>=?                                  * 1EDF0
          2EXT                                   * 1EDF5
          UM>=?                                  * 1EDFA
          SYMEXT                                 * 1EDFF
          SYM%>=                                 * 1EE04
          EXTSYM                                 * 1EE09
          %SYM>=                                 * 1EE0E
        ;                                        * 1EE13

* slots of 002 0EE (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EE18  slot 0

* refs (2): 0F5F2 1EDAA
ò(2r):
        ::                                       * 1EE1D  slot 1
          %>=                                    * 1EE22
          COERCEFLAG                             * 1EE27
        ;                                        * 1EE2C

* ROMPTR 002 0EF OLDPRT
* refs (1): 189EA
        CON(1)  8                                * 1EE31  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE32  library
        CON(3)  #0EF                             * 1EE35  command
xOLDPRT:
        ::                                       * 1EE38
          CK0                                    * 1EE3D
          oldprt                                 * 1EE42
        ;                                        * 1EE47

* ob -> ob
* ROMPTR 002 0F0 PR1
* refs (1): 189EA
        CON(1)  8                                * 1EE4C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE4D  library
        CON(3)  #0F0                             * 1EE50  command
xPR1:
        ::                                       * 1EE53
          CK0                                    * 1EE58
          pr1                                    * 1EE5D
        ;                                        * 1EE62

* ROMPTR 002 0F1 PRSTC
* refs (1): 189EA
        CON(1)  8                                * 1EE67  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE68  library
        CON(3)  #0F1                             * 1EE6B  command
xPRSTC:
        ::                                       * 1EE6E
          CK0                                    * 1EE73
          prstc                                  * 1EE78
        ;                                        * 1EE7D

* ->
* ROMPTR 002 0F2 PRST
* refs (1): 189EA
        CON(1)  8                                * 1EE82  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE83  library
        CON(3)  #0F2                             * 1EE86  command
xPRST:
        ::                                       * 1EE89
          CK0                                    * 1EE8E
          prst                                   * 1EE93
        ;                                        * 1EE98

* ->
* ROMPTR 002 0F3 CR
* refs (1): 189EA
        CON(1)  8                                * 1EE9D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE9E  library
        CON(3)  #0F3                             * 1EEA1  command
xCR:
        ::                                       * 1EEA4
          CK0                                    * 1EEA9
          DOCR                                   * 1EEAE
        ;                                        * 1EEB3

* name -> {names} -> :port:name ->
* ROMPTR 002 0F4 PRVAR
* refs (2): 189EA 1EF32
        CON(1)  8                                * 1EEB8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EEB9  library
        CON(3)  #0F4                             * 1EEBC  command
xPRVAR:
        ::                                       * 1EEBF
          CK1&Dispatch                           * 1EEC4
          BINT6                                  * 1EEC9
          prvar(nm)                              * 1EECE
          BINT7                                  * 1EED3
          prvar(nm)                              * 1EED8
          BINT5                                  * 1EEDD
          prvar(li)                              * 1EEE2
          BINT13                                 * 1EEE7

prvar(to):
          ::                                     * 1EEEC
            DUP                                  * 1EEF1
            rcl(to)                              * 1EEF6
            SWAP                                 * 1EEFB
            SetEcma94                            * 1EF00
            OBJ_31D7E                            * 1EF05
            OBJ_31D7E                            * 1EF0A
            docr                                 * 1EF0F
          ;                                      * 1EF14
        ;                                        * 1EF19

* refs (1): 1EEE2
prvar(li):
        ::                                       * 1EF1E
          DUPNULLCOMP?                           * 1EF23
          caseDROP                               * 1EF28
          OBJ_20F44                              * 1EF2D
          xPRVAR                                 * 1EF32
        ;                                        * 1EF37

* x_delay ->
* ROMPTR 002 0F5 DELAY
* refs (1): 189EA
        CON(1)  8                                * 1EF3C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF3D  library
        CON(3)  #0F5                             * 1EF40  command
xDELAY:
        ::                                       * 1EF43
          CK1&Dispatch                           * 1EF48
          BINT1                                  * 1EF4D
          DODELAY                                * 1EF52
        ;                                        * 1EF57

* ->
* ROMPTR 002 0F6 PRLCD
* refs (1): 189EA
        CON(1)  8                                * 1EF5C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF5D  library
        CON(3)  #0F6                             * 1EF60  command
xPRLCD:
        ::                                       * 1EF63
          CK0                                    * 1EF68
          DOPRLCD                                * 1EF6D
        ;                                        * 1EF72

* ROMPTR 002 0F7 ∂
* refs (7): 189EA 59418 59477 595CE 5A4FA 8C1AE ...
        CON(1)  14                               * 1EF77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF78  library
        CON(3)  #0F7                             * 1EF7B  command
DERIV:
        ::                                       * 1EF7E
          CK2&Dispatch                           * 1EF83
          SYMSYMB                                * 1EF88
          SETTYPEERR                             * 1EF8D
          SYMSYM                                 * 1EF92
          SYMDER                                 * 1EF97
          BINT26                                 * 1EF9C
          2DROP%0                                * 1EFA1
          BINT42                                 * 1EFA6
          2DROP%0                                * 1EFAB
          EXTSYM                                 * 1EFB0
          2DROP%0                                * 1EFB5
        ;                                        * 1EFBA

* slots of 002 0F7 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D891                        * 1EFBF  slot 0
        CON(5)  xDER                             * 1EFC4  slot 1
        CON(2)  #A7                              * 1EFC9  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 0F8
* refs (19): 189EA 1EFC4 5B50F 5B9E7 5BA2D 5BADC ...
        CON(1)  5                                * 1EFCB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EFCC  library
        CON(3)  #0F8                             * 1EFCF  command
xDER:
        ::                                       * 1EFD2
          CK2&Dispatch                           * 1EFD7
          SYMBSYM                                * 1EFDC
          XEQSYMDERSTEP                          * 1EFE1
          SYMBREAL                               * 1EFE6
          XEQSYMDERCON                           * 1EFEB
          SYMBCMP                                * 1EFF0
          XEQSYMDERCON                           * 1EFF5
          SYMBUNIT                               * 1EFFA
          XEQSYMDERCON                           * 1EFFF
        ;                                        * 1F004
        NIBHEX  198D6                            * 1F009  γØ

#0524310h:
        HXS     0134250                          * 1F00E
