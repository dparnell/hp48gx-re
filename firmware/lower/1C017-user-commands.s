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
        :: CK2&Dispatch                          * 1C01E
          BINT68 MATCROSS                        * 1C028  array array
        ;                                        * 1C032

* [B] [[A]] [Z] ->  []' [[B]] [[A]] [[Z]] -> [[]]'
* ROMPTR 002 07B RSD
* refs (1): 189EA
        CON(1)  8                                * 1C037  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C038  library
        CON(3)  #07B                             * 1C03B  command
xRSD:
        :: CK3&Dispatch                          * 1C03E
          3ARRY MATRSD                           * 1C048  array array array
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
        :: CK2&Dispatch                          * 1C060
          BINT17 %OF                             * 1C06A  real real
          BINT26 %SYM%OF                         * 1C074  real name|local|algebraic
          SYMREAL SYM%%OF                        * 1C07E  name|local|algebraic real
          SYMSYM SYM%OF                          * 1C088  name|local|algebraic name|local|algebraic
          EXTREAL UM%                            * 1C092  unit real
          EXTSYM %SYM%OF                         * 1C09C  unit name|local|algebraic
          SYMEXT SYM%%OF                         * 1C0A6  name|local|algebraic unit
          BINT30                                 * 1C0B0  real unit

%(2r):
          :: SWAP UM% ;                          * 1C0B5
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
        :: CK2&Dispatch                          * 1C0D7
          BINT17 %T                              * 1C0E1  real real
          BINT26 %SYM%T                          * 1C0EB  real name|local|algebraic
          SYMREAL SYM%%T                         * 1C0F5  name|local|algebraic real
          SYMSYM SYM%T                           * 1C0FF  name|local|algebraic name|local|algebraic
          2EXT UM%T                              * 1C109  unit unit
          BINT30 UM%T                            * 1C113  real unit
          EXTREAL UM%T                           * 1C11D  unit real
          EXTSYM %SYM%T                          * 1C127  unit name|local|algebraic
          SYMEXT SYM%%T                          * 1C131  name|local|algebraic unit
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
        :: CK2&Dispatch                          * 1C149
          BINT17 %CH                             * 1C153  real real
          BINT26 %SYM%CH                         * 1C15D  real name|local|algebraic
          SYMREAL SYM%%CH                        * 1C167  name|local|algebraic real
          SYMSYM SYM%CH                          * 1C171  name|local|algebraic name|local|algebraic
          2EXT UM%CH                             * 1C17B  unit unit
          BINT30 UM%CH                           * 1C185  real unit
          EXTREAL UM%CH                          * 1C18F  unit real
          EXTSYM %SYM%CH                         * 1C199  unit name|local|algebraic
          SYMEXT SYM%%CH                         * 1C1A3  name|local|algebraic unit
        ;                                        * 1C1AD

* -> x
* ROMPTR 002 07F RAND
* refs (1): 189EA
        CON(1)  8                                * 1C1B2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C1B3  library
        CON(3)  #07F                             * 1C1B6  command
xRAND:
        :: CK0 %RAN ;                            * 1C1B9

* x ->
* ROMPTR 002 080 RDZ
* refs (1): 189EA
        CON(1)  8                                * 1C1CD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C1CE  library
        CON(3)  #080                             * 1C1D1  command
xRDZ:
        :: CK1&Dispatch                          * 1C1D4
          BINT1 %RANDOMIZE                       * 1C1DE  real
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
        :: CK2&Dispatch                          * 1C1F6
          BINT17 %COMB                           * 1C200  real real
          BINT26 %SYMCOMB                        * 1C20A  real name|local|algebraic
          SYMREAL SYM%COMB                       * 1C214  name|local|algebraic real
          SYMSYM SYMCOMB                         * 1C21E  name|local|algebraic name|local|algebraic
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
        :: CK2&Dispatch                          * 1C236
          BINT17 %PERM                           * 1C240  real real
          BINT26 %SYMPERM                        * 1C24A  real name|local|algebraic
          SYMREAL SYM%PERM                       * 1C254  name|local|algebraic real
          SYMSYM SYMPERM                         * 1C25E  name|local|algebraic name|local|algebraic
        ;                                        * 1C268

* n ->
* ROMPTR 002 083 SF
* refs (3): 189EA 4008F D3D85
        CON(1)  8                                * 1C26D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C26E  library
        CON(3)  #083                             * 1C271  command
xSF:
        :: CK1&Dispatch                          * 1C274
          BINT1 sf(r)                            * 1C27E  real
        ;                                        * 1C288

* refs (1): 1C283
sf(r):
        :: r=>s;r>0? case SetUserFlag            * 1C28D
          SetSysFlag ChkDelLastArg ;             * 1C2A1

* refs (4): 1C292 1C2F3 1C336 1C4C4
r=>s;r>0?:
        :: DUP %ABSCOERCE SWAP %0> ;             * 1C2B0

* n ->
* ROMPTR 002 084 CF
* refs (4): 189EA 400BC D3D45 D3F69
        CON(1)  8                                * 1C2CE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C2CF  library
        CON(3)  #084                             * 1C2D2  command
xCF:
        :: CK1&Dispatch                          * 1C2D5
          BINT1 cf(r)                            * 1C2DF  real
        ;                                        * 1C2E9

* refs (1): 1C2E4
cf(r):
        :: r=>s;r>0? ITE ClrUserFlag ClrSysFlag  * 1C2EE
        ;                                        * 1C307

* n -> 0/1
* ROMPTR 002 085 FS?
* refs (2): 189EA D3E56
        CON(1)  8                                * 1C30C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C30D  library
        CON(3)  #085                             * 1C310  command
xFS?:
        :: CK1&Dispatch                          * 1C313
          BINT1 fs?(r)                           * 1C31D  real
        ;                                        * 1C327

* refs (1): 1C322
fs?(r):
        ::                                       * 1C32C

* refs (1): 1C37E
fs?(r)?:
          :: r=>s;r>0? ITE TestUserFlag TestSysFlag * 1C331
          ;                                      * 1C34A
          COERCEFLAG ;                           * 1C34F

* n -> 0/1
* ROMPTR 002 086 FC?
* refs (1): 189EA
        CON(1)  8                                * 1C359  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C35A  library
        CON(3)  #086                             * 1C35D  command
xFC?:
        :: CK1&Dispatch                          * 1C360
          BINT1 fc?(r)                           * 1C36A  real
        ;                                        * 1C374

* refs (1): 1C36F
fc?(r):
        :: fs?(r)? NOT COERCEFLAG ;              * 1C379

* ->
* ROMPTR 002 087 DEG
* refs (3): 189EA B912C C6218
        CON(1)  8                                * 1C392  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C393  library
        CON(3)  #087                             * 1C396  command
xDEG:
        :: CK0 SETDEG ;                          * 1C399

* ->
* ROMPTR 002 088 RAD
* refs (13): 189EA B9136 C624F D2FC1 D31E7 D338A ...
        CON(1)  8                                * 1C3AD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3AE  library
        CON(3)  #088                             * 1C3B1  command
xRAD:
        :: CK0 SETRAD ;                          * 1C3B4

* ->
* ROMPTR 002 089 GRAD
* refs (3): 189EA B9140 C6295
        CON(1)  8                                * 1C3C8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3C9  library
        CON(3)  #089                             * 1C3CC  command
xGRAD:
        :: CK0 SETGRAD ;                         * 1C3CF

* n ->
* ROMPTR 002 08A FIX
* refs (2): 189EA C6111
        CON(1)  8                                * 1C3E3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C3E4  library
        CON(3)  #08A                             * 1C3E7  command
xFIX:
        :: CK1&Dispatch                          * 1C3EA
          BINT1 fix(r)                           * 1C3F4  real
        ;                                        * 1C3FE

* refs (1): 1C3F9
fix(r):
        :: COERCE DOFIX ;                        * 1C403

* n ->
* ROMPTR 002 08B SCI
* refs (2): 189EA C6144
        CON(1)  8                                * 1C417  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C418  library
        CON(3)  #08B                             * 1C41B  command
xSCI:
        :: CK1&Dispatch                          * 1C41E
          BINT1 sci(r)                           * 1C428  real
        ;                                        * 1C432

* refs (1): 1C42D
sci(r):
        :: COERCE DOSCI ;                        * 1C437

* n ->
* ROMPTR 002 08C ENG
* refs (2): 189EA C6177
        CON(1)  8                                * 1C44B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C44C  library
        CON(3)  #08C                             * 1C44F  command
xENG:
        :: CK1&Dispatch                          * 1C452
          BINT1 eng(r)                           * 1C45C  real
        ;                                        * 1C466

* refs (1): 1C461
eng(r):
        :: COERCE DOENG ;                        * 1C46B

* ->
* ROMPTR 002 08D STD
* refs (2): 189EA C60D9
        CON(1)  8                                * 1C47F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C480  library
        CON(3)  #08D                             * 1C483  command
xSTD:
        :: CK0 DOSTD ;                           * 1C486

* n -> 0/1
* ROMPTR 002 08E FS?C
* refs (1): 189EA
        CON(1)  8                                * 1C49A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C49B  library
        CON(3)  #08E                             * 1C49E  command
xFS?C:
        :: CK1&Dispatch                          * 1C4A1
          BINT1 fs?c(r)                          * 1C4AB  real
        ;                                        * 1C4B5

* refs (1): 1C4B0
fs?c(r):
        ::                                       * 1C4BA

* refs (1): 1C53E
fs?c(r)?:
          :: r=>s;r>0?                           * 1C4BF

UserFs?c(r)?:
            ITE                                  * 1C4C9

* # -> flag
TestUserClr:
            :: DUP TestUserFlag SWAP ClrUserFlag * 1C4CE

SysFs?c(r)?:
            ;                                    * 1C4E7

* # -> flag
TestSysClr:
            :: DUP TestSysFlag SWAP ClrSysFlag ; * 1C4EC
          ;                                      * 1C50A
          COERCEFLAG ;                           * 1C50F

* n -> 0/1
* ROMPTR 002 08F FC?C
* refs (2): 189EA D3EA1
        CON(1)  8                                * 1C519  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C51A  library
        CON(3)  #08F                             * 1C51D  command
xFC?C:
        :: CK1&Dispatch                          * 1C520
          BINT1 fc?c(r)                          * 1C52A  real
        ;                                        * 1C534

* refs (1): 1C52F
fc?c(r):
        :: fs?c(r)? NOT COERCEFLAG ;             * 1C539

* ->
* ROMPTR 002 090 BIN
* refs (2): 189EA C57BC
        CON(1)  8                                * 1C552  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C553  library
        CON(3)  #090                             * 1C556  command
xBIN:
        :: CK0 DOBIN ;                           * 1C559

* ->
* ROMPTR 002 091 DEC
* refs (2): 189EA C5738
        CON(1)  8                                * 1C56D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C56E  library
        CON(3)  #091                             * 1C571  command
xDEC:
        :: CK0 DODEC ;                           * 1C574

* ->
* ROMPTR 002 092 HEX
* refs (2): 189EA C56F6
        CON(1)  8                                * 1C588  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C589  library
        CON(3)  #092                             * 1C58C  command
xHEX:
        :: CK0 DOHEX ;                           * 1C58F

* ->
* ROMPTR 002 093 OCT
* refs (2): 189EA C577A
        CON(1)  8                                * 1C5A3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5A4  library
        CON(3)  #093                             * 1C5A7  command
xOCT:
        :: CK0 DOOCT ;                           * 1C5AA

* n -> #n ->
* ROMPTR 002 094 STWS
* refs (1): 189EA
        CON(1)  8                                * 1C5BE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5BF  library
        CON(3)  #094                             * 1C5C2  command
xSTWS:
        :: CK1&Dispatch                          * 1C5C5
          BINT1 XEQSTWS                          * 1C5CF  real
          BINT11                                 * 1C5D9  binary

stws(b):
          :: HXS># dostws ;                      * 1C5DE
        ;                                        * 1C5F2

* -> n
* ROMPTR 002 095 RCWS
* refs (1): 189EA
        CON(1)  8                                * 1C5F7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C5F8  library
        CON(3)  #095                             * 1C5FB  command
xRCWS:
        :: CK0 XEQRCWS ;                         * 1C5FE

* -> {#s1 #u1 #s2 #u2}
* ROMPTR 002 096 RCLF
* refs (1): 189EA
        CON(1)  8                                * 1C612  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C613  library
        CON(3)  #096                             * 1C616  command
xRCLF:
        :: CK0 RCLSYSF RCLUSERF TWO{}N ;         * 1C619

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
        :: CK1&Dispatch                          * 1C67F
          BINT5 DOSTOALLF0                       * 1C689  list
          BINT11 DOSTOSYSF                       * 1C693  binary
        ;                                        * 1C69D

* {} ->
* refs (1): 1C68E
DOSTOALLF0:
        :: INNERCOMP #2<> case SETSIZEERR        * 1C6A2
          CK&DISPATCH0                           * 1C6BB
          2HXS STOALLFcont                       * 1C6C0  binary binary
        ;                                        * 1C6CA

* hxs_usr hxs_sys ->
* refs (1): 1C6C5
STOALLFcont:
        :: STOUSERF DOSTOSYSF ;                  * 1C6CF

* hxs ->
* refs (2): 1C698 1C6D9
DOSTOSYSF:
        :: STOSYSF ChkDelLastArg ;               * 1C6E3

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
        :: CKN {}N ;                             * 1C783

* x y -> (x,y) [X] [Y] -> [(x,y)]
* ROMPTR 002 099 R→C
* refs (1): 189EA
        CON(1)  8                                * 1C797  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C798  library
        CON(3)  #099                             * 1C79B  command
xR>C:
        :: CK2&Dispatch                          * 1C79E
          BINT17 %>C%                            * 1C7A8  real real
          BINT68 MATR>C                          * 1C7B2  array array
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
        :: CK1&Dispatch                          * 1C7CA
          BINT1 NOP                              * 1C7D4  real
          BINT2 C>Re%                            * 1C7DE  complex
          BINT4 MATRE                            * 1C7E8  array
          BINT10 re(ex)                          * 1C7F2  name|local|algebraic
          BINT14 CARCOMP                         * 1C7FC  unit
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
        :: CK1&Dispatch                          * 1C819
          BINT1 DROP%0                           * 1C823  real
          BINT2 C>Im%                            * 1C82D  complex
          BINT4 MATIM                            * 1C837  array
          BINT10 SYMIM                           * 1C841  name|local|algebraic
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
        :: CK3&Dispatch                          * 1C85C
          STRREALREAL XEQSUB$                    * 1C866  string real real
          LISTREALREAL sub(st,2r)                * 1C870  list real real
          # C55 sub(go,2li)                      * 1C87A  grob list list
          # C22 sub(go,2c)                       * 1C889  grob complex complex
          BINT0 ROMPTR 0E8 01F                   * 1C898  any
        ;                                        * 1C8A8
        BSS     14                               * 1C8AD

* $ % %' -> $'
* refs (1): 1C86B
XEQSUB$:
        :: COERCE2 SUB$ ;                        * 1C8BB

* refs (1): 1C875
sub(st,2r):
        :: COERCE2 SUBCOMP ;                     * 1C8CF

* ob pos new -> ob' ob= [[]] or [] or {} or $ or PICT pos= N or {n m} or (n,m)
* ROMPTR 002 09D REPL
* refs (3): 189EA D234A D2368
        CON(1)  8                                * 1C8E3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C8E4  library
        CON(3)  #09D                             * 1C8E7  command
xREPL:
        :: CK3&Dispatch                          * 1C8EA
          # C5C repl(go,li,go)                   * 1C8F4  grob list grob
          # C2C repl(go,c,go)                    * 1C903  grob complex grob
          # 313 repl(st,s,st)                    * 1C912  string real string
          # 515 xREPL~list,real,list             * 1C921  list real list
          BINT0 ROMPTR 0E8 020                   * 1C930  any
        ;                                        * 1C940
        BSS     14                               * 1C945

* {} -> ob1...obn n
* ROMPTR 002 09E LIST→
* refs (1): 189EA
        CON(1)  8                                * 1C953  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C954  library
        CON(3)  #09E                             * 1C957  command
xLIST>:
        :: CK1&Dispatch                          * 1C95A
          BINT5 XEQLIST>                         * 1C964  list
        ;                                        * 1C96E

* comp -> obn..ob1 %n
* refs (2): 1C969 1CFB2
XEQLIST>:
        :: INNERCOMP UNCOERCE ;                  * 1C973

* (x,y) -> x y [C]   -> [R] [I]
* ROMPTR 002 09F C→R
* refs (1): 189EA
        CON(1)  8                                * 1C987  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C988  library
        CON(3)  #09F                             * 1C98B  command
xC>R:
        :: CK1&Dispatch                          * 1C98E
          BINT2 C%>%                             * 1C998  complex
          BINT4 MATC>R                           * 1C9A2  array
        ;                                        * 1C9AC

* ob -> n -> {N m} -> #nw #nh
* ROMPTR 002 0A0 SIZE
* refs (5): 189EA D2F23 D3D58 D3D62 D4015
        CON(1)  8                                * 1C9B1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1C9B2  library
        CON(3)  #0A0                             * 1C9B5  command
xSIZE:
        :: CK1&Dispatch                          * 1C9B8
          BINT3 LEN$>%                           * 1C9C2  string
          BINT4 size(ar)                         * 1C9CC  array
          BINT5 LENCOMP>%                        * 1C9D6  list
          BINT10 size(ex)                        * 1C9E0  name|local|algebraic
          BINT12 size(go)                        * 1C9EA  grob
          BINT8 size(PICT)                       * 1C9F4  program
          BINT14 LENCOMP>%                       * 1C9FE  unit
          BINT0                                  * 1CA08  any

* ob -> %1
DROP%1:
          :: DROP %1 ;                           * 1CA0D
        ;                                        * 1CA21

* $ ->  %
* refs (1): 1C9C7
LEN$>%:
        :: LEN$ UNCOERCE ;                       * 1CA26

* comp -> %n
* refs (2): 1C9DB 1CA03
LENCOMP>%:
        :: LENCOMP UNCOERCE ;                    * 1CA3A

* refs (2): 1C9D1 31C77
size(ar):
        :: DIMLIMITS UNCOERCE{}2 ;               * 1CA4E

* refs (3): 1C9EF 1CAA3 4B1FC
size(go):
        :: GROBDIM UNCOERCE2 %># SWAP %># ;      * 1CA62

* refs (1): 1C9F9
size(PICT):
        :: ' xPICT EQUALNOTcase %1               * 1CA85
          GBUFF size(go) ;                       * 1CA9E

* str substring -> n/0 {} ob -> n/0
* ROMPTR 002 0A1 POS
* refs (1): 189EA
        CON(1)  8                                * 1CAAD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CAAE  library
        CON(3)  #0A1                             * 1CAB1  command
xPOS:
        :: CK2&Dispatch                          * 1CAB4
          OBJ_64C34 pos(cp,_)                    * 1CABE  list any
          BINT51 XEQPOS$                         * 1CAC8  string string
        ;                                        * 1CAD2

* $ $find/chr -> %pos -> %0
* refs (3): 1CACD 2568F 321B6
XEQPOS$:
        :: BINT1 POS$ UNCOERCE ;                 * 1CAD7

* refs (1): 1CAC3
pos(cp,_):
        :: EQUALPOSCOMP UNCOERCE ;               * 1CAF0

* ob -> $
* ROMPTR 002 0A2 →STR
* refs (1): 189EA
        CON(1)  8                                * 1CB04  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB05  library
        CON(3)  #0A2                             * 1CB08  command
x>STR:
        :: CK1 DO>STR ;                          * 1CB0B

* $ -> ob
* ROMPTR 002 0A3 STR→
* refs (2): 189EA 2DD97
        CON(1)  8                                * 1CB1F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB20  library
        CON(3)  #0A3                             * 1CB23  command
xSTR>:
        :: CK1&Dispatch                          * 1CB26
          BINT3 DOSTR>                           * 1CB30  string
        ;                                        * 1CB3A

* $ -> n
* ROMPTR 002 0A4 NUM
* refs (1): 189EA
        CON(1)  8                                * 1CB3F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB40  library
        CON(3)  #0A4                             * 1CB43  command
xNUM:
        :: CK1&Dispatch                          * 1CB46
          BINT3 DONUM                            * 1CB50  string
        ;                                        * 1CB5A

* n -> $
* ROMPTR 002 0A5 CHR
* refs (1): 189EA
        CON(1)  8                                * 1CB5F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB60  library
        CON(3)  #0A5                             * 1CB63  command
xCHR:
        :: CK1&Dispatch                          * 1CB66
          BINT1 DOCHR                            * 1CB70  real
        ;                                        * 1CB7A

* ob -> %type
* ROMPTR 002 0A6 TYPE
* refs (4): 189EA 3C150 D3C15 D3C5A
        CON(1)  8                                * 1CB7F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CB80  library
        CON(3)  #0A6                             * 1CB83  command
xTYPE:
        :: CK1                                   * 1CB86

* ob -> ob %type
* refs (6): 15CD4 18751 1CE6E 2F130 B9536 D6CC1
XEQTYPE:
          :: CK&DISPATCH0                        * 1CB90
            BINT1 %0_2A2B4                       * 1CB9A  real
            BINT2 %1                             * 1CBA4  complex
            BINT3 %2                             * 1CBAE  string
            BINT4 dup;type(ar)                   * 1CBB8  array
            BINT5 %5                             * 1CBC2  list
            BINT6 %6                             * 1CBCC  name
            BINT7 %7                             * 1CBD6  local
            BINT8 xTYPE~program                  * 1CBE0  program
            BINT9 %9                             * 1CBEA  algebraic
            BINT11 %10                           * 1CBF4  binary
            BINT12                               * 1CBFE  grob

* 11
* refs (5): 4C045 B7320 B7632 B78D0 B9270
%11:
            % 1.1E1                              * 1CC03
            BINT13                               * 1CC18  tagged

* 12
* refs (18): 9921A A4B96 AD1E6 AE26C B4FC0 B4FFD ...
%12:
            % 1.2E1                              * 1CC1D
            BINT14                               * 1CC32  unit

* 13
* refs (4): 8CEDD AF1C2 B5760 B763C
%13:
            % 1.3E1                              * 1CC37
            BINT15                               * 1CC4C  romptr

* 14
* refs (1): B7641
%14:
            % 1.4E1                              * 1CC51
            BINT31                               * 1CC66  bint

* 20
* refs (1): B765F
%20:
            % 2E1                                * 1CC6B
            BINT47                               * 1CC80  directory

* 15
* refs (1): B7646
%15:
            % 1.5E1                              * 1CC85
            # 3F                                 * 1CC9A  %%

* 21
* refs (1): B7664
%21:
            % 2.1E1                              * 1CCA4
            # 4F                                 * 1CCB9  C%%

* 22
* refs (1): B7669
%22:
            % 2.2E1                              * 1CCC3
            # 5F                                 * 1CCD8  linked-array

* 23
* refs (1): B766E
%23:
            % 2.3E1                              * 1CCE2
            # 6F                                 * 1CCF7  char

* 24
%24:
            % 2.4E1                              * 1CD01
            # 7F                                 * 1CD16  code

* 25
%25:
            % 2.5E1                              * 1CD20
            #8F_64D2E                            * 1CD35  library

* 16
* refs (3): B764B D34CF D35D7
%16:
            % 1.6E1                              * 1CD3A
            backup                               * 1CD4F  backup

* 17
* refs (1): B7650
%17:
            % 1.7E1                              * 1CD54

* 175d AFh
BINT_AFh:
            # AF                                 * 1CD69  library-data

* 26
%26:
            % 2.6E1                              * 1CD73
            BINT0                                * 1CD88  any

* 27
%27:
            % 2.7E1                              * 1CD8D
          ;                                      * 1CDA2
          SWAPDROP ;                             * 1CDA7

* refs (1): 1CBBD
dup;type(ar):
        :: DUP TYPERARRY? ITE %3 %4              * 1CDB1
        ;                                        * 1CDCF

* refs (1): 1CBE5
xTYPE~program:
        :: DUPROM-WORD? NOTcase %8               * 1CDD4
          ?OKINALG case                          * 1CDE8

* 18
* refs (1): B7655
%18:
          % 1.8E1                                * 1CDF2

* 19
* refs (1): B765A
%19:
          % 1.9E1 ;                              * 1CE07

* name -> n
* ROMPTR 002 0A7 VTYPE
* refs (1): 189EA
        CON(1)  8                                * 1CE21  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CE22  library
        CON(3)  #0A7                             * 1CE25  command
xVTYPE:
        :: CK1&Dispatch                          * 1CE28
          BINT6 vtype(nm)                        * 1CE32  name
          BINT7 vtype(nm)                        * 1CE3C  local
          BINT13 xVTYPE~tagged                   * 1CE46  tagged
        ;                                        * 1CE50

* refs (2): 1CE37 1CE41
vtype(nm):
        :: SAFE@                                 * 1CE55

* refs (1): 1CED2
xVTYPE~tagged~1:
          :: NOTcase %-1                         * 1CE5F
            XEQTYPE SWAPDROP ;                   * 1CE6E
        ;                                        * 1CE7D

* refs (1): 1CE4B
xVTYPE~tagged:
        :: ERRSET                                * 1CE82
          :: rcl(to) TRUE ; ERRTRAP              * 1CE8C
          :: ERROR@ # 204 #<>case ERRJMP         * 1CEA5
            ERRORCLR FALSE ;                     * 1CEC3
          xVTYPE~tagged~1 ;                      * 1CED2

* 'l=r' -> l r
* ROMPTR 002 0A8 EQ→
* refs (1): 189EA
        CON(1)  8                                * 1CEDC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CEDD  library
        CON(3)  #0A8                             * 1CEE0  command
xEQ>:
        :: CK1&Dispatch                          * 1CEE3
          BINT9 SPLITEQ                          * 1CEED  algebraic
          BINT1 %0_2A2B4                         * 1CEF7  real
          BINT2 %0_2A2B4                         * 1CF01  complex
          BINT6 %0_2A2B4                         * 1CF0B  name
          BINT7 %0_2A2B4                         * 1CF15  local
          BINT14 %0_2A2B4                        * 1CF1F  unit
        ;                                        * 1CF29

* sym -> arg1 arg2
* refs (4): 158A0 1CEF2 20D83 B4C37
SPLITEQ:
        :: INNERCOMP AEQ1stcase x=               * 1CF2E

* meta&ob -> 'M_rest''MetaLast'
drppargsym:
          :: plDRPpZparg CKSYMBN pshm1 CKSYMBN SWAPDROP ; CKSYMBN %0_2A2B4 ; * 1CF42

* ob -> ?
* ROMPTR 002 0A9 OBJ→
* refs (12): 189EA D3647 D3BBA D3D99 D3D9E D3DD4 ...
        CON(1)  8                                * 1CF74  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1CF75  library
        CON(3)  #0A9                             * 1CF78  command
xOBJ>:
        :: CK1&Dispatch                          * 1CF7B
          BINT13 TAG>                            * 1CF85  tagged
          BINT2 C%>%                             * 1CF8F  complex
          BINT3 DOSTR>                           * 1CF99  string
          BINT4 DOARRY>                          * 1CFA3  array
          BINT5 XEQLIST>                         * 1CFAD  list
          BINT9 EXPR>                            * 1CFB7  algebraic
          BINT14 UMU>                            * 1CFC1  unit
        ;                                        * 1CFCB

* sym -> arg1..argn %n ob
* refs (1): 1CFBC
EXPR>:
        :: symcomp EXPLODE EXPR>~1 NOTcase MISLIBERR * 1CFD0
          SWAP UNCOERCE SWAP ;                   * 1CFEE

* x1..xn n -> [] x11...xnm {n m} -> [[]]
* ROMPTR 002 0AA →ARRY
* refs (4): 189EA D36AC D3E7E D40E2
        CON(1)  8                                * 1D002  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D003  library
        CON(3)  #0AA                             * 1D006  command
x>ARRY:
        :: CK1&Dispatch                          * 1D009
          BINT5 ->arry(li)                       * 1D013  list
          BINT1 XEQ>VECTOR                       * 1D01D  real
        ;                                        * 1D027

* F%..F% %n -> [%F]
* refs (7): 1D022 1DEB1 1DF26 2C31F 4CB5E CC4F0 ...
XEQ>VECTOR:
        :: ONE{}N XEQ>ARRAY ;                    * 1D02C

* refs (1): 1D018
->arry(li):
        :: DUPDUP OBJ_1DF30 1GETABND             * 1D040

* F%..F% {#n #m} -> [F%]
* refs (5): 1D036 24861 24AB5 368EA 4CB4F
XEQ>ARRAY:
          :: COERCE{}2 DUPINCOMP #1=?SKIP #*OVF CKNFLOATS ROTSWAP MAKEARRY * 1D054
            >ARRY ;                              * 1D07C
        ;                                        * 1D086

* [] -> x1...xn {n} [[]] -> x11...xnm {n m}
* ROMPTR 002 0AB ARRY→
* refs (1): 189EA
        CON(1)  8                                * 1D08B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D08C  library
        CON(3)  #0AB                             * 1D08F  command
xARRY>:
        :: CK1&Dispatch                          * 1D092
          BINT4 DOARRY>                          * 1D09C  array
        ;                                        * 1D0A6

* [] -> F%..F% {#n #m}
* refs (4): 1CFA8 1D0A1 1DD5B 368D1
DOARRY>:
        :: ONE_DO_ARRY INDEX@ PULLEL SWAP LOOP DIMLIMITS UNCOERCE{}2 ; * 1D0AB

* ob size -> ob' name size -> ob= [] or [[]] size = {n} or {n m}
* ROMPTR 002 0AC RDM
* refs (1): 189EA
        CON(1)  8                                * 1D0D8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D0D9  library
        CON(3)  #0AC                             * 1D0DC  command
xRDM:
        :: CK2&Dispatch                          * 1D0DF
          BINT69 rdm(ar,li)                      * 1D0E9  array list
          BINT101 rdm(gn,li)                     * 1D0F3  name list
          BINT117 rdm(ln,li)                     * 1D0FD  local list
        ;                                        * 1D107

* refs (1): 1D0EE
rdm(ar,li):
        :: OBJ_1DFDF COERCE{}2 MATREDIM ;        * 1D10C

* refs (1): 1D0F8
rdm(gn,li):
        :: OBJ_1DFDF over;RclInVars(nm) dup;ar?#BAT! ROTDROPSWAP COERCE{}2 * 1D125
          @rdm(ar,ls) DROP ;                     * 1D143

* refs (1): 1D102
rdm(ln,li):
        :: OBJ_1DFDF over;RclInVars(nm) dup;ar?#BAT! SWAP COERCE{}2 MATREDIM * 1D152
          sto(nm,_) ;                            * 1D175

* { n } x -> [] { n k } x -> [[]] [] x -> []'
* ROMPTR 002 0AD CON
* refs (1): 189EA
        CON(1)  8                                * 1D17F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D180  library
        CON(3)  #0AD                             * 1D183  command
xCON:
        :: CK2&Dispatch                          * 1D186
          BINT81 con(li,nb)                      * 1D190  list real
          BINT82 con(li,nb)                      * 1D19A  list complex
          BINT65 MATCON                          * 1D1A4  array real
          BINT66 con(ar,c)                       * 1D1AE  array complex
          BINT97 con(gn,r)                       * 1D1B8  name real
          BINT98 con(gn,c)                       * 1D1C2  name complex
          BINT113 con(ln,r)                      * 1D1CC  local real
          # 72 con(ln,c)                         * 1D1D6  local complex
        ;                                        * 1D1E5

* refs (2): 1D195 1D19F
con(li,nb):
        :: DUP OBJ_1DF30 3GETLAM 1ABNDSWAP CK2NOLASTWD SWAP COERCE{}2 SWAP * 1D1EA
          MAKEARRY ;                             * 1D217

* refs (1): 1D1B3
con(ar,c):
        :: SWAP dup;ca?#BAT! SWAP MATCON ;       * 1D221

* refs (1): 1D1BD
con(gn,r):
        :: over;RclInVars(nm) dup;ar?#BAT! ROTDROPSWAP @con(ar,nb) DROP ; * 1D23F

* refs (1): 1D1C7
con(gn,c):
        :: over;RclInVars(nm) dup;ar?#BAT! dup;ca?#BAT! ROTDROPSWAP * 1D262
          @con(ar,nb) DROP ;                     * 1D27B

* refs (1): 1D1D1
con(ln,r):
        :: over;RclInVars(nm) dup;ar?#BAT! SWAP MATCON sto(nm,_) ; * 1D28A

* refs (1): 1D1E0
con(ln,c):
        :: over;RclInVars(nm) dup;ar?#BAT! dup;ca?#BAT! SWAP MATCON * 1D2AD
          sto(nm,_) ;                            * 1D2CB

* n -> [[]] [[]] -> [[]]' name -> [[]]
* ROMPTR 002 0AE IDN
* refs (1): 189EA
        CON(1)  8                                * 1D2D5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D2D6  library
        CON(3)  #0AE                             * 1D2D9  command
xIDN:
        :: CK1&Dispatch                          * 1D2DC
          BINT1 idn(r)                           * 1D2E6  real
          BINT4 MATIDN                           * 1D2F0  array
          BINT6 idn(gn)                          * 1D2FA  name
          BINT7 idn(ln)                          * 1D304  local
        ;                                        * 1D30E

* refs (1): 1D2EB
idn(r):
        :: COERCE DUP#0<> ?SKIP SETSIZEERR       * 1D313
          DUP TWO{}N %0_2A2B4 MAKEARRY MATIDN ;  * 1D32C

* refs (1): 1D2FF
idn(gn):
        :: dup;RclInVars(nm) dup;ar?#BAT! SWAPDROP @idn(ar) DROP ; * 1D34A

* refs (1): 1D309
idn(ln):
        :: dup;RclInVars(nm) dup;ar?#BAT! MATIDN sto(nm,_) ; * 1D36D

* [[]] -> [[]]' name ->
* ROMPTR 002 0AF TRN
* refs (2): 189EA D4062
        CON(1)  8                                * 1D38B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D38C  library
        CON(3)  #0AF                             * 1D38F  command
xTRN:
        :: CK1&Dispatch                          * 1D392
          BINT4 MATTRN                           * 1D39C  array
          BINT6 trn(gn)                          * 1D3A6  name
          BINT7 trn(ln)                          * 1D3B0  local
        ;                                        * 1D3BA

* refs (1): 1D3AB
trn(gn):
        :: dup;RclInVars(nm) dup;ar?#BAT! SWAPDROP @trn(ar) DROP ; * 1D3BF

* refs (1): 1D3B5
trn(ln):
        :: dup;RclInVars(nm) dup;ar?#BAT! MATTRN sto(nm,_) ; * 1D3E2

* ob pos obj -> ob' ob  = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B0 PUT
* refs (2): 189EA 1F947
        CON(1)  8                                * 1D400  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D401  library
        CON(3)  #0B0                             * 1D404  command
xPUT:
        :: CK3&Dispatch                          * 1D407
          LISTREALOB put(li,lr,_)                * 1D411  list real any
          LISTLISTOB put(li,lr,_)                * 1D41B  list list any
          IDLISTOB put(gn,lr,_)                  * 1D425  name list any
          # 750 put(ln,lr,_)                     * 1D42F  local list any
          IDREALOB put(gn,lr,_)                  * 1D43E  name real any
          # 710 put(ln,lr,_)                     * 1D448  local real any
          ARRYLISTREAL put(ar,lr,nb)             * 1D457  array list real
          ARRYLISTCMP put(ar,lr,nb)              * 1D461  array list complex
          ARRYREALREAL put(ar,lr,nb)             * 1D46B  array real real
          ARRYREALCMP put(ar,lr,nb)              * 1D475  array real complex
        ;                                        * 1D47F

* refs (2): 1D42A 1D443
put(gn,lr,_):
        :: OBJ_1E00C 3pick;RclInVars(nm) 3UNROLL CK&DISPATCH0 * 1D484
          ARRYLISTREAL put(gn,lr,_)~1            * 1D49D  array list real
          ARRYLISTCMP put(gn,lr,_)~1             * 1D4A7  array list complex
          ARRYREALREAL put(gn,lr,_)~1            * 1D4B1  array real real
          ARRYREALCMP put(gn,lr,_)~1             * 1D4BB  array real complex
          LISTLISTOB PutSto(nm,li,lr,_)          * 1D4C5  list list any
          LISTREALOB PutSto(nm,li,lr,_)          * 1D4CF  list real any
        ;                                        * 1D4D9

* refs (5): 1D45C 1D466 1D470 1D47A 1D5C9
put(ar,lr,nb):
        :: OBJ_1E00C OBJ_1DCC3 OBJ_1DC55 ABND BANGARRY ; * 1D4DE

* refs (4): 1D4A2 1D4AC 1D4B6 1D4C0
put(gn,lr,_)~1:
        :: 4ROLLDROP OBJ_1DCC3 OBJ_1DC55 ABND @put(nb,s,ar) ; * 1D501

* refs (3): 1D416 1D420 1D556
put(li,lr,_):
        :: OBJ_1E00C 3UNROLL OBJ_1DB5B SWAP ABND PUTLIST ; * 1D524

* refs (4): 1D4CA 1D4D4 1D5AB 1D5B5
PutSto(nm,li,lr,_):
        :: 'EvalNoCK:_sup put(li,lr,_) sto(nm,_) ; * 1D54C

* refs (2): 1D439 1D452
put(ln,lr,_):
        :: OBJ_1E00C 3pick;RclInVars(nm) 3UNROLL CK&DISPATCH0 * 1D565
          ARRYLISTREAL PutSto(nm,ar,ln,nb)       * 1D57E  array list real
          ARRYLISTCMP PutSto(nm,ar,ln,nb)        * 1D588  array list complex
          ARRYREALREAL PutSto(nm,ar,ln,nb)       * 1D592  array real real
          ARRYREALCMP PutSto(nm,ar,ln,nb)        * 1D59C  array real complex
          LISTLISTOB PutSto(nm,li,lr,_)          * 1D5A6  list list any
          LISTREALOB PutSto(nm,li,lr,_)          * 1D5B0  list real any
        ;                                        * 1D5BA

* refs (4): 1D583 1D58D 1D597 1D5A1
PutSto(nm,ar,ln,nb):
        :: 'EvalNoCK:_sup put(ar,lr,nb) sto(nm,_) ; * 1D5BF

* ob pos obj -> [] pos' ob  = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B1 PUTI
* refs (1): 189EA
        CON(1)  8                                * 1D5D8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D5D9  library
        CON(3)  #0B1                             * 1D5DC  command
xPUTI:
        :: CK3&Dispatch                          * 1D5DF
          LISTREALOB puti(li,lr,_)               * 1D5E9  list real any
          LISTLISTOB puti(li,lr,_)               * 1D5F3  list list any
          IDLISTOB puti(gn,lr,_)                 * 1D5FD  name list any
          IDREALOB puti(gn,lr,_)                 * 1D607  name real any
          # 750 puti(ln,lr,_)                    * 1D611  local list any
          # 710 puti(ln,lr,_)                    * 1D620  local real any
          ARRYLISTREAL puti(ar,lr,nb)            * 1D62F  array list real
          ARRYLISTCMP puti(ar,lr,nb)             * 1D639  array list complex
          ARRYREALREAL puti(ar,lr,nb)            * 1D643  array real real
          ARRYREALCMP puti(ar,lr,nb)             * 1D64D  array real complex
        ;                                        * 1D657

* refs (2): 1D602 1D60C
puti(gn,lr,_):
        :: OBJ_1E00C 3pick;RclInVars(nm) 3UNROLL CK&DISPATCH0 * 1D65C
          ARRYLISTREAL @puti(ar,lr,nb)           * 1D675  array list real
          ARRYLISTCMP @puti(ar,lr,nb)            * 1D67F  array list complex
          ARRYREALREAL @puti(ar,lr,nb)           * 1D689  array real real
          ARRYREALCMP @puti(ar,lr,nb)            * 1D693  array real complex
          LISTLISTOB PutiSto(nm,li,lr,_)         * 1D69D  list list any
          LISTREALOB PutiSto(nm,li,lr,_)         * 1D6A7  list real any
        ;                                        * 1D6B1

* refs (5): 1D634 1D63E 1D648 1D652 1D7AB
puti(ar,lr,nb):
        :: OBJ_1E00C OBJ_1DCC3 OBJ_1DC55 OBJ_1DA02 BANGARRY 1GETABND ; * 1D6B6

* refs (4): 1D67A 1D684 1D68E 1D698
@puti(ar,lr,nb):
        :: OBJ_1DCC3 OBJ_1DC55 OBJ_1DA02 @put(nb,s,ar) 1GETABND ; * 1D6DE

* refs (3): 1D5EE 1D5F8 1D733
puti(li,lr,_):
        :: OBJ_1E00C 3UNROLL OBJ_1DB5B OBJ_1DAED PUTLIST 1GETABND ; * 1D701

* refs (4): 1D6A2 1D6AC 1D78D 1D797
PutiSto(nm,li,lr,_):
        :: 'EvalNoCK:_sup puti(li,lr,_) SWAP3PICK SAFESTO ; * 1D729

* refs (2): 1D61B 1D62A
puti(ln,lr,_):
        :: OBJ_1E00C 3pick;RclInVars(nm) 3UNROLL CK&DISPATCH0 * 1D747
          ARRYLISTREAL PutiLSto(ln,ar,lr,nb)     * 1D760  array list real
          ARRYLISTCMP PutiLSto(ln,ar,lr,nb)      * 1D76A  array list complex
          ARRYREALREAL PutiLSto(ln,ar,lr,nb)     * 1D774  array real real
          ARRYREALCMP PutiLSto(ln,ar,lr,nb)      * 1D77E  array real complex
          LISTLISTOB PutiSto(nm,li,lr,_)         * 1D788  list list any
          LISTREALOB PutiSto(nm,li,lr,_)         * 1D792  list real any
        ;                                        * 1D79C

* refs (4): 1D765 1D76F 1D779 1D783
PutiLSto(ln,ar,lr,nb):
        :: 'EvalNoCK:_sup puti(ar,lr,nb) SWAP3PICK STO ; * 1D7A1

* ob n -> elm ob = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B2 GET
* refs (4): 189EA 1F85C D2F7C D2F94
        CON(1)  8                                * 1D7BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D7C0  library
        CON(3)  #0B2                             * 1D7C3  command
xGET:
        :: CK2&Dispatch                          * 1D7C6
          BINT69 get(ar,lr)                      * 1D7D0  array list
          BINT65 get(ar,lr)                      * 1D7DA  array real
          BINT85 get(cp,lr)                      * 1D7E4  list list
          BINT81 get(cp,lr)                      * 1D7EE  list real
          BINT101 get(nm,lr)                     * 1D7F8  name list
          BINT117 get(nm,lr)                     * 1D802  local list
          BINT97 get(nm,lr)                      * 1D80C  name real
          BINT113 get(nm,lr)                     * 1D816  local real
        ;                                        * 1D820

* refs (4): 1D7FD 1D807 1D811 1D81B
get(nm,lr):
        :: OBJ_1DFDF over;RclInVars(nm) ROTDROPSWAP CK&DISPATCH0 * 1D825
          BINT69 Get!(ar,lr)                     * 1D83E  array list
          BINT65 Get!(ar,lr)                     * 1D848  array real
          BINT85 Get!(cp,lr)                     * 1D852  list list
          BINT81 Get!(cp,lr)                     * 1D85C  list real
        ;                                        * 1D866

* refs (2): 1D7D5 1D7DF
get(ar,lr):
        :: OBJ_1DFDF                             * 1D86B

* refs (2): 1D843 1D84D
Get!(ar,lr):
          :: OBJ_1DC6E ABND PULLEL SWAPDROP ; ;  * 1D875

* refs (2): 1D7E9 1D7F3
get(cp,lr):
        :: OBJ_1DFDF                             * 1D898

* refs (2): 1D857 1D861
Get!(cp,lr):
          :: OBJ_1DB5B ABND NTHCOMPDROP ; ;      * 1D8A2

* ob pos -> ob' pos' elm ob = [] or [[]] or {} or name pos = n or {n} or {n m}
* ROMPTR 002 0B3 GETI
* refs (1): 189EA
        CON(1)  8                                * 1D8C0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1D8C1  library
        CON(3)  #0B3                             * 1D8C4  command
xGETI:
        :: CK2&Dispatch                          * 1D8C7
          BINT69 geti(ar,lr)                     * 1D8D1  array list
          BINT65 geti(ar,lr)                     * 1D8DB  array real
          BINT85 geti!(cp,lr)                    * 1D8E5  list list
          BINT81 geti!(cp,lr)                    * 1D8EF  list real
          BINT101 geti(nm,lr)                    * 1D8F9  name list
          BINT117 geti(nm,lr)                    * 1D903  local list
          BINT97 geti(nm,lr)                     * 1D90D  name real
          BINT113 geti(nm,lr)                    * 1D917  local real
        ;                                        * 1D921

* refs (4): 1D8FE 1D908 1D912 1D91C
geti(nm,lr):
        :: OBJ_1DFDF over;RclInVars(nm) SWAP CK&DISPATCH0 * 1D926
          BINT69 geti(nm,lr)~1                   * 1D93F  array list
          BINT65 geti(nm,lr)~1                   * 1D949  array real
          BINT85 geti(nm,lr)~2                   * 1D953  list list
          BINT81 geti(nm,lr)~2                   * 1D95D  list real
        ;                                        * 1D967

* refs (2): 1D8D6 1D8E0
geti(ar,lr):
        :: OBJ_1DFDF                             * 1D96C

* refs (2): 1D9AD 31B60
geti(cp,lr):
          :: OBJ_1DC6E SWAP OBJ_1DA02 SWAP PULLEL 1GETABND SWAP ; ; * 1D976

* refs (2): 1D944 1D94E
geti(nm,lr)~1:
        :: geti(cp,lr) ROTDROP ;                 * 1D9A8

* refs (3): 1D8EA 1D8F4 1D9F3
geti!(cp,lr):
        :: OBJ_1DFDF OBJ_1DB5B OBJ_1DAED DUPROT NTHCOMPDROP 1GETABND SWAP ; * 1D9BC

* refs (2): 1D958 1D962
geti(nm,lr)~2:
        :: 'EvalNoCK:_sup geti!(cp,lr) ROTDROP ; * 1D9E9

* refs (3): 1D6CA 1D6ED 1D985
OBJ_1DA02:
        :: BINT64 ClrSysFlag 2DUP 1GETLAM REALcase * 1DA02
          :: ARSIZE OBJ_1DB29 1PUTLAM ;          * 1DA20
          DIMLIMITS INNER#1= case                * 1DA39
          :: OBJ_1DB29 ONE{}N 1PUTLAM ;          * 1DA48
          2DUP #* 4PICK #=ITE                    * 1DA61
          :: 3DROP ONEONE BINT64 SetSysFlag ;    * 1DA75
          :: ROT#1+ ROTDROP OVER #/ OVER#0= ITE SWAP * 1DA93

* ob ob' # -> ob' #+1 ob
#1+ROT:
            :: #1+ ROT ;                         * 1DABB
            DROPSWAP ;                           * 1DACF
          UNCOERCE2 TWO{}N 1PUTLAM ;             * 1DAD9

* refs (2): 1D715 1D9CB
OBJ_1DAED:
        :: BINT64 ClrSysFlag SWAP2DUP LENCOMP OBJ_1DB29 1GETLAM REALcase * 1DAED
          1PUTLAM                                * 1DB15
          ONE{}N 1PUTLAM ;                       * 1DB1A

* refs (3): 1DA2A 1DA4D 1DB06
OBJ_1DB29:
        :: #=casedrop                            * 1DB29
          :: %1 BINT64 SetSysFlag ;              * 1DB33
          #1+ UNCOERCE ;                         * 1DB4C

* refs (4): 1D533 1D710 1D8A7 1D9C6
OBJ_1DB5B:
        :: DUP1LAMBIND DUPTYPEREAL? ?SKIP        * 1DB5B

break;<>1?:BAV!:
          :: INNERCOMP #1<> caseSIZEERR ;        * 1DB6F
          COERCE DUP#0=case SETSIZEERR           * 1DB88
          OVER LENCOMP OVER#< caseSIZEERR ;      * 1DB97

* el # M -> M'
* refs (9): 1D4F7 1D6CF 8E383 8EF00 8F04E 8F159 ...
BANGARRY:
        :: CKREF 3UNROLL PUTEL ;                 * 1DBB0

* refs (2): 1D51A 1D6F2
@put(nb,s,ar):
        :: REFERENCED? IT                        * 1DBC9
          :: TOTEMPOBADJ SWAPDROP ;              * 1DBD8
          3UNROLL PUTEL DROP ;                   * 1DBEC

* ob #i {} -> {}'
* refs (15): 1D542 1D71A 41EFA 41F04 4364E 9E0F0 ...
PUTLIST:
        :: 3UNROLL 2NULLLAM{} BIND INNERDUP 1GETLAM #- #2+ROLL DROP 2GETLAM * 1DC00
          OVER 1GETLAM #- #2+UNROLL ABND {}N ;   * 1DC32

* refs (4): 1D4ED 1D510 1D6C5 1D6E8
OBJ_1DC55:
        :: 3UNROLL OBJ_1DC6E SWAP ;              * 1DC55

* refs (3): 1D87A 1D97B 1DC5F
OBJ_1DC6E:
        :: DUP1LAMBIND dLISTcase                 * 1DC6E

chk(ar,lr):
          :: COERCE{}2 OVER ARRYEL? ?SKIP SETSIZEERR * 1DC7D
          ;                                      * 1DC9B
          COERCE DUP#0=case SETSIZEERR           * 1DCA0
          OVERARSIZE OVER#< caseSIZEERR ;        * 1DCAF

* refs (4): 1D4E8 1D50B 1D6C0 1D6E3
OBJ_1DCC3:
        :: 3PICK TYPERARRY? OVER REALcase        * 1DCC3
          :: ?SEMI                               * 1DCDC
            Re>C% ;                              * 1DCE6
          NOT?SEMI                               * 1DCF0
          SETTYPEERR ;                           * 1DCF5

* []/() -> x y -> x y z (in current co-system)
* ROMPTR 002 0B4 V→
* refs (1): 189EA
        CON(1)  8                                * 1DCFF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DD00  library
        CON(3)  #0B4                             * 1DD03  command
xV>:
        :: CK1&Dispatch                          * 1DD06
          BINT2 v->(c)                           * 1DD10  complex
          BINT4 v->(ar)                          * 1DD1A  array
        ;                                        * 1DD24

* refs (2): 1DD15 68C56
v->(c):
        :: OBJ_1DE19 %%>% ;                      * 1DD29

* refs (1): 1DD1F
v->(ar):
        :: OBJ_1DD51 %%>% ;                      * 1DD3D

* refs (2): 174D7 1DD42
OBJ_1DD51:
        :: dup;ra?#BAT! DOARRY> INNERCOMP #1= NcaseDIMERR %2 * 1DD51
          EQcasedrop OBJ_1DE28                   * 1DD74
          %3 %<> case SKIP                       * 1DD7E
          BINT16 TestSysFlag NOTcase SKIP        * 1DD92
          3UNROLL 2%>%% %%R>P BINT15 TestSysFlag IT * 1DDA6
          :: ROT %>%% ROT %%R>P 2@REVAL SWAPROT ; * 1DDC4

* refs (1): 1DE4B
OBJ_1DDEC:
          :: 2@REVAL SWAP 2@REVAL SWAP ; ROT COLASKIP ; * 1DDEC

* refs (3): 17572 1DD2E 352CD
OBJ_1DE19:
        :: C%>% COLA                             * 1DE19

* refs (1): 1DD79
OBJ_1DE28:
          :: BINT16 TestSysFlag NOTcase SKIP     * 1DE28
            2%>%% %%R>P OBJ_1DDEC COLASKIP ;     * 1DE41
        ;                                        * 1DE5A

* x y -> [] -> ()
* ROMPTR 002 0B5 →V2
* refs (1): 189EA
        CON(1)  8                                * 1DE5F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DE60  library
        CON(3)  #0B5                             * 1DE63  command
x>V2:
        :: CK2&Dispatch                          * 1DE66
          BINT17 x>V2~real,real                  * 1DE70  real real
        ;                                        * 1DE7A

* refs (1): 1DE75
x>V2~real,real:
        :: BINT16 TestSysFlag IT %POL>%REC       * 1DE7F
          BINT19 TestSysFlag case %>C%           * 1DE98
          %2 XEQ>VECTOR ;                        * 1DEAC

* x y z -> []
* ROMPTR 002 0B6 →V3
* refs (1): 189EA
        CON(1)  8                                * 1DEBB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1DEBC  library
        CON(3)  #0B6                             * 1DEBF  command
x>V3:
        :: CK3&Dispatch                          * 1DEC2
          3REAL ->v3(3r)                         * 1DECC  real real real
        ;                                        * 1DED6

* refs (1): 1DED1
->v3(3r):
        :: BINT16 TestSysFlag IT                 * 1DEDB
          :: BINT15 SysITE %SPH>%REC             * 1DEEF
            :: 3UNROLL %POL>%REC ROT ; ;         * 1DF03
          %3 XEQ>VECTOR ;                        * 1DF21

* refs (11): 1D04A 1D1F4 1DFF3 1E025 330C6 C1677 ...
OBJ_1DF30:
        :: 3PICK NULLCOMP? caseSIZEERR NULL{}    * 1DF30
          DUP 4NULLLAM{} BIND >R                 * 1DF49
L_1DF5D:
          ticR NOT?SEMI                          * 1DF5D
          DUPTYPEREAL? ?SKIP                     * 1DF67
          :: CRUNCH CK1NoBlame CK&DISPATCH1      * 1DF71
            BINT1 NOP                            * 1DF85  real
            BINT2 C>Re%                          * 1DF8F  complex
            BINT14                               * 1DF99  unit
            :: DUP 2PUTLAM U>nbr ;               * 1DF9E
          ;                                      * 1DFB7
          1GETLAM SWAP >TCOMP 1PUTLAM GOTO L_1DF5D ; * 1DFBC

* refs (10): 1D111 1D12A 1D157 1D82A 1D870 1D89D ...
OBJ_1DFDF:
        :: DUPTYPEREAL? ?SEMI                    * 1DFDF
          SWAPDUP OBJ_1DF30 3GETLAM 1GETABND CK2NOLASTWD ; * 1DFEE

* refs (8): 1D489 1D4E3 1D529 1D56A 1D661 1D6BB ...
OBJ_1E00C:
        :: OVER TYPEREAL? ?SEMI                  * 1E00C
          ROT OBJ_1DF30 3GETLAM 4GETLAM 1ABNDSWAP CK3NOLASTWD ; * 1E020

* name -> {name} -> {name x1 x2} -> {x1 x2} -> x1 x2 ->
* ROMPTR 002 0B7 INDEP
* refs (6): 189EA 47A83 D372E D3902 D39BB D3AAA
        CON(1)  8                                * 1E043  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E044  library
        CON(3)  #0B7                             * 1E047  command
xINDEP:
        :: CK1&Dispatch                          * 1E04A
          BINT6 PUTINDEP                         * 1E054  name
          BINT5 PUTINDEPLIST                     * 1E05E  list
          BINT1 indep(2r)                        * 1E068  real
        ;                                        * 1E072

* (x,y) ->
* ROMPTR 002 0B8 PMIN
* refs (1): 189EA
        CON(1)  8                                * 1E077  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E078  library
        CON(3)  #0B8                             * 1E07B  command
xPMIN:
        :: CK1&Dispatch                          * 1E07E
          BINT2 pmin(c)                          * 1E088  complex
        ;                                        * 1E092

* (x,y) ->
* ROMPTR 002 0B9 PMAX
* refs (1): 189EA
        CON(1)  8                                * 1E097  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E098  library
        CON(3)  #0B9                             * 1E09B  command
xPMAX:
        :: CK1&Dispatch                          * 1E09E
          BINT2 pmax(c)                          * 1E0A8  complex
        ;                                        * 1E0B2

* c -> {c tick $x $y } ->
* ROMPTR 002 0BA AXES
* refs (2): 189EA D37E0
        CON(1)  8                                * 1E0B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E0B8  library
        CON(3)  #0BA                             * 1E0BB  command
xAXES:
        :: CK1&Dispatch                          * 1E0BE
          BINT2 ax*s(c)                          * 1E0C8  complex
          BINT5 ax*s(li)                         * 1E0D2  list
        ;                                        * 1E0DC

* (x,y) -> x     ->
* ROMPTR 002 0BB CENTR
* refs (1): 189EA
        CON(1)  8                                * 1E0E1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E0E2  library
        CON(3)  #0BB                             * 1E0E5  command
xCENTR:
        :: CK1&Dispatch                          * 1E0E8
          BINT2 centr(c)                         * 1E0F2  complex
          BINT1                                  * 1E0FC  real

centr(r):
          :: %0_2A2B4 %>C% centr(c) ;            * 1E101
        ;                                        * 1E11A

* n_int -> #n_int ->
* ROMPTR 002 0BC RES
* refs (3): 189EA D37FA D3A88
        CON(1)  8                                * 1E11F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E120  library
        CON(3)  #0BC                             * 1E123  command
xRES:
        :: CK1&Dispatch                          * 1E126
          BINT1 res(r)                           * 1E130  real
          BINT11 PUTRES                          * 1E13A  binary
        ;                                        * 1E144

* xf ->
* ROMPTR 002 0BD *H
* refs (1): 189EA
        CON(1)  8                                * 1E149  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E14A  library
        CON(3)  #0BD                             * 1E14D  command
x*H:
        :: CK1&Dispatch                          * 1E150
          BINT1 VSCALE                           * 1E15A  real
        ;                                        * 1E164

* yf ->
* ROMPTR 002 0BE *W
* refs (1): 189EA
        CON(1)  8                                * 1E169  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E16A  library
        CON(3)  #0BE                             * 1E16D  command
x*W:
        :: CK1&Dispatch                          * 1E170
          BINT1 HSCALE                           * 1E17A  real
        ;                                        * 1E184

* ->
* ROMPTR 002 0BF DRAW
* refs (15): 189EA C67F7 C6806 D308E D31C9 D336C ...
        CON(1)  8                                * 1E189  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E18A  library
        CON(3)  #0BF                             * 1E18D  command
xDRAW:
        :: CK0 draw ;                            * 1E190

* ->
* ROMPTR 002 0C0 AUTO
* refs (1): 189EA
        CON(1)  8                                * 1E1A4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1A5  library
        CON(3)  #0C0                             * 1E1A8  command
xAUTO:
        :: CK0 AUTOSCALE ;                       * 1E1AB

* ->
* ROMPTR 002 0C1 DRAX
* refs (7): 189EA D37FF D38A3 D3938 D3A22 D3B17 ...
        CON(1)  8                                * 1E1BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1C0  library
        CON(3)  #0C1                             * 1E1C3  command
xDRAX:
        :: CK0 drax ;                            * 1E1C6

* xs ys ->
* ROMPTR 002 0C2 SCALE
* refs (1): 189EA
        CON(1)  8                                * 1E1DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1DB  library
        CON(3)  #0C2                             * 1E1DE  command
xSCALE:
        :: CK2&Dispatch                          * 1E1E1
          BINT17 PUTSCALE                        * 1E1EB  real real
        ;                                        * 1E1F5

* (xmin,ymin) (xmax,ymax) -> #width #height ->
* ROMPTR 002 0C3 PDIM
* refs (1): 189EA
        CON(1)  8                                * 1E1FA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E1FB  library
        CON(3)  #0C3                             * 1E1FE  command
xPDIM:
        :: CK2&Dispatch                          * 1E201
          BINT34 pdim(2c)                        * 1E20B  complex complex
          2HXS pdim(2b)                          * 1E215  binary binary
        ;                                        * 1E21F

* name -> {name} -> {name y1 y2} -> {y1 y2} -> y1 y2 ->
* ROMPTR 002 0C4 DEPND
* refs (3): 189EA 47AA6 D3794
        CON(1)  8                                * 1E224  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E225  library
        CON(3)  #0C4                             * 1E228  command
xDEPND:
        :: CK1&Dispatch                          * 1E22B
          BINT6 depnd(gn)                        * 1E235  name
          BINT5 depnd(li)                        * 1E23F  list
          BINT1 xDEPND~real                      * 1E249  real
        ;                                        * 1E253

* ->
* ROMPTR 002 0C5 ERASE
* refs (1): 189EA
        CON(1)  8                                * 1E258  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E259  library
        CON(3)  #0C5                             * 1E25C  command
xERASE:
        :: CK0 DOERASE ;                         * 1E25F

* {#m #n} -> (x,y)
* ROMPTR 002 0C6 PX→C
* refs (1): 189EA
        CON(1)  8                                * 1E273  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E274  library
        CON(3)  #0C6                             * 1E277  command
xPX>C:
        :: CK1&Dispatch                          * 1E27A
          BINT5 DOPX>C                           * 1E284  list
        ;                                        * 1E28E

* (x,y) -> {#n #m}
* ROMPTR 002 0C7 C→PX
* refs (1): 189EA
        CON(1)  8                                * 1E293  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E294  library
        CON(3)  #0C7                             * 1E297  command
xC>PX:
        :: CK1&Dispatch                          * 1E29A
          BINT2 DOC>PX                           * 1E2A4  complex
        ;                                        * 1E2AE

* ->
* ROMPTR 002 0C8 PICTURE
* refs (17): 189EA 3B43C C680B C70D6 C70FE C7126 ...
        CON(1)  8                                * 1E2B3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2B4  library
        CON(3)  #0C8                             * 1E2B7  command
xGRAPH:
        :: CK0 OBJ_4DA3F ;                       * 1E2BA

* ->
* ROMPTR 002 0C9 LABEL
* refs (2): 189EA 3E7D9
        CON(1)  8                                * 1E2CE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2CF  library
        CON(3)  #0C9                             * 1E2D2  command
xLABEL:
        :: CK0 label ;                           * 1E2D5

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CA PVIEW
* refs (1): 189EA
        CON(1)  8                                * 1E2E9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E2EA  library
        CON(3)  #0CA                             * 1E2ED  command
xPVIEW:
        :: CK1&Dispatch                          * 1E2F0
          BINT2 pview(c)                         * 1E2FA  complex
          BINT5 xPVIEW~list                      * 1E304  list
        ;                                        * 1E30E

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CB PIXON
* refs (1): 189EA
        CON(1)  8                                * 1E313  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E314  library
        CON(3)  #0CB                             * 1E317  command
xPIXON:
        :: CK1&Dispatch                          * 1E31A
          BINT2 pixon(c)                         * 1E324  complex
          BINT5 pixon(li)                        * 1E32E  list
        ;                                        * 1E338

* (x,y) -> {#n #m} ->
* ROMPTR 002 0CC PIXOFF
* refs (1): 189EA
        CON(1)  8                                * 1E33D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E33E  library
        CON(3)  #0CC                             * 1E341  command
xPIXOFF:
        :: CK1&Dispatch                          * 1E344
          BINT2 pixoff(c)                        * 1E34E  complex
          BINT5 pixoff(li)                       * 1E358  list
        ;                                        * 1E362

* (x,y) -> 1/0 {#n #m} -> 1/0
* ROMPTR 002 0CD PIX?
* refs (1): 189EA
        CON(1)  8                                * 1E367  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E368  library
        CON(3)  #0CD                             * 1E36B  command
xPIX?:
        :: CK1&Dispatch                          * 1E36E
          BINT2 pix?(c)                          * 1E378  complex
          BINT5 pix?(li)                         * 1E382  list
        ;                                        * 1E38C

* (x1,y1) (x2,y2) -> {#n1 #m1} {#n2 #m2} ->
* ROMPTR 002 0CE LINE
* refs (2): 189EA 3E82F
        CON(1)  8                                * 1E391  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E392  library
        CON(3)  #0CE                             * 1E395  command
xLINE:
        :: CK2&Dispatch                          * 1E398
          BINT85 line(2li)                       * 1E3A2  list list
          BINT34 line(2c)                        * 1E3AC  complex complex
        ;                                        * 1E3B6

* (x1,y1) (x2,y2) -> {#n1 #m1} {#n2 #m2} ->
* ROMPTR 002 0CF TLINE
* refs (2): 189EA 3E843
        CON(1)  8                                * 1E3BB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E3BC  library
        CON(3)  #0CF                             * 1E3BF  command
xTLINE:
        :: CK2&Dispatch                          * 1E3C2
          BINT85 tline(2li)                      * 1E3CC  list list
          BINT34 tline(2c)                       * 1E3D6  complex complex
        ;                                        * 1E3E0

* {#n1 #m1} {#n2 #m2} -> c1 c2 ->
* ROMPTR 002 0D0 BOX
* refs (2): 189EA 3E857
        CON(1)  8                                * 1E3E5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E3E6  library
        CON(3)  #0D0                             * 1E3E9  command
xBOX:
        :: CK2&Dispatch                          * 1E3EC
          BINT85 box(2li)                        * 1E3F6  list list
          BINT34 box(2c)                         * 1E400  complex complex
        ;                                        * 1E40A

* #width #height -> grob
* ROMPTR 002 0D1 BLANK
* refs (1): 189EA
        CON(1)  8                                * 1E40F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E410  library
        CON(3)  #0D1                             * 1E413  command
xBLANK:
        :: CK2&Dispatch                          * 1E416
          2HXS blank(2b)                         * 1E420  binary binary
        ;                                        * 1E42A

* -> PICT
* ROMPTR 002 0D2 PICT
* refs (17): 189EA 1CA8F 1E445 3C1AB 51152 D2FCB ...
        CON(1)  8                                * 1E42F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E430  library
        CON(3)  #0D2                             * 1E433  command
xPICT:
        :: CK0 ' xPICT ;                         * 1E436

* g_targ {#n #m} grob -> g_targ' g_targ (x,y) grob -> g_targ' PICT ... ... ->
* ROMPTR 002 0D3 GOR
* refs (1): 189EA
        CON(1)  8                                * 1E44F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E450  library
        CON(3)  #0D3                             * 1E453  command
xGOR:
        :: CK3&Dispatch                          * 1E456
          # C5C                                  * 1E460  grob list grob

gor(go,li,go):
          :: TRUE g?or(go,li,go,?) ;             * 1E46A
          # C2C                                  * 1E47E  grob complex grob

gor(go,c,go):
          :: TRUE g?or(go,c,go,?) ;              * 1E488
          # 85C                                  * 1E49C  program list grob
          :: TRUE g?or(PICT,c,go,?) ;            * 1E4A6
          # 82C                                  * 1E4BA  program complex grob

gor(PHPHPc,go):
          :: TRUE g?or(PICT,c,go,?) ;            * 1E4C4
        ;                                        * 1E4D8

* g_targ {#n #m} g_src -> g_targ' g_targ (x,y) g_src -> g_targ' PICT ... ... ->
* ROMPTR 002 0D4 GXOR
* refs (1): 189EA
        CON(1)  8                                * 1E4DD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E4DE  library
        CON(3)  #0D4                             * 1E4E1  command
xGXOR:
        :: CK3&Dispatch                          * 1E4E4
          # C5C                                  * 1E4EE  grob list grob

gxor(go,li,go):
          :: FALSE g?or(go,li,go,?) ;            * 1E4F8
          # C2C                                  * 1E50C  grob complex grob

gxor(go,c,go):
          :: FALSE g?or(go,c,go,?) ;             * 1E516
          # 85C                                  * 1E52A  program list grob

gxor(PICT,li,go):
          :: FALSE g?or(PICT,c,go,?) ;           * 1E534
          # 82C                                  * 1E548  program complex grob

gxor(PICT,c,go):
          :: FALSE g?or(PICT,c,go,?) ;           * 1E552
        ;                                        * 1E566

* -> grob
* ROMPTR 002 0D5 LCD→
* refs (1): 189EA
        CON(1)  8                                * 1E56B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E56C  library
        CON(3)  #0D5                             * 1E56F  command
xLCD>:
        :: CK0 DOLCD> ;                          * 1E572

* grob ->
* ROMPTR 002 0D6 →LCD
* refs (3): 189EA C713A C7149
        CON(1)  8                                * 1E586  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E587  library
        CON(3)  #0D6                             * 1E58A  command
x>LCD:
        :: CK1&Dispatch                          * 1E58D
          BINT12 DO>LCD                          * 1E597  grob
        ;                                        * 1E5A1

* ob n_chrsize -> grob
* ROMPTR 002 0D7 →GROB
* refs (1): 189EA
        CON(1)  8                                * 1E5A6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E5A7  library
        CON(3)  #0D7                             * 1E5AA  command
x>GROB:
        :: CK2&Dispatch                          * 1E5AD
          # 1 ->grob(_,r)                        * 1E5B7  real
        ;                                        * 1E5C6

* c r \Gh1 \Gh2 -> {#x #y} #r \Gh1 \Gh2 ->
* ROMPTR 002 0D8 ARC
* refs (1): 189EA
        CON(1)  8                                * 1E5CB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E5CC  library
        CON(3)  #0D8                             * 1E5CF  command
xARC:
        :: CK4&Dispatch                          * 1E5D2
          # 2111 arc(c,3r)                       * 1E5DC  complex real real real
          # 5B11 arc(li,b,2r)                    * 1E5EB  list binary real real
        ;                                        * 1E5FA

* ->
* ROMPTR 002 0D9 TEXT
* refs (1): 189EA
        CON(1)  8                                * 1E5FF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E600  library
        CON(3)  #0D9                             * 1E603  command
xTEXT:
        :: CK0 text ;                            * 1E606

* x1 x2 ->
* ROMPTR 002 0DA XRNG
* refs (2): 189EA D36FD
        CON(1)  8                                * 1E61A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E61B  library
        CON(3)  #0DA                             * 1E61E  command
xXRNG:
        :: CK2&Dispatch                          * 1E621
          BINT17 xrng(2r)                        * 1E62B  real real
        ;                                        * 1E635

* y1 y2 ->
* ROMPTR 002 0DB YRNG
* refs (2): 189EA D370C
        CON(1)  8                                * 1E63A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E63B  library
        CON(3)  #0DB                             * 1E63E  command
xYRNG:
        :: CK2&Dispatch                          * 1E641
          BINT17 yrng(2r)                        * 1E64B  real real
        ;                                        * 1E655

* ->
* ROMPTR 002 0DC FUNCTION
* refs (9): 189EA 46DA0 512A6 A54EA A5632 A60DD ...
        CON(1)  8                                * 1E65A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E65B  library
        CON(3)  #0DC                             * 1E65E  command
xFUNCTION:
        ROMPTR 0F1 033                           * 1E661  FUNCTION
        BSS     14                               * 1E66C

* ->
* ROMPTR 002 0DD CONIC
* refs (8): 189EA 512BA A550A A5652 A610D A6255 ...
        CON(1)  8                                * 1E67A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E67B  library
        CON(3)  #0DD                             * 1E67E  command
xCONIC:
        ROMPTR 0F1 034                           * 1E681  CONIC
        BSS     14                               * 1E68C

* ROMPTR 002 0DE
* refs (9): 189EA 46DB1 512CE A54FA A5642 A60ED ...
        CON(1)  8                                * 1E69A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E69B  library
        CON(3)  #0DE                             * 1E69E  command
POLAR:
        ROMPTR 0F1 035                           * 1E6A1  POLAR
        BSS     14                               * 1E6AC

* ->
* ROMPTR 002 0DF PARAMETRIC
* refs (9): 189EA 46DC2 512E2 A552A A5672 A60FD ...
        CON(1)  8                                * 1E6BA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6BB  library
        CON(3)  #0DF                             * 1E6BE  command
xPARAMETRIC:
        ROMPTR 0F1 036                           * 1E6C1  PARAMETRIC
        BSS     14                               * 1E6CC

* ->
* ROMPTR 002 0E0 TRUTH
* refs (8): 189EA 512F6 A551A A5662 A611D A6265 ...
        CON(1)  8                                * 1E6DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6DB  library
        CON(3)  #0E0                             * 1E6DE  command
xTRUTH:
        ROMPTR 0F1 037                           * 1E6E1  TRUTH
        BSS     14                               * 1E6EC

* ROMPTR 002 0E1 SCATTER
* refs (8): 189EA 5130A A5570 A56B8 A6163 A62AB ...
        CON(1)  8                                * 1E6FA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E6FB  library
        CON(3)  #0E1                             * 1E6FE  command
xSCATTER:
        ROMPTR 0F1 038                           * 1E701  SCATTER
        BSS     14                               * 1E70C

* ->
* ROMPTR 002 0E2 HISTOGRAM
* refs (8): 189EA 5131E A5550 A5698 A6143 A628B ...
        CON(1)  8                                * 1E71A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E71B  library
        CON(3)  #0E2                             * 1E71E  command
xHISTOGRAM:
        ROMPTR 0F1 039                           * 1E721  HISTOGRAM
        BSS     14                               * 1E72C

* ->
* ROMPTR 002 0E3 BAR
* refs (8): 189EA 51332 A5560 A56A8 A6153 A629B ...
        CON(1)  8                                * 1E73A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E73B  library
        CON(3)  #0E3                             * 1E73E  command
xBAR:
        ROMPTR 0F1 03A                           * 1E741  BAR
        BSS     14                               * 1E74C

* ob1 ob2 -> 1/0
* ROMPTR 002 0E4 SAME
* refs (2): 189EA D3C1F
        CON(1)  8                                * 1E75A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E75B  library
        CON(3)  #0E4                             * 1E75E  command
xSAME:
        :: CK2 EQUAL COERCEFLAG ;                * 1E761

* slots of 002 0E4 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1E77A  end of the slots: property byte (meaning not yet known)

* x1 x2 -> x3
* ROMPTR 002 0E5 AND
* refs (4): 189EA 559A9 559C2 559DB
        CON(1)  1                                * 1E77C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E77D  library
        CON(3)  #0E5                             * 1E780  command
xAND:
        :: CK2&Dispatch                          * 1E783
          BINT17 and(2r)                         * 1E78D  real real
          2HXS bitAND                            * 1E797  binary binary
          BINT26 %SYMAND                         * 1E7A1  real name|local|algebraic
          SYMREAL SYM%AND                        * 1E7AB  name|local|algebraic real
          SYMSYM SYMAND                          * 1E7B5  name|local|algebraic name|local|algebraic
          BINT51 AND$                            * 1E7BF  string string
        ;                                        * 1E7C9

* slots of 002 0E5 (derivative, inverse, ...: used by the symbolic code)
#50101h:
        HXS 50105                                * 1E7CE  slot 0

* refs (1): 1E792
and(2r):
        :: %0<> SWAP %0<> AND COERCEFLAG ;       * 1E7DD  slot 1
        CON(2)  #00                              * 1E800  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 0E6 OR
* refs (4): 189EA 559F4 55A0D 55A26
        CON(1)  1                                * 1E802  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E803  library
        CON(3)  #0E6                             * 1E806  command
xOR:
        :: CK2&Dispatch                          * 1E809
          BINT17 or(2r)                          * 1E813  real real
          2HXS bitOR                             * 1E81D  binary binary
          BINT26 %SYMOR                          * 1E827  real name|local|algebraic
          SYMREAL SYM%OR                         * 1E831  name|local|algebraic real
          SYMSYM SYMOR                           * 1E83B  name|local|algebraic name|local|algebraic
          BINT51 OR$                             * 1E845  string string
        ;                                        * 1E84F

* refs (1): 1E941
* slots of 002 0E6 (derivative, inverse, ...: used by the symbolic code)
#40104h:
        HXS 40104                                * 1E854  slot 0

* refs (1): 1E818
or(2r):
        :: %0<> SWAP %0<> OR COERCEFLAG ;        * 1E863  slot 1
        CON(2)  #00                              * 1E886  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 0E7 NOT
* refs (3): 189EA 54EE1 6E807
        CON(1)  5                                * 1E888  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E889  library
        CON(3)  #0E7                             * 1E88C  command
xNOT:
        :: CK1&Dispatch                          * 1E88F
          BINT1 not(r)                           * 1E899  real
          BINT11 bitNOT                          * 1E8A3  binary
          BINT10 SYMNOT                          * 1E8AD  name|local|algebraic
          BINT3 NOT$                             * 1E8B7  string
        ;                                        * 1E8C1

* slots of 002 0E7 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D604                        * 1E8C6  slot 0

#5010h:
        HXS 0105                                 * 1E8CB  slot 1

* refs (2): 1E89E 544F6
not(r):
        :: %0= COERCEFLAG ;                      * 1E8D9  slot 2
        CON(2)  #00                              * 1E8ED  end of the slots: property byte (meaning not yet known)

* # #' -> #'' $ $' -> $'' 1/0 1/0 -> 1/0
* ROMPTR 002 0E8 XOR
* refs (4): 189EA 55A3F 55A58 55A71
        CON(1)  1                                * 1E8EF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E8F0  library
        CON(3)  #0E8                             * 1E8F3  command
xXOR:
        :: CK2&Dispatch                          * 1E8F6
          BINT17 xor(2r)                         * 1E900  real real
          2HXS bitXOR                            * 1E90A  binary binary
          BINT26 %SYMXOR                         * 1E914  real name|local|algebraic
          SYMREAL SYM%XOR                        * 1E91E  name|local|algebraic real
          SYMSYM SYMXOR                          * 1E928  name|local|algebraic name|local|algebraic
          BINT51 XOR$                            * 1E932  string string
        ;                                        * 1E93C

* slots of 002 0E8 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #40104h                          * 1E941  slot 0

* refs (1): 1E905
xor(2r):
        :: %0<> SWAP %0<> XOR COERCEFLAG ;       * 1E946  slot 1
        CON(2)  #00                              * 1E969  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0E9 ==
* refs (8): 189EA 1EA58 55A8A 55AA3 55ABC 5BAC3 ...
        CON(1)  1                                * 1E96B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1E96C  library
        CON(3)  #0E9                             * 1E96F  command
x==:
        :: CK2&Dispatch                          * 1E972
          BINT26 FLOATSYM==                      * 1E97C  real name|local|algebraic
          BINT42 FLOATSYM==                      * 1E986  complex name|local|algebraic
          SYMREAL SYMFLOAT==                     * 1E990  name|local|algebraic real
          OBJ_64D7E SYMFLOAT==                   * 1E99A  name|local|algebraic complex
          SYMSYM SYM==                           * 1E9A4  name|local|algebraic name|local|algebraic
          BINT18 ==(r,c)                         * 1E9AE  real complex
          BINT33 ==(c,r)                         * 1E9B8  complex real
          2HXS HXS==HXS                          * 1E9C2  binary binary
          BINT30 UM=?                            * 1E9CC  real unit
          EXTREAL UM=?                           * 1E9D6  unit real
          2EXT UM=?                              * 1E9E0  unit unit
          SYMEXT SYMFLOAT==                      * 1E9EA  name|local|algebraic unit
          EXTSYM FLOATSYM==                      * 1E9F4  unit name|local|algebraic
          TAGGEDANY ==1tag                       * 1E9FE  tagged any
          BINT13 ==1tag                          * 1EA08  tagged
          BINT0 OBJ_1EA30                        * 1EA12  any
        ;                                        * 1EA1C

* refs (5): 1EB4C 1EC3B 1ECDA 1ED79 1EE18
* slots of 002 0E9 (derivative, inverse, ...: used by the symbolic code)
#60106h:
        HXS 60106                                * 1EA21  slot 0

* refs (3): 0F58E 1EA17 1EA85
OBJ_1EA30:
        :: EQUAL COERCEFLAG ;                    * 1EA30  slot 1

* refs (2): 1EA03 1EA0D
==1tag:
        :: STRIPTAGS STRIPTAGSl2 ' x== COLA EvalNoCK * 1EA44  slot 2
        ;                                        * 1EA67

* refs (1): 1E9B3
==(r,c):
        :: SWAP                                  * 1EA6C  slot 3

* refs (1): 1E9BD
==(c,r):
          :: %0_2A2B4 %>C% OBJ_1EA30 ; ;         * 1EA76
        CON(2)  #00                              * 1EA94  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EA ≠
* refs (6): 189EA 1EB79 55AD5 55AEE 55B07 D3C64
        CON(1)  1                                * 1EA96  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EA97  library
        CON(3)  #0EA                             * 1EA9A  command
x#?:
        :: CK2&Dispatch                          * 1EA9D
          BINT26 FLOATSYM<>                      * 1EAA7  real name|local|algebraic
          BINT42 FLOATSYM<>                      * 1EAB1  complex name|local|algebraic
          SYMREAL SYMFLOAT<>                     * 1EABB  name|local|algebraic real
          OBJ_64D7E SYMFLOAT<>                   * 1EAC5  name|local|algebraic complex
          SYMSYM SYM<>                           * 1EACF  name|local|algebraic name|local|algebraic
          BINT18 x#?~real,complex                * 1EAD9  real complex
          BINT33 x#?~complex,real                * 1EAE3  complex real
          2HXS HXS#HXS                           * 1EAED  binary binary
          BINT30 UM#?                            * 1EAF7  real unit
          EXTREAL UM#?                           * 1EB01  unit real
          2EXT UM#?                              * 1EB0B  unit unit
          SYMEXT SYMFLOAT<>                      * 1EB15  name|local|algebraic unit
          EXTSYM FLOATSYM<>                      * 1EB1F  unit name|local|algebraic
          TAGGEDANY x#?~1                        * 1EB29  tagged any
          BINT13 x#?~1                           * 1EB33  tagged
          BINT0 OBJ_1EB51                        * 1EB3D  any
        ;                                        * 1EB47

* slots of 002 0EA (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EB4C  slot 0

* refs (3): 0F5A2 1EB42 1EBA6
OBJ_1EB51:
        :: EQUALNOT COERCEFLAG ;                 * 1EB51  slot 1

* refs (2): 1EB2E 1EB38
x#?~1:
        :: STRIPTAGS STRIPTAGSl2 ' x#? COLA EvalNoCK * 1EB65  slot 2
        ;                                        * 1EB88

* refs (1): 1EADE
x#?~real,complex:
        :: SWAP                                  * 1EB8D  slot 3

* refs (1): 1EAE8
x#?~complex,real:
          :: %0_2A2B4 %>C% OBJ_1EB51 ; ;         * 1EB97
        CON(2)  #00                              * 1EBB5  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EB <
* refs (5): 189EA 55B20 55B39 55B52 D3894
        CON(1)  1                                * 1EBB7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EBB8  library
        CON(3)  #0EB                             * 1EBBB  command
x<:
        :: CK2&Dispatch                          * 1EBBE
          BINT17 <(2r)                           * 1EBC8  real real
          2HXS HXS<HXS                           * 1EBD2  binary binary
          BINT51 $<$?                            * 1EBDC  string string
          BINT26 %SYM<                           * 1EBE6  real name|local|algebraic
          SYMREAL SYM%<                          * 1EBF0  name|local|algebraic real
          SYMSYM SYM<                            * 1EBFA  name|local|algebraic name|local|algebraic
          BINT30 UM<?                            * 1EC04  real unit
          EXTREAL UM<?                           * 1EC0E  unit real
          2EXT UM<?                              * 1EC18  unit unit
          SYMEXT SYM%<                           * 1EC22  name|local|algebraic unit
          EXTSYM %SYM<                           * 1EC2C  unit name|local|algebraic
        ;                                        * 1EC36

* slots of 002 0EB (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EC3B  slot 0

* refs (2): 0F5B6 1EBCD
<(2r):
        :: %< COERCEFLAG ;                       * 1EC40  slot 1
        CON(2)  #00                              * 1EC54  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EC >
* refs (5): 189EA 55B6B 55B84 55B9D D3C9A
        CON(1)  1                                * 1EC56  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EC57  library
        CON(3)  #0EC                             * 1EC5A  command
x>:
        :: CK2&Dispatch                          * 1EC5D
          BINT17 >(2r)                           * 1EC67  real real
          2HXS HXS>HXS                           * 1EC71  binary binary
          BINT51 $>$?                            * 1EC7B  string string
          BINT26 %SYM>                           * 1EC85  real name|local|algebraic
          SYMREAL SYM%>                          * 1EC8F  name|local|algebraic real
          SYMSYM SYM>                            * 1EC99  name|local|algebraic name|local|algebraic
          BINT30 UM>?                            * 1ECA3  real unit
          EXTREAL UM>?                           * 1ECAD  unit real
          2EXT UM>?                              * 1ECB7  unit unit
          SYMEXT SYM%>                           * 1ECC1  name|local|algebraic unit
          EXTSYM %SYM>                           * 1ECCB  unit name|local|algebraic
        ;                                        * 1ECD5

* slots of 002 0EC (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1ECDA  slot 0

* refs (2): 0F5CA 1EC6C
>(2r):
        :: %> COERCEFLAG ;                       * 1ECDF  slot 1
        CON(2)  #00                              * 1ECF3  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0ED ≤
* refs (5): 189EA 55BB6 55BCF 55BE8 D3F9A
        CON(1)  1                                * 1ECF5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ECF6  library
        CON(3)  #0ED                             * 1ECF9  command
x<=?:
        :: CK2&Dispatch                          * 1ECFC
          BINT17 ó(2r)                           * 1ED06  real real
          2HXS HXS<=HXS                          * 1ED10  binary binary
          BINT51 $<=$?                           * 1ED1A  string string
          BINT26 %SYM<=                          * 1ED24  real name|local|algebraic
          SYMREAL SYM%<=                         * 1ED2E  name|local|algebraic real
          SYMSYM SYM<=                           * 1ED38  name|local|algebraic name|local|algebraic
          BINT30 UM<=?                           * 1ED42  real unit
          EXTREAL UM<=?                          * 1ED4C  unit real
          2EXT UM<=?                             * 1ED56  unit unit
          SYMEXT SYM%<=                          * 1ED60  name|local|algebraic unit
          EXTSYM %SYM<=                          * 1ED6A  unit name|local|algebraic
        ;                                        * 1ED74

* slots of 002 0ED (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1ED79  slot 0

* refs (2): 0F5DE 1ED0B
ó(2r):
        :: %<= COERCEFLAG ;                      * 1ED7E  slot 1
        CON(2)  #00                              * 1ED92  end of the slots: property byte (meaning not yet known)

* x y -> 1 \n -> 0
* ROMPTR 002 0EE ≥
* refs (4): 189EA 55C01 55C1A 55C33
        CON(1)  1                                * 1ED94  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ED95  library
        CON(3)  #0EE                             * 1ED98  command
x>=?:
        :: CK2&Dispatch                          * 1ED9B
          BINT17 ò(2r)                           * 1EDA5  real real
          2HXS HXS>=HXS                          * 1EDAF  binary binary
          BINT51 $>=$?                           * 1EDB9  string string
          BINT26 %SYM>=                          * 1EDC3  real name|local|algebraic
          SYMREAL SYM%>=                         * 1EDCD  name|local|algebraic real
          SYMSYM SYM>=                           * 1EDD7  name|local|algebraic name|local|algebraic
          BINT30 UM>=?                           * 1EDE1  real unit
          EXTREAL UM>=?                          * 1EDEB  unit real
          2EXT UM>=?                             * 1EDF5  unit unit
          SYMEXT SYM%>=                          * 1EDFF  name|local|algebraic unit
          EXTSYM %SYM>=                          * 1EE09  unit name|local|algebraic
        ;                                        * 1EE13

* slots of 002 0EE (derivative, inverse, ...: used by the symbolic code)
        CON(5)  #60106h                          * 1EE18  slot 0

* refs (2): 0F5F2 1EDAA
ò(2r):
        :: %>= COERCEFLAG ;                      * 1EE1D  slot 1

* ROMPTR 002 0EF OLDPRT
* refs (1): 189EA
        CON(1)  8                                * 1EE31  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE32  library
        CON(3)  #0EF                             * 1EE35  command
xOLDPRT:
        :: CK0 oldprt ;                          * 1EE38

* ob -> ob
* ROMPTR 002 0F0 PR1
* refs (1): 189EA
        CON(1)  8                                * 1EE4C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE4D  library
        CON(3)  #0F0                             * 1EE50  command
xPR1:
        :: CK0 pr1 ;                             * 1EE53

* ROMPTR 002 0F1 PRSTC
* refs (1): 189EA
        CON(1)  8                                * 1EE67  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE68  library
        CON(3)  #0F1                             * 1EE6B  command
xPRSTC:
        :: CK0 prstc ;                           * 1EE6E

* ->
* ROMPTR 002 0F2 PRST
* refs (1): 189EA
        CON(1)  8                                * 1EE82  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE83  library
        CON(3)  #0F2                             * 1EE86  command
xPRST:
        :: CK0 prst ;                            * 1EE89

* ->
* ROMPTR 002 0F3 CR
* refs (1): 189EA
        CON(1)  8                                * 1EE9D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EE9E  library
        CON(3)  #0F3                             * 1EEA1  command
xCR:
        :: CK0 DOCR ;                            * 1EEA4

* name -> {names} -> :port:name ->
* ROMPTR 002 0F4 PRVAR
* refs (2): 189EA 1EF32
        CON(1)  8                                * 1EEB8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EEB9  library
        CON(3)  #0F4                             * 1EEBC  command
xPRVAR:
        :: CK1&Dispatch                          * 1EEBF
          BINT6 prvar(nm)                        * 1EEC9  name
          BINT7 prvar(nm)                        * 1EED3  local
          BINT5 prvar(li)                        * 1EEDD  list
          BINT13                                 * 1EEE7  tagged

prvar(to):
          :: DUP rcl(to) SWAP SetEcma94 xPRVAR~1 xPRVAR~1 docr ; * 1EEEC
        ;                                        * 1EF19

* refs (1): 1EEE2
prvar(li):
        :: DUPNULLCOMP? caseDROP prvar(li)~1     * 1EF1E
          xPRVAR ;                               * 1EF32

* x_delay ->
* ROMPTR 002 0F5 DELAY
* refs (1): 189EA
        CON(1)  8                                * 1EF3C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF3D  library
        CON(3)  #0F5                             * 1EF40  command
xDELAY:
        :: CK1&Dispatch                          * 1EF43
          BINT1 DODELAY                          * 1EF4D  real
        ;                                        * 1EF57

* ->
* ROMPTR 002 0F6 PRLCD
* refs (1): 189EA
        CON(1)  8                                * 1EF5C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF5D  library
        CON(3)  #0F6                             * 1EF60  command
xPRLCD:
        :: CK0 DOPRLCD ;                         * 1EF63

* ROMPTR 002 0F7 ∂
* refs (7): 189EA 59418 59477 595CE 5A4FA 8C1AE ...
        CON(1)  14                               * 1EF77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1EF78  library
        CON(3)  #0F7                             * 1EF7B  command
DERIV:
        :: CK2&Dispatch                          * 1EF7E
          SYMSYMB SETTYPEERR                     * 1EF88  name|local|algebraic algebraic
          SYMSYM SYMDER                          * 1EF92  name|local|algebraic name|local|algebraic
          BINT26 2DROP%0                         * 1EF9C  real name|local|algebraic
          BINT42 2DROP%0                         * 1EFA6  complex name|local|algebraic
          EXTSYM 2DROP%0                         * 1EFB0  unit name|local|algebraic
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
        :: CK2&Dispatch                          * 1EFD2
          SYMBSYM XEQSYMDERSTEP                  * 1EFDC  algebraic name|local|algebraic
          SYMBREAL XEQSYMDERCON                  * 1EFE6  algebraic real
          SYMBCMP XEQSYMDERCON                   * 1EFF0  algebraic complex
          SYMBUNIT XEQSYMDERCON                  * 1EFFA  algebraic unit
        ;                                        * 1F004
        NIBHEX  198D6                            * 1F009  γØ

#0524310h:
        HXS 0134250                              * 1F00E
