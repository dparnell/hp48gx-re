* HP 48GX ROM revision R, #C31C5-#C4E25: Library part 0A9
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #C31C5 in the original ROM).

LIB0A9:
        CON(3)  #0A9                             * C31C5  library number
        REL(5)  LIB0A9.hash                      * C31C8  hash table
        CON(5)  0                                * C31CD  message table
        REL(5)  LIB0A9.link                      * C31D2  link table
        CON(5)  0                                * C31D7  config
        RPL

* ROMPTR 0A9 000
* refs (1): C31C5
ROMP_0A9_000:
        { }                                      * C31DC

* ROMPTR 0A9 001
* refs (1): C31C5
ROMP_0A9_001:
        ROMPTR 0A7 000                           * C31E6

* ROMPTR 0A9 002
* refs (1): C31C5
ROMP_0A9_002:
        ROMPTR 0A7 001                           * C31F1

* ROMPTR 0A9 003
* refs (1): C31C5
MenuMTH~1:
        ROMPTR 0A7 002                           * C31FC

* ROMPTR 0A9 004
* refs (1): C31C5
MenuMTH~3:
        CON(5)  DOARRY                           * C3207  array 9
        LENGTH                                   * C320C  length, to #C3256
        CON(5)  DOROMP                           * C3211  element type
        CON(5)  1                                * C3216  dimensions
        CON(5)  9                                * C321B
        ROMPBODY 002 03D                         * C3220  ABS
        ROMPBODY 002 079                         * C3226  DOT
        ROMPBODY 002 07A                         * C322C  CROSS
        ROMPBODY 002 0B4                         * C3232  V→
        ROMPBODY 002 0B5                         * C3238  →V2
        ROMPBODY 002 0B6                         * C323E  →V3
        ROMPBODY 0A8 005                         * C3244  key "RECT"
        ROMPBODY 0A8 006                         * C324A  key "CYLIN"
        ROMPBODY 0A8 007                         * C3250  key "SPHERE"
        ENDLENGTH                                * C3256

* ROMPTR 0A9 005
* refs (1): C31C5
ROMP_0A9_005:
        CON(5)  DOARRY                           * C3256  array 11
        LENGTH                                   * C325B  length, to #C32B1
        CON(5)  DOROMP                           * C3260  element type
        CON(5)  1                                * C3265  dimensions
        CON(5)  11                               * C326A
        ROMPBODY 0A8 008                         * C326F  key "MAKE"
        ROMPBODY 0A8 009                         * C3275  key "NORM"
        ROMPBODY 0A8 00A                         * C327B  key "FACTR"
        ROMPBODY 0A8 00B                         * C3281  key "COL"
        ROMPBODY 0A8 00C                         * C3287  key "ROW"
        ROMPBODY 0AB 036                         * C328D  LSQ
        ROMPBODY 002 07B                         * C3293  RSD
        ROMPBODY 0AB 037                         * C3299  EGV
        ROMPBODY 0AB 038                         * C329F  EGVL
        ROMPBODY 0AB 045                         * C32A5  →DIAG
        ROMPBODY 0AB 046                         * C32AB  DIAG→
        ENDLENGTH                                * C32B1

* ROMPTR 0A9 006
* refs (1): C31C5
ROMP_0A9_006:
        CON(5)  DOARRY                           * C32B1  array 18
        LENGTH                                   * C32B6  length, to #C3336
        CON(5)  DOROMP                           * C32BB  element type
        CON(5)  1                                * C32C0  dimensions
        CON(5)  18                               * C32C5
        ROMPBODY 002 0AD                         * C32CA  CON
        ROMPBODY 002 0AE                         * C32D0  IDN
        ROMPBODY 002 0AF                         * C32D6  TRN
        ROMPBODY 002 0AC                         * C32DC  RDM
        ROMPBODY 0AB 040                         * C32E2  RANM
        ROMPBODY 002 0A0                         * C32E8  SIZE
        ROMPBODY 002 0B2                         * C32EE  GET
        ROMPBODY 002 0B3                         * C32F4  GETI
        ROMPBODY 002 0B0                         * C32FA  PUT
        ROMPBODY 002 0B1                         * C3300  PUTI
        ROMPBODY 002 09C                         * C3306  SUB
        ROMPBODY 002 09D                         * C330C  REPL
        ROMPBODY 0A8 000                         * C3312
        ROMPBODY 0A8 000                         * C3318
        ROMPBODY 0A8 000                         * C331E
        ROMPBODY 0A8 000                         * C3324
        ROMPBODY 0A8 000                         * C332A
        ROMPBODY 0A8 00D                         * C3330  key "MATRX"
        ENDLENGTH                                * C3336

* ROMPTR 0A9 007
* refs (1): C31C5
ROMP_0A9_007:
        CON(5)  DOARRY                           * C3336  array 12
        LENGTH                                   * C333B  length, to #C3397
        CON(5)  DOROMP                           * C3340  element type
        CON(5)  1                                * C3345  dimensions
        CON(5)  12                               * C334A
        ROMPBODY 002 03D                         * C334F  ABS
        ROMPBODY 0AB 034                         * C3355  SNRM
        ROMPBODY 002 076                         * C335B  RNRM
        ROMPBODY 002 077                         * C3361  CNRM
        ROMPBODY 0AB 033                         * C3367  SRAD
        ROMPBODY 0AB 031                         * C336D  COND
        ROMPBODY 0AB 035                         * C3373  RANK
        ROMPBODY 002 078                         * C3379  DET
        ROMPBODY 0AB 032                         * C337F  TRACE
        ROMPBODY 0A8 000                         * C3385
        ROMPBODY 0A8 000                         * C338B
        ROMPBODY 0A8 00D                         * C3391  key "MATRX"
        ENDLENGTH                                * C3397

* ROMPTR 0A9 008
* refs (1): C31C5
ROMP_0A9_008:
        CON(5)  DOARRY                           * C3397  array 12
        LENGTH                                   * C339C  length, to #C33F8
        CON(5)  DOROMP                           * C33A1  element type
        CON(5)  1                                * C33A6  dimensions
        CON(5)  12                               * C33AB
        ROMPBODY 0AB 03F                         * C33B0  RREF
        ROMPBODY 0AB 03B                         * C33B6  LU
        ROMPBODY 0AB 03D                         * C33BC  LQ
        ROMPBODY 0AB 03C                         * C33C2  QR
        ROMPBODY 0AB 03E                         * C33C8  SCHUR
        ROMPBODY 0AB 039                         * C33CE  SVD
        ROMPBODY 0AB 03A                         * C33D4  SVL
        ROMPBODY 0A8 000                         * C33DA
        ROMPBODY 0A8 000                         * C33E0
        ROMPBODY 0A8 000                         * C33E6
        ROMPBODY 0A8 000                         * C33EC
        ROMPBODY 0A8 00D                         * C33F2  key "MATRX"
        ENDLENGTH                                * C33F8

* ROMPTR 0A9 009
* refs (1): C31C5
ROMP_0A9_009:
        CON(5)  DOARRY                           * C33F8  array 6
        LENGTH                                   * C33FD  length, to #C3435
        CON(5)  DOROMP                           * C3402  element type
        CON(5)  1                                * C3407  dimensions
        CON(5)  6                                * C340C
        ROMPBODY 0AB 043                         * C3411  →COL
        ROMPBODY 0AB 044                         * C3417  COL→
        ROMPBODY 0AB 04A                         * C341D  COL+
        ROMPBODY 0AB 049                         * C3423  COL-
        ROMPBODY 0AB 04C                         * C3429  CSWP
        ROMPBODY 0A8 00D                         * C342F  key "MATRX"
        ENDLENGTH                                * C3435

* ROMPTR 0A9 00A
* refs (1): C31C5
ROMP_0A9_00A:
        CON(5)  DOARRY                           * C3435  array 12
        LENGTH                                   * C343A  length, to #C3496
        CON(5)  DOROMP                           * C343F  element type
        CON(5)  1                                * C3444  dimensions
        CON(5)  12                               * C3449
        ROMPBODY 0AB 041                         * C344E  →ROW
        ROMPBODY 0AB 042                         * C3454  ROW→
        ROMPBODY 0AB 048                         * C345A  ROW+
        ROMPBODY 0AB 047                         * C3460  ROW-
        ROMPBODY 0AB 04D                         * C3466  RCI
        ROMPBODY 0AB 04E                         * C346C  RCIJ
        ROMPBODY 0AB 04B                         * C3472  RSWP
        ROMPBODY 0A8 000                         * C3478
        ROMPBODY 0A8 000                         * C347E
        ROMPBODY 0A8 000                         * C3484
        ROMPBODY 0A8 000                         * C348A
        ROMPBODY 0A8 00D                         * C3490  key "MATRX"
        ENDLENGTH                                * C3496

* ROMPTR 0A9 00B
* refs (1): C31C5
MenuMTH~4:
        CON(5)  DOARRY                           * C3496  array 6
        LENGTH                                   * C349B  length, to #C34D3
        CON(5)  DOROMP                           * C34A0  element type
        CON(5)  1                                * C34A5  dimensions
        CON(5)  6                                * C34AA
        ROMPBODY 0AB 064                         * C34AF  ΔLIST
        ROMPBODY 0AB 068                         * C34B5  ΣLIST
        ROMPBODY 0AB 06A                         * C34BB  ΠLIST
        ROMPBODY 0AB 06E                         * C34C1  SORT
        ROMPBODY 0AB 06D                         * C34C7  REVLIST
        ROMPBODY 0AB 06C                         * C34CD  ADD
        ENDLENGTH                                * C34D3

* ROMPTR 0A9 00C
* refs (1): C31C5
MenuMTH~5:
        CON(5)  DOARRY                           * C34D3  array 8
        LENGTH                                   * C34D8  length, to #C351C
        CON(5)  DOROMP                           * C34DD  element type
        CON(5)  1                                * C34E2  dimensions
        CON(5)  8                                * C34E7
        ROMPBODY 002 054                         * C34EC  SINH
        ROMPBODY 002 05A                         * C34F2  ASINH
        ROMPBODY 002 055                         * C34F8  COSH
        ROMPBODY 002 05B                         * C34FE  ACOSH
        ROMPBODY 002 056                         * C3504  TANH
        ROMPBODY 002 05C                         * C350A  ATANH
        ROMPBODY 002 062                         * C3510  EXPM
        ROMPBODY 002 061                         * C3516  LNP1
        ENDLENGTH                                * C351C

* ROMPTR 0A9 00D
* refs (1): C31C5
MenuMTH~6:
        CON(5)  DOARRY                           * C351C  array 11
        LENGTH                                   * C3521  length, to #C3577
        CON(5)  DOROMP                           * C3526  element type
        CON(5)  1                                * C352B  dimensions
        CON(5)  11                               * C3530
        ROMPBODY 002 081                         * C3535  COMB
        ROMPBODY 002 082                         * C353B  PERM
        ROMPBODY 002 063                         * C3541  !
        ROMPBODY 002 07F                         * C3547  RAND
        ROMPBODY 002 080                         * C354D  RDZ
        ROMPBODY 0A8 000                         * C3553
        ROMPBODY 002 134                         * C3559  UTPC
        ROMPBODY 002 136                         * C355F  UTPF
        ROMPBODY 002 135                         * C3565  UTPN
        ROMPBODY 002 137                         * C356B  UTPT
        ROMPBODY 0AB 027                         * C3571  NDIST
        ENDLENGTH                                * C3577

* ROMPTR 0A9 00E
* refs (1): C31C5
MenuMTH~7:
        CON(5)  DOARRY                           * C3577  array 18
        LENGTH                                   * C357C  length, to #C35FC
        CON(5)  DOROMP                           * C3581  element type
        CON(5)  1                                * C3586  dimensions
        CON(5)  18                               * C358B
        ROMPBODY 002 07C                         * C3590  %
        ROMPBODY 002 07E                         * C3596  %CH
        ROMPBODY 002 07D                         * C359C  %T
        ROMPBODY 002 06B                         * C35A2  MIN
        ROMPBODY 002 06A                         * C35A8  MAX
        ROMPBODY 002 06E                         * C35AE  MOD
        ROMPBODY 002 03D                         * C35B4  ABS
        ROMPBODY 002 04E                         * C35BA  SIGN
        ROMPBODY 002 06F                         * C35C0  MANT
        ROMPBODY 002 069                         * C35C6  XPON
        ROMPBODY 002 065                         * C35CC  IP
        ROMPBODY 002 066                         * C35D2  FP
        ROMPBODY 002 06C                         * C35D8  RND
        ROMPBODY 002 06D                         * C35DE  TRNC
        ROMPBODY 002 067                         * C35E4  FLOOR
        ROMPBODY 002 068                         * C35EA  CEIL
        ROMPBODY 002 070                         * C35F0  D→R
        ROMPBODY 002 071                         * C35F6  R→D
        ENDLENGTH                                * C35FC

* ROMPTR 0A9 00F
* refs (1): C31C5
ROMP_0A9_00F:
        CON(5)  DOARRY                           * C35FC  array 12
        LENGTH                                   * C3601  length, to #C365D
        CON(5)  DOROMP                           * C3606  element type
        CON(5)  1                                * C360B  dimensions
        CON(5)  12                               * C3610
        ROMPBODY 0A8 00E                         * C3615  key "HEX"
        ROMPBODY 0A8 00F                         * C361B  key "DEC"
        ROMPBODY 0A8 010                         * C3621  key "OCT"
        ROMPBODY 0A8 011                         * C3627  key "BIN"
        ROMPBODY 002 009                         * C362D  R→B
        ROMPBODY 002 00A                         * C3633  B→R
        ROMPBODY 0A8 012                         * C3639  key "LOGIC"
        ROMPBODY 0A8 013                         * C363F  key "BIT"
        ROMPBODY 0A8 014                         * C3645  key "BYTE"
        ROMPBODY 0A8 000                         * C364B
        ROMPBODY 002 094                         * C3651  STWS
        ROMPBODY 002 095                         * C3657  RCWS
        ENDLENGTH                                * C365D

* ROMPTR 0A9 010
* refs (1): C31C5
ROMP_0A9_010:
        CON(5)  DOARRY                           * C365D  array 6
        LENGTH                                   * C3662  length, to #C369A
        CON(5)  DOROMP                           * C3667  element type
        CON(5)  1                                * C366C  dimensions
        CON(5)  6                                * C3671
        ROMPBODY 002 0E5                         * C3676  AND
        ROMPBODY 002 0E6                         * C367C  OR
        ROMPBODY 002 0E8                         * C3682  XOR
        ROMPBODY 002 0E7                         * C3688  NOT
        ROMPBODY 0A8 000                         * C368E
        ROMPBODY 0A8 015                         * C3694  key "BASE"
        ENDLENGTH                                * C369A

* ROMPTR 0A9 011
* refs (1): C31C5
ROMP_0A9_011:
        CON(5)  DOARRY                           * C369A  array 6
        LENGTH                                   * C369F  length, to #C36D7
        CON(5)  DOROMP                           * C36A4  element type
        CON(5)  1                                * C36A9  dimensions
        CON(5)  6                                * C36AE
        ROMPBODY 002 001                         * C36B3  RL
        ROMPBODY 002 005                         * C36B9  SL
        ROMPBODY 002 000                         * C36BF  ASR
        ROMPBODY 002 007                         * C36C5  SR
        ROMPBODY 002 003                         * C36CB  RR
        ROMPBODY 0A8 015                         * C36D1  key "BASE"
        ENDLENGTH                                * C36D7

* ROMPTR 0A9 012
* refs (1): C31C5
ROMP_0A9_012:
        CON(5)  DOARRY                           * C36D7  array 6
        LENGTH                                   * C36DC  length, to #C3714
        CON(5)  DOROMP                           * C36E1  element type
        CON(5)  1                                * C36E6  dimensions
        CON(5)  6                                * C36EB
        ROMPBODY 002 002                         * C36F0  RLB
        ROMPBODY 002 006                         * C36F6  SLB
        ROMPBODY 0A8 000                         * C36FC
        ROMPBODY 002 008                         * C3702  SRB
        ROMPBODY 002 004                         * C3708  RRB
        ROMPBODY 0A8 015                         * C370E  key "BASE"
        ENDLENGTH                                * C3714

* ROMPTR 0A9 013
* refs (1): C31C5
MenuMTH~8:
        CON(5)  DOARRY                           * C3714  array 2
        LENGTH                                   * C3719  length, to #C3739
        CON(5)  DOROMP                           * C371E  element type
        CON(5)  1                                * C3723  dimensions
        CON(5)  2                                * C3728
        ROMPBODY 0AB 025                         * C372D  FFT
        ROMPBODY 0AB 026                         * C3733  IFFT
        ENDLENGTH                                * C3739

* ROMPTR 0A9 014
* refs (1): C31C5
MenuMTH~9:
        CON(5)  DOARRY                           * C3739  array 9
        LENGTH                                   * C373E  length, to #C3788
        CON(5)  DOROMP                           * C3743  element type
        CON(5)  1                                * C3748  dimensions
        CON(5)  9                                * C374D
        ROMPBODY 002 09A                         * C3752  RE
        ROMPBODY 002 09B                         * C3758  IM
        ROMPBODY 002 09F                         * C375E  C→R
        ROMPBODY 002 099                         * C3764  R→C
        ROMPBODY 002 03D                         * C376A  ABS
        ROMPBODY 002 04D                         * C3770  ARG
        ROMPBODY 002 04E                         * C3776  SIGN
        ROMPBODY 002 03C                         * C377C  NEG
        ROMPBODY 002 03E                         * C3782  CONJ
        ENDLENGTH                                * C3788

* ROMPTR 0A9 015
* refs (1): C31C5
MenuMTH~10:
        ROMPTR 0A7 003                           * C3788

* ROMPTR 0A9 016
* refs (1): C31C5
MenuPr~1:
        ROMPTR 0A7 004                           * C3793

* ROMPTR 0A9 017
* refs (1): C31C5
ROMP_0A9_017:
        CON(5)  DOARRY                           * C379E  array 8
        LENGTH                                   * C37A3  length, to #C37E7
        CON(5)  DOROMP                           * C37A8  element type
        CON(5)  1                                * C37AD  dimensions
        CON(5)  8                                * C37B2
        ROMPBODY 0A8 016                         * C37B7  key "IF"
        ROMPBODY 0A8 017                         * C37BD  key "CASE"
        ROMPBODY 0A8 018                         * C37C3  key "START"
        ROMPBODY 0A8 019                         * C37C9  key "FOR"
        ROMPBODY 0A8 01A                         * C37CF  key "DO"
        ROMPBODY 0A8 01B                         * C37D5  key "WHILE"
        ROMPBODY 002 030                         * C37DB  IFT
        ROMPBODY 002 02F                         * C37E1  IFTE
        ENDLENGTH                                * C37E7

* ROMPTR 0A9 018
* refs (1): C31C5
ROMP_0A9_018:
        CON(5)  DOARRY                           * C37E7  array 6
        LENGTH                                   * C37EC  length, to #C3824
        CON(5)  DOROMP                           * C37F1  element type
        CON(5)  1                                * C37F6  dimensions
        CON(5)  6                                * C37FB
        ROMPBODY 700 000                         * C3800  IF
        ROMPBODY 700 001                         * C3806  THEN
        ROMPBODY 700 002                         * C380C  ELSE
        ROMPBODY 700 003                         * C3812  END
        ROMPBODY 0A8 000                         * C3818
        ROMPBODY 0A8 01C                         * C381E  key "BRCH"
        ENDLENGTH                                * C3824

* ROMPTR 0A9 019
* refs (1): C31C5
ROMP_0A9_019:
        CON(5)  DOARRY                           * C3824  array 6
        LENGTH                                   * C3829  length, to #C3861
        CON(5)  DOROMP                           * C382E  element type
        CON(5)  1                                * C3833  dimensions
        CON(5)  6                                * C3838
        ROMPBODY 700 019                         * C383D  CASE
        ROMPBODY 700 01A                         * C3843  xTHENCASE
        ROMPBODY 700 003                         * C3849  END
        ROMPBODY 0A8 000                         * C384F
        ROMPBODY 0A8 000                         * C3855
        ROMPBODY 0A8 01C                         * C385B  key "BRCH"
        ENDLENGTH                                * C3861

* ROMPTR 0A9 01A
* refs (1): C31C5
ROMP_0A9_01A:
        CON(5)  DOARRY                           * C3861  array 6
        LENGTH                                   * C3866  length, to #C389E
        CON(5)  DOROMP                           * C386B  element type
        CON(5)  1                                * C3870  dimensions
        CON(5)  6                                * C3875
        ROMPBODY 700 009                         * C387A  START
        ROMPBODY 700 00B                         * C3880  NEXT
        ROMPBODY 700 00C                         * C3886  STEP
        ROMPBODY 0A8 000                         * C388C
        ROMPBODY 0A8 000                         * C3892
        ROMPBODY 0A8 01C                         * C3898  key "BRCH"
        ENDLENGTH                                * C389E

* ROMPTR 0A9 01B
* refs (1): C31C5
ROMP_0A9_01B:
        CON(5)  DOARRY                           * C389E  array 6
        LENGTH                                   * C38A3  length, to #C38DB
        CON(5)  DOROMP                           * C38A8  element type
        CON(5)  1                                * C38AD  dimensions
        CON(5)  6                                * C38B2
        ROMPBODY 700 00A                         * C38B7  FOR
        ROMPBODY 700 00B                         * C38BD  NEXT
        ROMPBODY 700 00C                         * C38C3  STEP
        ROMPBODY 0A8 000                         * C38C9
        ROMPBODY 0A8 000                         * C38CF
        ROMPBODY 0A8 01C                         * C38D5  key "BRCH"
        ENDLENGTH                                * C38DB

* ROMPTR 0A9 01C
* refs (1): C31C5
~EditMenu:
        :: EditMenu ;                            * C38DB

* ROMPTR 0A9 01D
* refs (1): C31C5
ROMP_0A9_01D:
        CON(5)  DOARRY                           * C38EA  array 6
        LENGTH                                   * C38EF  length, to #C3927
        CON(5)  DOROMP                           * C38F4  element type
        CON(5)  1                                * C38F9  dimensions
        CON(5)  6                                * C38FE
        ROMPBODY 700 007                         * C3903  DO
        ROMPBODY 700 008                         * C3909  UNTIL
        ROMPBODY 700 017                         * C390F  xENDDO
        ROMPBODY 0A8 000                         * C3915
        ROMPBODY 0A8 000                         * C391B
        ROMPBODY 0A8 01C                         * C3921  key "BRCH"
        ENDLENGTH                                * C3927

* ROMPTR 0A9 01E
* refs (1): C31C5
ROMP_0A9_01E:
        ROMPTR 0A7 006                           * C3927

* ROMPTR 0A9 01F
* refs (1): C31C5
ROMP_0A9_01F:
        CON(5)  DOARRY                           * C3932  array 6
        LENGTH                                   * C3937  length, to #C396F
        CON(5)  DOROMP                           * C393C  element type
        CON(5)  1                                * C3941  dimensions
        CON(5)  6                                * C3946
        ROMPBODY 700 005                         * C394B  WHILE
        ROMPBODY 700 006                         * C3951  REPEAT
        ROMPBODY 700 016                         * C3957  xWHILEEND
        ROMPBODY 0A8 000                         * C395D
        ROMPBODY 0A8 000                         * C3963
        ROMPBODY 0A8 01C                         * C3969  key "BRCH"
        ENDLENGTH                                * C396F

* ROMPTR 0A9 020
* refs (1): C31C5
MenuPr~3:
        CON(5)  DOARRY                           * C396F  array 19
        LENGTH                                   * C3974  length, to #C39FA
        CON(5)  DOROMP                           * C3979  element type
        CON(5)  1                                * C397E  dimensions
        CON(5)  19                               * C3983
        ROMPBODY 002 0E9                         * C3988  ==
        ROMPBODY 002 0EA                         * C398E  ≠
        ROMPBODY 002 0EB                         * C3994  <
        ROMPBODY 002 0EC                         * C399A  >
        ROMPBODY 002 0ED                         * C39A0  ≤
        ROMPBODY 002 0EE                         * C39A6  ≥
        ROMPBODY 002 0E5                         * C39AC  AND
        ROMPBODY 002 0E6                         * C39B2  OR
        ROMPBODY 002 0E8                         * C39B8  XOR
        ROMPBODY 002 0E7                         * C39BE  NOT
        ROMPBODY 002 0E4                         * C39C4  SAME
        ROMPBODY 002 0A6                         * C39CA  TYPE
        ROMPBODY 002 083                         * C39D0  SF
        ROMPBODY 002 084                         * C39D6  CF
        ROMPBODY 002 085                         * C39DC  FS?
        ROMPBODY 002 086                         * C39E2  FC?
        ROMPBODY 002 08E                         * C39E8  FS?C
        ROMPBODY 002 08F                         * C39EE  FC?C
        ROMPBODY 0AB 01C                         * C39F4  LININ
        ENDLENGTH                                * C39FA

* ROMPTR 0A9 021
* refs (1): C31C5
MenuPr~4:
        CON(5)  DOARRY                           * C39FA  array 14
        LENGTH                                   * C39FF  length, to #C3A67
        CON(5)  DOROMP                           * C3A04  element type
        CON(5)  1                                * C3A09  dimensions
        CON(5)  14                               * C3A0E
        ROMPBODY 002 0A9                         * C3A13  OBJ→
        ROMPBODY 002 0AA                         * C3A19  →ARRY
        ROMPBODY 002 098                         * C3A1F  →LIST
        ROMPBODY 002 0A2                         * C3A25  →STR
        ROMPBODY 002 17F                         * C3A2B  →TAG
        ROMPBODY 002 00D                         * C3A31  →UNIT
        ROMPBODY 002 09F                         * C3A37  C→R
        ROMPBODY 002 099                         * C3A3D  R→C
        ROMPBODY 002 0A4                         * C3A43  NUM
        ROMPBODY 002 0A5                         * C3A49  CHR
        ROMPBODY 002 180                         * C3A4F  DTAG
        ROMPBODY 002 0A8                         * C3A55  EQ→
        ROMPBODY 002 0A6                         * C3A5B  TYPE
        ROMPBODY 002 0A7                         * C3A61  VTYPE
        ENDLENGTH                                * C3A67

* ROMPTR 0A9 022
* refs (1): C31C5
ROMP_0A9_022:
        CON(5)  DOARRY                           * C3A67  array 6
        LENGTH                                   * C3A6C  length, to #C3AA4
        CON(5)  DOROMP                           * C3A71  element type
        CON(5)  1                                * C3A76  dimensions
        CON(5)  6                                * C3A7B
        ROMPBODY 0A8 01D                         * C3A80  key "ELEM"
        ROMPBODY 0A8 01E                         * C3A86  key "PROC"
        ROMPBODY 002 0A9                         * C3A8C  OBJ→
        ROMPBODY 002 098                         * C3A92  →LIST
        ROMPBODY 002 09C                         * C3A98  SUB
        ROMPBODY 002 09D                         * C3A9E  REPL
        ENDLENGTH                                * C3AA4

* ROMPTR 0A9 023
* refs (1): C31C5
ROMP_0A9_023:
        CON(5)  DOARRY                           * C3AA4  array 12
        LENGTH                                   * C3AA9  length, to #C3B05
        CON(5)  DOROMP                           * C3AAE  element type
        CON(5)  1                                * C3AB3  dimensions
        CON(5)  12                               * C3AB8
        ROMPBODY 002 0B2                         * C3ABD  GET
        ROMPBODY 002 0B3                         * C3AC3  GETI
        ROMPBODY 002 0B0                         * C3AC9  PUT
        ROMPBODY 002 0B1                         * C3ACF  PUTI
        ROMPBODY 002 0A0                         * C3AD5  SIZE
        ROMPBODY 002 0A1                         * C3ADB  POS
        ROMPBODY 0AB 060                         * C3AE1  HEAD
        ROMPBODY 0AB 061                         * C3AE7  TAIL
        ROMPBODY 0A8 000                         * C3AED
        ROMPBODY 0A8 000                         * C3AF3
        ROMPBODY 0A8 000                         * C3AF9
        ROMPBODY 0A8 01F                         * C3AFF  key "LIST"
        ENDLENGTH                                * C3B05

* ROMPTR 0A9 024
* refs (1): C31C5
ROMP_0A9_024:
        CON(5)  DOARRY                           * C3B05  array 12
        LENGTH                                   * C3B0A  length, to #C3B66
        CON(5)  DOROMP                           * C3B0F  element type
        CON(5)  1                                * C3B14  dimensions
        CON(5)  12                               * C3B19
        ROMPBODY 0AB 06B                         * C3B1E  DOLIST
        ROMPBODY 0AB 063                         * C3B24  DOSUBS
        ROMPBODY 0AB 065                         * C3B2A  NSUB
        ROMPBODY 0AB 066                         * C3B30  ENDSUB
        ROMPBODY 0AB 067                         * C3B36  STREAM
        ROMPBODY 0AB 06D                         * C3B3C  REVLIST
        ROMPBODY 0AB 06E                         * C3B42  SORT
        ROMPBODY 0AB 062                         * C3B48  SEQ
        ROMPBODY 0A8 000                         * C3B4E
        ROMPBODY 0A8 000                         * C3B54
        ROMPBODY 0A8 000                         * C3B5A
        ROMPBODY 0A8 01F                         * C3B60  key "LIST"
        ENDLENGTH                                * C3B66

* ROMPTR 0A9 025
* refs (1): C31C5
MenuPr~5:
        CON(5)  DOARRY                           * C3B66  array 10
        LENGTH                                   * C3B6B  length, to #C3BBB
        CON(5)  DOROMP                           * C3B70  element type
        CON(5)  1                                * C3B75  dimensions
        CON(5)  10                               * C3B7A
        ROMPBODY 002 0D7                         * C3B7F  →GROB
        ROMPBODY 002 0D1                         * C3B85  BLANK
        ROMPBODY 002 0D3                         * C3B8B  GOR
        ROMPBODY 002 0D4                         * C3B91  GXOR
        ROMPBODY 002 09C                         * C3B97  SUB
        ROMPBODY 002 09D                         * C3B9D  REPL
        ROMPBODY 0A8 06F                         * C3BA3
        ROMPBODY 002 0D5                         * C3BA9  LCD→
        ROMPBODY 002 0A0                         * C3BAF  SIZE
        ROMPBODY 0AB 018                         * C3BB5  ANIMATE
        ENDLENGTH                                * C3BBB

* ROMPTR 0A9 026
* refs (1): C31C5
MenuPr~6:
        CON(5)  DOARRY                           * C3BBB  array 12
        LENGTH                                   * C3BC0  length, to #C3C1C
        CON(5)  DOROMP                           * C3BC5  element type
        CON(5)  1                                * C3BCA  dimensions
        CON(5)  12                               * C3BCF
        ROMPBODY 002 0D2                         * C3BD4  PICT
        ROMPBODY 002 0C3                         * C3BDA  PDIM
        ROMPBODY 002 0CE                         * C3BE0  LINE
        ROMPBODY 002 0CF                         * C3BE6  TLINE
        ROMPBODY 002 0D0                         * C3BEC  BOX
        ROMPBODY 002 0D8                         * C3BF2  ARC
        ROMPBODY 002 0CB                         * C3BF8  PIXON
        ROMPBODY 002 0CC                         * C3BFE  PIXOFF
        ROMPBODY 002 0CD                         * C3C04  PIX?
        ROMPBODY 002 0CA                         * C3C0A  PVIEW
        ROMPBODY 002 0C6                         * C3C10  PX→C
        ROMPBODY 002 0C7                         * C3C16  C→PX
        ENDLENGTH                                * C3C1C

* ROMPTR 0A9 027
* refs (1): C31C5
MenuPr~7:
        CON(5)  DOARRY                           * C3C1C  array 7
        LENGTH                                   * C3C21  length, to #C3C5F
        CON(5)  DOROMP                           * C3C26  element type
        CON(5)  1                                * C3C2B  dimensions
        CON(5)  7                                * C3C30
        ROMPBODY 0AB 05A                         * C3C35  INFORM
        ROMPBODY 0AB 05B                         * C3C3B  NOVAL
        ROMPBODY 0AB 05C                         * C3C41  CHOOSE
        ROMPBODY 002 17A                         * C3C47  INPUT
        ROMPBODY 002 039                         * C3C4D  KEY
        ROMPBODY 002 037                         * C3C53  WAIT
        ROMPBODY 700 01C                         * C3C59  PROMPT
        ENDLENGTH                                * C3C5F

* ROMPTR 0A9 028
* refs (1): C31C5
MenuPr~8:
        CON(5)  DOARRY                           * C3C5F  array 7
        LENGTH                                   * C3C64  length, to #C3CA2
        CON(5)  DOROMP                           * C3C69  element type
        CON(5)  1                                * C3C6E  dimensions
        CON(5)  7                                * C3C73
        ROMPBODY 002 0CA                         * C3C78  PVIEW
        ROMPBODY 002 0D9                         * C3C7E  TEXT
        ROMPBODY 0A8 070                         * C3C84
        ROMPBODY 002 032                         * C3C8A  DISP
        ROMPBODY 002 033                         * C3C90  FREEZE
        ROMPBODY 0AB 05D                         * C3C96  MSGBOX
        ROMPBODY 002 034                         * C3C9C  BEEP
        ENDLENGTH                                * C3CA2

* ROMPTR 0A9 029
* refs (1): C31C5
MenuPr~9:
        CON(5)  DOARRY                           * C3CA2  array 7
        LENGTH                                   * C3CA7  length, to #C3CE5
        CON(5)  DOROMP                           * C3CAC  element type
        CON(5)  1                                * C3CB1  dimensions
        CON(5)  7                                * C3CB6
        ROMPBODY 0A8 020                         * C3CBB  key "DBUG"
        ROMPBODY 0A8 021                         * C3CC1  key "SST"
        ROMPBODY 0A8 022                         * C3CC7  key "SST↓"
        ROMPBODY 0A8 023                         * C3CCD  key "NEXT"
        ROMPBODY 700 00E                         * C3CD3  HALT
        ROMPBODY 002 028                         * C3CD9  KILL
        ROMPBODY 002 029                         * C3CDF  OFF
        ENDLENGTH                                * C3CE5

* ROMPTR 0A9 02A
* refs (1): C31C5
ROMP_0A9_02A:
        ROMPTR 0A7 012                           * C3CE5

* ROMPTR 0A9 02B
* refs (1): C31C5
ROMP_0A9_02B:
        ROMPTR 0A7 013                           * C3CF0

* ROMPTR 0A9 02C
* refs (1): C31C5
ROMP_0A9_02C:
        ROMPTR 0A7 014                           * C3CFB

* ROMPTR 0A9 02D
* refs (1): C31C5
ROMP_0A9_02D:
        ROMPTR 0A7 015                           * C3D06

* ROMPTR 0A9 02E
* refs (1): C31C5
ROMP_0A9_02E:
        ROMPTR 0A7 016                           * C3D11

* ROMPTR 0A9 02F
* refs (1): C31C5
ROMP_0A9_02F:
        ROMPTR 0A7 017                           * C3D1C

* ROMPTR 0A9 030
* refs (1): C31C5
ROMP_0A9_030:
        ROMPTR 0A7 018                           * C3D27

* ROMPTR 0A9 031
* refs (1): C31C5
ROMP_0A9_031:
        ROMPTR 0A7 019                           * C3D32

* ROMPTR 0A9 032
* refs (1): C31C5
ROMP_0A9_032:
        ROMPTR 0A7 01A                           * C3D3D

* ROMPTR 0A9 033
* refs (1): C31C5
ROMP_0A9_033:
        ROMPTR 0A7 01B                           * C3D48

* ROMPTR 0A9 034
* refs (1): C31C5
ROMP_0A9_034:
        ROMPTR 0A7 01C                           * C3D53

* ROMPTR 0A9 035
* refs (1): C31C5
ROMP_0A9_035:
        ROMPTR 0A7 01D                           * C3D5E

* ROMPTR 0A9 036
* refs (1): C31C5
ROMP_0A9_036:
        ROMPTR 0A7 01E                           * C3D69

* ROMPTR 0A9 037
* refs (1): C31C5
ROMP_0A9_037:
        ROMPTR 0A7 01F                           * C3D74

* ROMPTR 0A9 038
* refs (1): C31C5
ROMP_0A9_038:
        ROMPTR 0A7 020                           * C3D7F

* ROMPTR 0A9 039
* refs (1): C31C5
ROMP_0A9_039:
        ROMPTR 0A7 021                           * C3D8A

* ROMPTR 0A9 03A
* refs (1): C31C5
ROMP_0A9_03A:
        ROMPTR 0A7 022                           * C3D95

* ROMPTR 0A9 03B
* refs (1): C31C5
ROMP_0A9_03B:
        CON(5)  DOARRY                           * C3DA0  array 5
        LENGTH                                   * C3DA5  length, to #C3DD7
        CON(5)  DOROMP                           * C3DAA  element type
        CON(5)  1                                * C3DAF  dimensions
        CON(5)  5                                * C3DB4
        ROMPBODY 002 00B                         * C3DB9  CONVERT
        ROMPBODY 002 00E                         * C3DBF  UBASE
        ROMPBODY 002 00C                         * C3DC5  UVAL
        ROMPBODY 002 00F                         * C3DCB  UFACT
        ROMPBODY 002 00D                         * C3DD1  →UNIT
        ENDLENGTH                                * C3DD7

* ROMPTR 0A9 03C
* refs (1): C31C5
ROMP_0A9_03C:
        CON(5)  DOARRY                           * C3DD7  array 6
        LENGTH                                   * C3DDC  length, to #C3E14
        CON(5)  DOROMP                           * C3DE1  element type
        CON(5)  1                                * C3DE6  dimensions
        CON(5)  6                                * C3DEB
        ROMPBODY 700 00D                         * C3DF0  IFERR
        ROMPBODY 700 018                         * C3DF6  xERRTHEN
        ROMPBODY 700 002                         * C3DFC  ELSE
        ROMPBODY 700 003                         * C3E02  END
        ROMPBODY 0A8 000                         * C3E08
        ROMPBODY 0A8 025                         * C3E0E  key "ERROR"
        ENDLENGTH                                * C3E14

* ROMPTR 0A9 03D
* refs (1): C31C5
ROMP_0A9_03D:
        CON(5)  DOARRY                           * C3E14  array 6
        LENGTH                                   * C3E19  length, to #C3E51
        CON(5)  DOROMP                           * C3E1E  element type
        CON(5)  1                                * C3E23  dimensions
        CON(5)  6                                * C3E28
        ROMPBODY 002 02A                         * C3E2D  DOERR
        ROMPBODY 002 02C                         * C3E33  ERRN
        ROMPBODY 002 02D                         * C3E39  ERRM
        ROMPBODY 002 02B                         * C3E3F  ERR0
        ROMPBODY 002 036                         * C3E45  LASTARG
        ROMPBODY 0A8 024                         * C3E4B  key "IFERR"
        ENDLENGTH                                * C3E51

* ROMPTR 0A9 03E
* refs (1): C31C5
ROMP_0A9_03E:
        CON(5)  DOARRY                           * C3E51  array 10
        LENGTH                                   * C3E56  length, to #C3EA6
        CON(5)  DOROMP                           * C3E5B  element type
        CON(5)  1                                * C3E60  dimensions
        CON(5)  10                               * C3E65
        ROMPBODY 002 09C                         * C3E6A  SUB
        ROMPBODY 002 09D                         * C3E70  REPL
        ROMPBODY 002 0A1                         * C3E76  POS
        ROMPBODY 002 0A0                         * C3E7C  SIZE
        ROMPBODY 002 0A4                         * C3E82  NUM
        ROMPBODY 002 0A5                         * C3E88  CHR
        ROMPBODY 002 0A9                         * C3E8E  OBJ→
        ROMPBODY 002 0A2                         * C3E94  →STR
        ROMPBODY 0AB 060                         * C3E9A  HEAD
        ROMPBODY 0AB 061                         * C3EA0  TAIL
        ENDLENGTH                                * C3EA6

* ROMPTR 0A9 03F
* refs (1): C31C5
ROMP_0A9_03F:
        CON(5)  DOARRY                           * C3EA6  array 6
        LENGTH                                   * C3EAB  length, to #C3EE3
        CON(5)  DOROMP                           * C3EB0  element type
        CON(5)  1                                * C3EB5  dimensions
        CON(5)  6                                * C3EBA
        ROMPBODY 0A8 026                         * C3EBF  key "FMT"
        ROMPBODY 0A8 027                         * C3EC5  key "ANGLE"
        ROMPBODY 0A8 028                         * C3ECB  key "FLAG"
        ROMPBODY 0A8 029                         * C3ED1  key "KEYS"
        ROMPBODY 0A8 02A                         * C3ED7  key "MENU"
        ROMPBODY 0A8 02B                         * C3EDD  key "MISC"
        ENDLENGTH                                * C3EE3

* ROMPTR 0A9 040
* refs (1): C31C5
ROMP_0A9_040:
        CON(5)  DOARRY                           * C3EE3  array 12
        LENGTH                                   * C3EE8  length, to #C3F44
        CON(5)  DOROMP                           * C3EED  element type
        CON(5)  1                                * C3EF2  dimensions
        CON(5)  12                               * C3EF7
        ROMPBODY 0A8 02D                         * C3EFC  key "STD"
        ROMPBODY 0A8 02E                         * C3F02  key "FIX"
        ROMPBODY 0A8 02F                         * C3F08  key "SCI"
        ROMPBODY 0A8 030                         * C3F0E  key "ENG"
        ROMPBODY 0A8 031                         * C3F14  key "FM,"
        ROMPBODY 0A8 032                         * C3F1A  key "ML"
        ROMPBODY 0A8 000                         * C3F20
        ROMPBODY 0A8 000                         * C3F26
        ROMPBODY 0A8 000                         * C3F2C
        ROMPBODY 0A8 000                         * C3F32
        ROMPBODY 0A8 000                         * C3F38
        ROMPBODY 0A8 02C                         * C3F3E  key "MODES"
        ENDLENGTH                                * C3F44

* ROMPTR 0A9 041
* refs (1): C31C5
ROMP_0A9_041:
        CON(5)  DOARRY                           * C3F44  array 12
        LENGTH                                   * C3F49  length, to #C3FA5
        CON(5)  DOROMP                           * C3F4E  element type
        CON(5)  1                                * C3F53  dimensions
        CON(5)  12                               * C3F58
        ROMPBODY 0A8 033                         * C3F5D  key "DEG"
        ROMPBODY 0A8 034                         * C3F63
        ROMPBODY 0A8 035                         * C3F69
        ROMPBODY 0A8 005                         * C3F6F  key "RECT"
        ROMPBODY 0A8 006                         * C3F75  key "CYLIN"
        ROMPBODY 0A8 007                         * C3F7B  key "SPHERE"
        ROMPBODY 0A8 000                         * C3F81
        ROMPBODY 0A8 000                         * C3F87
        ROMPBODY 0A8 000                         * C3F8D
        ROMPBODY 0A8 000                         * C3F93
        ROMPBODY 0A8 000                         * C3F99
        ROMPBODY 0A8 02C                         * C3F9F  key "MODES"
        ENDLENGTH                                * C3FA5

* ROMPTR 0A9 042
* refs (1): C31C5
ROMP_0A9_042:
        CON(5)  DOARRY                           * C3FA5  array 12
        LENGTH                                   * C3FAA  length, to #C4006
        CON(5)  DOROMP                           * C3FAF  element type
        CON(5)  1                                * C3FB4  dimensions
        CON(5)  12                               * C3FB9
        ROMPBODY 002 083                         * C3FBE  SF
        ROMPBODY 002 084                         * C3FC4  CF
        ROMPBODY 002 085                         * C3FCA  FS?
        ROMPBODY 002 086                         * C3FD0  FC?
        ROMPBODY 002 08E                         * C3FD6  FS?C
        ROMPBODY 002 08F                         * C3FDC  FC?C
        ROMPBODY 002 097                         * C3FE2  STOF
        ROMPBODY 002 096                         * C3FE8  RCLF
        ROMPBODY 0A8 036                         * C3FEE  key "RESET"
        ROMPBODY 0A8 000                         * C3FF4
        ROMPBODY 0A8 000                         * C3FFA
        ROMPBODY 0A8 02C                         * C4000  key "MODES"
        ENDLENGTH                                * C4006

* ROMPTR 0A9 043
* refs (1): C31C5
ROMP_0A9_043:
        CON(5)  DOARRY                           * C4006  array 6
        LENGTH                                   * C400B  length, to #C4043
        CON(5)  DOROMP                           * C4010  element type
        CON(5)  1                                * C4015  dimensions
        CON(5)  6                                * C401A
        ROMPBODY 002 17B                         * C401F  ASN
        ROMPBODY 002 17C                         * C4025  STOKEYS
        ROMPBODY 002 17E                         * C402B  RCLKEYS
        ROMPBODY 002 17D                         * C4031  DELKEYS
        ROMPBODY 0A8 000                         * C4037
        ROMPBODY 0A8 02C                         * C403D  key "MODES"
        ENDLENGTH                                * C4043

* ROMPTR 0A9 044
* refs (1): C31C5
ROMP_0A9_044:
        CON(5)  DOARRY                           * C4043  array 6
        LENGTH                                   * C4048  length, to #C4080
        CON(5)  DOROMP                           * C404D  element type
        CON(5)  1                                * C4052  dimensions
        CON(5)  6                                * C4057
        ROMPBODY 002 15C                         * C405C  MENU
        ROMPBODY 0A8 037                         * C4062
        ROMPBODY 002 15B                         * C4068  TMENU
        ROMPBODY 002 15D                         * C406E  RCLMENU
        ROMPBODY 0A8 000                         * C4074
        ROMPBODY 0A8 02C                         * C407A  key "MODES"
        ENDLENGTH                                * C4080

* ROMPTR 0A9 045
* refs (1): C31C5
ROMP_0A9_045:
        CON(5)  DOARRY                           * C4080  array 12
        LENGTH                                   * C4085  length, to #C40E1
        CON(5)  DOROMP                           * C408A  element type
        CON(5)  1                                * C408F  dimensions
        CON(5)  12                               * C4094
        ROMPBODY 0A8 038                         * C4099  key "BEEP"
        ROMPBODY 0A8 039                         * C409F  key "CLK"
        ROMPBODY 0A8 03A                         * C40A5  key "SYM"
        ROMPBODY 0A8 03B                         * C40AB  key "STK"
        ROMPBODY 0A8 03C                         * C40B1  key "ARG"
        ROMPBODY 0A8 03D                         * C40B7  key "CMD"
        ROMPBODY 0A8 03E                         * C40BD  key "INFO?"
        ROMPBODY 0A8 000                         * C40C3
        ROMPBODY 0A8 000                         * C40C9
        ROMPBODY 0A8 000                         * C40CF
        ROMPBODY 0A8 000                         * C40D5
        ROMPBODY 0A8 02C                         * C40DB  key "MODES"
        ENDLENGTH                                * C40E1

* ROMPTR 0A9 046
* refs (1): C31C5
ROMP_0A9_046:
        CON(5)  DOARRY                           * C40E1  array 8
        LENGTH                                   * C40E6  length, to #C412A
        CON(5)  DOROMP                           * C40EB  element type
        CON(5)  1                                * C40F0  dimensions
        CON(5)  8                                * C40F5
        ROMPBODY 002 158                         * C40FA  MEM
        ROMPBODY 002 026                         * C4100  BYTES
        ROMPBODY 002 027                         * C4106  NEWOB
        ROMPBODY 0A8 000                         * C410C
        ROMPBODY 0A8 03F                         * C4112  key "DIR"
        ROMPBODY 0A8 040                         * C4118  key "ARITH"
        ROMPBODY 002 160                         * C411E  ARCHIVE
        ROMPBODY 002 161                         * C4124  RESTORE
        ENDLENGTH                                * C412A

* ROMPTR 0A9 047
* refs (1): C31C5
ROMP_0A9_047:
        CON(5)  DOARRY                           * C412A  array 12
        LENGTH                                   * C412F  length, to #C418B
        CON(5)  DOROMP                           * C4134  element type
        CON(5)  1                                * C4139  dimensions
        CON(5)  12                               * C413E
        ROMPBODY 002 021                         * C4143  PATH
        ROMPBODY 002 020                         * C4149  CRDIR
        ROMPBODY 002 15F                         * C414F  PGDIR
        ROMPBODY 002 024                         * C4155  VARS
        ROMPBODY 002 025                         * C415B  TVARS
        ROMPBODY 002 159                         * C4161  ORDER
        ROMPBODY 0A8 000                         * C4167
        ROMPBODY 0A8 000                         * C416D
        ROMPBODY 0A8 000                         * C4173
        ROMPBODY 0A8 000                         * C4179
        ROMPBODY 0A8 000                         * C417F
        ROMPBODY 0A8 041                         * C4185  key "MEM"
        ENDLENGTH                                * C418B

* ROMPTR 0A9 048
* refs (1): C31C5
ROMP_0A9_048:
        CON(5)  DOARRY                           * C418B  array 12
        LENGTH                                   * C4190  length, to #C41EC
        CON(5)  DOROMP                           * C4195  element type
        CON(5)  1                                * C419A  dimensions
        CON(5)  12                               * C419F
        ROMPBODY 002 147                         * C41A4  STO+
        ROMPBODY 002 148                         * C41AA  STO-
        ROMPBODY 002 14A                         * C41B0  STO*
        ROMPBODY 002 149                         * C41B6  STO/
        ROMPBODY 002 14B                         * C41BC  INCR
        ROMPBODY 002 14C                         * C41C2  DECR
        ROMPBODY 002 144                         * C41C8  SINV
        ROMPBODY 002 145                         * C41CE  SNEG
        ROMPBODY 002 146                         * C41D4  SCONJ
        ROMPBODY 0A8 000                         * C41DA
        ROMPBODY 0A8 000                         * C41E0
        ROMPBODY 0A8 041                         * C41E6  key "MEM"
        ENDLENGTH                                * C41EC

* ROMPTR 0A9 049
* refs (1): C31C5
ROMP_0A9_049:
        CON(5)  DOARRY                           * C41EC  array 11
        LENGTH                                   * C41F1  length, to #C4247
        CON(5)  DOROMP                           * C41F6  element type
        CON(5)  1                                * C41FB  dimensions
        CON(5)  11                               * C4200
        ROMPBODY 002 113                         * C4205  OVER
        ROMPBODY 002 112                         * C420B  ROT
        ROMPBODY 002 118                         * C4211  ROLL
        ROMPBODY 002 119                         * C4217  ROLLD
        ROMPBODY 002 117                         * C421D  PICK
        ROMPBODY 002 114                         * C4223  DEPTH
        ROMPBODY 002 10D                         * C4229  DUP
        ROMPBODY 002 10E                         * C422F  DUP2
        ROMPBODY 002 116                         * C4235  DUPN
        ROMPBODY 002 111                         * C423B  DROP2
        ROMPBODY 0A8 042                         * C4241  key "DRPN"
        ENDLENGTH                                * C4247

* ROMPTR 0A9 04A
* refs (1): C31C5
ROMP_0A9_04A:
        ROMPTR 0A7 005                           * C4247

* ROMPTR 0A9 04B
* refs (1): C31C5
ROMP_0A9_04B:
        CON(5)  DOARRY                           * C4252  array 6
        LENGTH                                   * C4257  length, to #C428F
        CON(5)  DOROMP                           * C425C  element type
        CON(5)  1                                * C4261  dimensions
        CON(5)  6                                * C4266
        ROMPBODY 0A8 044                         * C426B  key "SOLVR"
        ROMPBODY 002 0FB                         * C4271  ROOT
        ROMPBODY 0A8 001                         * C4277
        ROMPBODY 0A8 000                         * C427D
        ROMPBODY 0A8 000                         * C4283
        ROMPBODY 0A8 043                         * C4289  key "SOLVE"
        ENDLENGTH                                * C428F

* ROMPTR 0A9 04C
* refs (1): C31C5
ROMP_0A9_04C:
        CON(5)  DOARRY                           * C428F  array 12
        LENGTH                                   * C4294  length, to #C42F0
        CON(5)  DOROMP                           * C4299  element type
        CON(5)  1                                * C429E  dimensions
        CON(5)  12                               * C42A3
        ROMPBODY 0AB 02B                         * C42A8  RKF
        ROMPBODY 0AB 02E                         * C42AE  RRK
        ROMPBODY 0AB 02C                         * C42B4  RKFSTEP
        ROMPBODY 0AB 02F                         * C42BA  RRKSTEP
        ROMPBODY 0AB 02D                         * C42C0  RKFERR
        ROMPBODY 0AB 030                         * C42C6  RSBERR
        ROMPBODY 0A8 000                         * C42CC
        ROMPBODY 0A8 000                         * C42D2
        ROMPBODY 0A8 000                         * C42D8
        ROMPBODY 0A8 000                         * C42DE
        ROMPBODY 0A8 000                         * C42E4
        ROMPBODY 0A8 043                         * C42EA  key "SOLVE"
        ENDLENGTH                                * C42F0

* ROMPTR 0A9 04D
* refs (1): C31C5
ROMP_0A9_04D:
        CON(5)  DOARRY                           * C42F0  array 6
        LENGTH                                   * C42F5  length, to #C432D
        CON(5)  DOROMP                           * C42FA  element type
        CON(5)  1                                * C42FF  dimensions
        CON(5)  6                                * C4304
        ROMPBODY 0AB 052                         * C4309  PROOT
        ROMPBODY 0AB 053                         * C430F  PCOEF
        ROMPBODY 0AB 054                         * C4315  PEVAL
        ROMPBODY 0A8 000                         * C431B
        ROMPBODY 0A8 000                         * C4321
        ROMPBODY 0A8 043                         * C4327  key "SOLVE"
        ENDLENGTH                                * C432D

* ROMPTR 0A9 04E
* refs (1): C31C5
ROMP_0A9_04E:
        CON(5)  DOARRY                           * C432D  array 6
        LENGTH                                   * C4332  length, to #C436A
        CON(5)  DOROMP                           * C4337  element type
        CON(5)  1                                * C433C  dimensions
        CON(5)  6                                * C4341
        ROMPBODY 002 048                         * C4346  /
        ROMPBODY 0AB 036                         * C434C  LSQ
        ROMPBODY 002 07B                         * C4352  RSD
        ROMPBODY 0A8 000                         * C4358
        ROMPBODY 0A8 000                         * C435E
        ROMPBODY 0A8 043                         * C4364  key "SOLVE"
        ENDLENGTH                                * C436A

* ROMPTR 0A9 04F
* refs (1): C31C5
ROMP_0A9_04F:
        CON(5)  DOARRY                           * C436A  array 6
        LENGTH                                   * C436F  length, to #C43A7
        CON(5)  DOROMP                           * C4374  element type
        CON(5)  1                                * C4379  dimensions
        CON(5)  6                                * C437E
        ROMPBODY 0A8 045                         * C4383  key "SOLVR"
        ROMPBODY 0AB 058                         * C4389  TVMROOT
        ROMPBODY 0AB 059                         * C438F  AMORT
        ROMPBODY 0A8 048                         * C4395  key "BEG"
        ROMPBODY 0A8 000                         * C439B
        ROMPBODY 0A8 043                         * C43A1  key "SOLVE"
        ENDLENGTH                                * C43A7

* ROMPTR 0A9 050
* refs (1): C31C5
ROMP_0A9_050:
        ROMPTR 0A7 007                           * C43A7

* ROMPTR 0A9 051
* refs (1): C31C5
ROMP_0A9_051:
        ROMPTR 0A7 008                           * C43B2

* ROMPTR 0A9 052
* refs (1): C31C5
ROMP_0A9_052:
        ROMPTR 0A7 009                           * C43BD

* ROMPTR 0A9 053
* refs (1): C31C5
ROMP_0A9_053:
        ROMPTR 0A7 00A                           * C43C8

* ROMPTR 0A9 054
* refs (1): C31C5
ROMP_0A9_054:
        CON(5)  DOARRY                           * C43D3  array 6
        LENGTH                                   * C43D8  length, to #C4410
        CON(5)  DOROMP                           * C43DD  element type
        CON(5)  1                                * C43E2  dimensions
        CON(5)  6                                * C43E7
        ROMPBODY 0A8 054                         * C43EC  key "PTYPE"
        ROMPBODY 0A8 055                         * C43F2  key "VPAR"
        ROMPBODY 0A8 001                         * C43F8
        ROMPBODY 0A8 000                         * C43FE
        ROMPBODY 0A8 000                         * C4404
        ROMPBODY 0A8 050                         * C440A  key "PLOT"
        ENDLENGTH                                * C4410

* ROMPTR 0A9 055
* refs (1): C31C5
ROMP_0A9_055:
        ROMPTR 0A7 00B                           * C4410

* ROMPTR 0A9 056
* refs (1): C31C5
ROMP_0A9_056:
        ROMPTR 0A7 00C                           * C441B

* ROMPTR 0A9 057
* refs (1): C31C5
ROMP_0A9_057:
        CON(5)  DOARRY                           * C4426  array 6
        LENGTH                                   * C442B  length, to #C4463
        CON(5)  DOROMP                           * C4430  element type
        CON(5)  1                                * C4435  dimensions
        CON(5)  6                                * C443A
        ROMPBODY 0A8 059                         * C443F  key "PTYPE"
        ROMPBODY 0A8 05A                         * C4445  key "DATA"
        ROMPBODY 0A8 05B                         * C444B  key "ΣPAR"
        ROMPBODY 0A8 000                         * C4451
        ROMPBODY 0A8 000                         * C4457
        ROMPBODY 0A8 050                         * C445D  key "PLOT"
        ENDLENGTH                                * C4463

* ROMPTR 0A9 058
* refs (1): C31C5
ROMP_0A9_058:
        ROMPTR 0A7 00D                           * C4463

* ROMPTR 0A9 059
* refs (1): C31C5
ROMP_0A9_059:
        ROMPTR 0A7 00E                           * C446E

* ROMPTR 0A9 05A
* refs (1): C31C5
ROMP_0A9_05A:
        ROMPTR 0A7 00F                           * C4479

* ROMPTR 0A9 05B
* refs (1): C31C5
ROMP_0A9_05B:
        CON(5)  DOARRY                           * C4484  array 6
        LENGTH                                   * C4489  length, to #C44C1
        CON(5)  DOROMP                           * C448E  element type
        CON(5)  1                                * C4493  dimensions
        CON(5)  6                                * C4498
        ROMPBODY 002 11E                         * C449D  Σ+
        ROMPBODY 002 11F                         * C44A3  Σ-
        ROMPBODY 002 11C                         * C44A9  CLΣ
        ROMPBODY 0A8 003                         * C44AF
        ROMPBODY 0A8 000                         * C44B5
        ROMPBODY 0A8 04D                         * C44BB  key "STAT"
        ENDLENGTH                                * C44C1

* ROMPTR 0A9 05C
* refs (1): C31C5
ROMP_0A9_05C:
        CON(5)  DOARRY                           * C44C1  array 6
        LENGTH                                   * C44C6  length, to #C44FE
        CON(5)  DOROMP                           * C44CB  element type
        CON(5)  1                                * C44D0  dimensions
        CON(5)  6                                * C44D5
        ROMPBODY 0A8 060                         * C44DA  key "AXES"
        ROMPBODY 0A8 061                         * C44E0  key "CNCT"
        ROMPBODY 0A8 062                         * C44E6  key "SIMU"
        ROMPBODY 0A8 000                         * C44EC
        ROMPBODY 0A8 000                         * C44F2
        ROMPBODY 0A8 04F                         * C44F8  key "PLOT"
        ENDLENGTH                                * C44FE

* ROMPTR 0A9 05D
* refs (1): C31C5
ROMP_0A9_05D:
        CON(5)  DOARRY                           * C44FE  array 13
        LENGTH                                   * C4503  length, to #C4565
        CON(5)  DOROMP                           * C4508  element type
        CON(5)  1                                * C450D  dimensions
        CON(5)  13                               * C4512
        ROMPBODY 002 14D                         * C4517  COLCT
        ROMPBODY 002 14E                         * C451D  EXPAN
        ROMPBODY 002 150                         * C4523  ISOL
        ROMPBODY 002 151                         * C4529  QUAD
        ROMPBODY 002 152                         * C452F  SHOW
        ROMPBODY 002 153                         * C4535  TAYLR
        ROMPBODY 002 109                         * C453B  ↑MATCH
        ROMPBODY 002 10A                         * C4541  ↓MATCH
        ROMPBODY 002 107                         * C4547  →Q
        ROMPBODY 002 108                         * C454D  →Qπ
        ROMPBODY 002 0FF                         * C4553  |
        ROMPBODY 002 102                         * C4559  APPLY
        ROMPBODY 002 101                         * C455F  QUOTE
        ENDLENGTH                                * C4565

* ROMPTR 0A9 05E
* refs (1): C31C5
ROMP_0A9_05E:
        CON(5)  DOARRY                           * C4565  array 14
        LENGTH                                   * C456A  length, to #C45D2
        CON(5)  DOROMP                           * C456F  element type
        CON(5)  1                                * C4574  dimensions
        CON(5)  14                               * C4579
        ROMPBODY 002 011                         * C457E  DATE
        ROMPBODY 002 016                         * C4584  →DATE
        ROMPBODY 002 010                         * C458A  TIME
        ROMPBODY 002 017                         * C4590  →TIME
        ROMPBODY 002 012                         * C4596  TICKS
        ROMPBODY 0A8 063                         * C459C  key "ALRM"
        ROMPBODY 002 01F                         * C45A2  DATE+
        ROMPBODY 002 01E                         * C45A8  DDAYS
        ROMPBODY 002 072                         * C45AE  →HMS
        ROMPBODY 002 073                         * C45B4  HMS→
        ROMPBODY 002 074                         * C45BA  HMS+
        ROMPBODY 002 075                         * C45C0  HMS-
        ROMPBODY 002 01D                         * C45C6  TSTR
        ROMPBODY 002 018                         * C45CC  CLKADJ
        ENDLENGTH                                * C45D2

* ROMPTR 0A9 05F
* refs (1): C31C5
ROMP_0A9_05F:
        CON(5)  DOARRY                           * C45D2  array 12
        LENGTH                                   * C45D7  length, to #C4633
        CON(5)  DOROMP                           * C45DC  element type
        CON(5)  1                                * C45E1  dimensions
        CON(5)  12                               * C45E6
        ROMPBODY 002 015                         * C45EB  ACK
        ROMPBODY 002 014                         * C45F1  ACKALL
        ROMPBODY 002 019                         * C45F7  STOALARM
        ROMPBODY 002 01A                         * C45FD  RCLALARM
        ROMPBODY 002 01C                         * C4603  DELALARM
        ROMPBODY 002 01B                         * C4609  FINDALARM
        ROMPBODY 0A8 000                         * C460F
        ROMPBODY 0A8 000                         * C4615
        ROMPBODY 0A8 000                         * C461B
        ROMPBODY 0A8 000                         * C4621
        ROMPBODY 0A8 000                         * C4627
        ROMPBODY 0A8 064                         * C462D  key "TIME"
        ENDLENGTH                                * C4633

* ROMPTR 0A9 060
* refs (1): C31C5
ROMP_0A9_060:
        CON(5)  DOARRY                           * C4633  array 6
        LENGTH                                   * C4638  length, to #C4670
        CON(5)  DOROMP                           * C463D  element type
        CON(5)  1                                * C4642  dimensions
        CON(5)  6                                * C4647
        ROMPBODY 0A8 065                         * C464C  key "DATA"
        ROMPBODY 0A8 066                         * C4652  key "ΣPAR"
        ROMPBODY 0A8 067                         * C4658  key "1VAR"
        ROMPBODY 0A8 068                         * C465E  key "PLOT"
        ROMPBODY 0A8 069                         * C4664  key "FIT"
        ROMPBODY 0A8 06A                         * C466A  key "SUMS"
        ENDLENGTH                                * C4670

* ROMPTR 0A9 061
* refs (1): C31C5
ROMP_0A9_061:
        CON(5)  DOARRY                           * C4670  array 6
        LENGTH                                   * C4675  length, to #C46AD
        CON(5)  DOROMP                           * C467A  element type
        CON(5)  1                                * C467F  dimensions
        CON(5)  6                                * C4684
        ROMPBODY 002 11E                         * C4689  Σ+
        ROMPBODY 002 11F                         * C468F  Σ-
        ROMPBODY 002 11C                         * C4695  CLΣ
        ROMPBODY 0A8 003                         * C469B
        ROMPBODY 0A8 000                         * C46A1
        ROMPBODY 0A8 06B                         * C46A7  key "STAT"
        ENDLENGTH                                * C46AD

* ROMPTR 0A9 062
* refs (1): C31C5
ROMP_0A9_062:
        ROMPTR 0A7 010                           * C46AD

* ROMPTR 0A9 063
* refs (1): C31C5
ROMP_0A9_063:
        ROMPTR 0A7 011                           * C46B8

* ROMPTR 0A9 064
* refs (1): C31C5
ROMP_0A9_064:
        CON(5)  DOARRY                           * C46C3  array 12
        LENGTH                                   * C46C8  length, to #C4724
        CON(5)  DOROMP                           * C46CD  element type
        CON(5)  1                                * C46D2  dimensions
        CON(5)  12                               * C46D7
        ROMPBODY 002 12C                         * C46DC  TOT
        ROMPBODY 002 129                         * C46E2  MEAN
        ROMPBODY 002 12B                         * C46E8  SDEV
        ROMPBODY 002 128                         * C46EE  MAXΣ
        ROMPBODY 002 12A                         * C46F4  MINΣ
        ROMPBODY 002 13B                         * C46FA  BINS
        ROMPBODY 002 12D                         * C4700  VAR
        ROMPBODY 0AB 028                         * C4706  PSDEV
        ROMPBODY 0AB 029                         * C470C  PVAR
        ROMPBODY 0A8 000                         * C4712
        ROMPBODY 0A8 000                         * C4718
        ROMPBODY 0A8 06B                         * C471E  key "STAT"
        ENDLENGTH                                * C4724

* ROMPTR 0A9 065
* refs (1): C31C5
ROMP_0A9_065:
        CON(5)  DOARRY                           * C4724  array 6
        LENGTH                                   * C4729  length, to #C4761
        CON(5)  DOROMP                           * C472E  element type
        CON(5)  1                                * C4733  dimensions
        CON(5)  6                                * C4738
        ROMPBODY 0A8 06C                         * C473D
        ROMPBODY 0A8 06D                         * C4743
        ROMPBODY 0A8 06E                         * C4749
        ROMPBODY 0A8 000                         * C474F
        ROMPBODY 0A8 000                         * C4755
        ROMPBODY 0A8 06B                         * C475B  key "STAT"
        ENDLENGTH                                * C4761

* ROMPTR 0A9 066
* refs (1): C31C5
ROMP_0A9_066:
        CON(5)  DOARRY                           * C4761  array 12
        LENGTH                                   * C4766  length, to #C47C2
        CON(5)  DOROMP                           * C476B  element type
        CON(5)  1                                * C4770  dimensions
        CON(5)  12                               * C4775
        ROMPBODY 002 13A                         * C477A  ΣLINE
        ROMPBODY 002 12E                         * C4780  LR
        ROMPBODY 002 131                         * C4786  PREDX
        ROMPBODY 002 130                         * C478C  PREDY
        ROMPBODY 002 121                         * C4792  CORR
        ROMPBODY 002 122                         * C4798  COV
        ROMPBODY 0AB 02A                         * C479E  PCOV
        ROMPBODY 0A8 000                         * C47A4
        ROMPBODY 0A8 000                         * C47AA
        ROMPBODY 0A8 000                         * C47B0
        ROMPBODY 0A8 000                         * C47B6
        ROMPBODY 0A8 06B                         * C47BC  key "STAT"
        ENDLENGTH                                * C47C2

* ROMPTR 0A9 067
* refs (1): C31C5
ROMP_0A9_067:
        CON(5)  DOARRY                           * C47C2  array 12
        LENGTH                                   * C47C7  length, to #C4823
        CON(5)  DOROMP                           * C47CC  element type
        CON(5)  1                                * C47D1  dimensions
        CON(5)  12                               * C47D6
        ROMPBODY 002 123                         * C47DB  ΣX
        ROMPBODY 002 124                         * C47E1  ΣY
        ROMPBODY 002 125                         * C47E7  ΣX^2
        ROMPBODY 002 126                         * C47ED  ΣY^2
        ROMPBODY 002 127                         * C47F3  ΣX*Y
        ROMPBODY 002 120                         * C47F9  NΣ
        ROMPBODY 0A8 000                         * C47FF
        ROMPBODY 0A8 000                         * C4805
        ROMPBODY 0A8 000                         * C480B
        ROMPBODY 0A8 000                         * C4811
        ROMPBODY 0A8 000                         * C4817
        ROMPBODY 0A8 06B                         * C481D  key "STAT"
        ENDLENGTH                                * C4823

* ROMPTR 0A9 068
* refs (1): C31C5
ROMP_0A9_068:
        CON(5)  DOARRY                           * C4823  array 12
        LENGTH                                   * C4828  length, to #C4884
        CON(5)  DOROMP                           * C482D  element type
        CON(5)  1                                * C4832  dimensions
        CON(5)  12                               * C4837
        ROMPBODY 0A8 073                         * C483C  key "SRVR"
        ROMPBODY 0A8 074                         * C4842  key "IOPAR"
        ROMPBODY 0A8 075                         * C4848  key "PRINT"
        ROMPBODY 002 0F0                         * C484E  PR1
        ROMPBODY 002 16B                         * C4854  SEND
        ROMPBODY 002 16E                         * C485A  RECV
        ROMPBODY 0A8 076                         * C4860  key "SERIAL"
        ROMPBODY 002 175                         * C4866  KERRM
        ROMPBODY 002 16D                         * C486C  RECN
        ROMPBODY 002 16A                         * C4872  CLOSEIO
        ROMPBODY 0AB 05E                         * C4878  XSEND
        ROMPBODY 0AB 05F                         * C487E  XRECV
        ENDLENGTH                                * C4884

* ROMPTR 0A9 069
* refs (1): C31C5
ROMP_0A9_069:
        CON(5)  DOARRY                           * C4884  array 6
        LENGTH                                   * C4889  length, to #C48C1
        CON(5)  DOROMP                           * C488E  element type
        CON(5)  1                                * C4893  dimensions
        CON(5)  6                                * C4898
        ROMPBODY 002 170                         * C489D  SERVER
        ROMPBODY 002 179                         * C48A3  PKT
        ROMPBODY 002 16C                         * C48A9  KGET
        ROMPBODY 002 16F                         * C48AF  FINISH
        ROMPBODY 0A8 000                         * C48B5
        ROMPBODY 0A8 077                         * C48BB  key "I/O"
        ENDLENGTH                                * C48C1

* ROMPTR 0A9 06A
* refs (1): C31C5
ROMP_0A9_06A:
        ROMPTR 0A7 023                           * C48C1

* ROMPTR 0A9 06B
* refs (1): C31C5
ROMP_0A9_06B:
        CON(5)  DOARRY                           * C48CC  array 12
        LENGTH                                   * C48D1  length, to #C492D
        CON(5)  DOROMP                           * C48D6  element type
        CON(5)  1                                * C48DB  dimensions
        CON(5)  12                               * C48E0
        ROMPBODY 002 0F4                         * C48E5  PRVAR
        ROMPBODY 002 0F2                         * C48EB  PRST
        ROMPBODY 002 0F1                         * C48F1  PRSTC
        ROMPBODY 002 0F6                         * C48F7  PRLCD
        ROMPBODY 002 0F3                         * C48FD  CR
        ROMPBODY 0A8 07D                         * C4903  key "PRTPAR"
        ROMPBODY 002 0F0                         * C4909  PR1
        ROMPBODY 0A8 000                         * C490F
        ROMPBODY 0A8 000                         * C4915
        ROMPBODY 0A8 000                         * C491B
        ROMPBODY 0A8 000                         * C4921
        ROMPBODY 0A8 077                         * C4927  key "I/O"
        ENDLENGTH                                * C492D

* ROMPTR 0A9 06C
* refs (1): C31C5
ROMP_0A9_06C:
        ROMPTR 0A7 024                           * C492D

* ROMPTR 0A9 06D
* refs (1): C31C5
ROMP_0A9_06D:
        CON(5)  DOARRY                           * C4938  array 12
        LENGTH                                   * C493D  length, to #C4999
        CON(5)  DOROMP                           * C4942  element type
        CON(5)  1                                * C4947  dimensions
        CON(5)  12                               * C494C
        ROMPBODY 002 167                         * C4951  XMIT
        ROMPBODY 002 168                         * C4957  SRECV
        ROMPBODY 002 177                         * C495D  STIME
        ROMPBODY 002 178                         * C4963  SBRK
        ROMPBODY 002 176                         * C4969  BUFLEN
        ROMPBODY 002 169                         * C496F  OPENIO
        ROMPBODY 0A8 000                         * C4975
        ROMPBODY 0A8 000                         * C497B
        ROMPBODY 0A8 000                         * C4981
        ROMPBODY 0A8 000                         * C4987
        ROMPBODY 0A8 000                         * C498D
        ROMPBODY 0A8 078                         * C4993  key "I/O"
        ENDLENGTH                                * C4999

* ROMPTR 0A9 06E
* refs (1): C31C5
ROMP_0A9_06E:
        CON(5)  DOARRY                           * C4999  array 8
        LENGTH                                   * C499E  length, to #C49E2
        CON(5)  DOROMP                           * C49A3  element type
        CON(5)  1                                * C49A8  dimensions
        CON(5)  8                                * C49AD
        ROMPBODY 0A8 080                         * C49B2  key "PORTS"
        ROMPBODY 002 15E                         * C49B8  PVARS
        ROMPBODY 002 164                         * C49BE  LIBS
        ROMPBODY 0AB 016                         * C49C4  MERGE1
        ROMPBODY 0AB 017                         * C49CA  FREE1
        ROMPBODY 002 166                         * C49D0  DETACH
        ROMPBODY 002 165                         * C49D6  ATTACH
        ROMPBODY 0AB 081                         * C49DC  PINIT
        ENDLENGTH                                * C49E2

* ROMPTR 0A9 06F
* refs (1): C31C5
ROMP_0A9_06F:
        ROMPTR 0A7 026                           * C49E2

* ROMPTR 0A9 070
* refs (1): C31C5
ROMP_0A9_070:
        ROMPTR 0A7 025                           * C49ED

* ROMPTR 0A9 071
* refs (1): C31C5
ROMP_0A9_071:
        ROMPTR 0A7 027                           * C49F8

* ROMPTR 0A9 072
* refs (1): C31C5
ROMP_0A9_072:
        CON(5)  DOARRY                           * C4A03  array 6
        LENGTH                                   * C4A08  length, to #C4A40
        CON(5)  DOROMP                           * C4A0D  element type
        CON(5)  1                                * C4A12  dimensions
        CON(5)  6                                * C4A17
        ROMPBODY 0AB 022                         * C4A1C  EQNLIB
        ROMPBODY 0AB 023                         * C4A22  SOLVEQN
        ROMPBODY 0AB 06F                         * C4A28
        ROMPBODY 0A8 000                         * C4A2E
        ROMPBODY 0A8 000                         * C4A34
        ROMPBODY 0A8 081                         * C4A3A  key "EQLIB"
        ENDLENGTH                                * C4A40

* ROMPTR 0A9 073
* refs (1): C31C5
ROMP_0A9_073:
        CON(5)  DOARRY                           * C4A40  array 6
        LENGTH                                   * C4A45  length, to #C4A7D
        CON(5)  DOROMP                           * C4A4A  element type
        CON(5)  1                                * C4A4F  dimensions
        CON(5)  6                                * C4A54
        ROMPBODY 0AB 020                         * C4A59  CONLIB
        ROMPBODY 0AB 021                         * C4A5F  CONST
        ROMPBODY 0A8 000                         * C4A65
        ROMPBODY 0A8 000                         * C4A6B
        ROMPBODY 0A8 000                         * C4A71
        ROMPBODY 0A8 081                         * C4A77  key "EQLIB"
        ENDLENGTH                                * C4A7D

* ROMPTR 0A9 074
* refs (1): C31C5
ROMP_0A9_074:
        CON(5)  DOARRY                           * C4A7D  array 12
        LENGTH                                   * C4A82  length, to #C4ADE
        CON(5)  DOROMP                           * C4A87  element type
        CON(5)  1                                * C4A8C  dimensions
        CON(5)  12                               * C4A91
        ROMPBODY 0AB 06F                         * C4A96
        ROMPBODY 0AB 070                         * C4A9C  MINIT
        ROMPBODY 0AB 071                         * C4AA2  MITM
        ROMPBODY 0AB 072                         * C4AA8  MUSER
        ROMPBODY 0AB 073                         * C4AAE  MCALC
        ROMPBODY 0AB 074                         * C4AB4  MROOT
        ROMPBODY 0A8 000                         * C4ABA
        ROMPBODY 0A8 000                         * C4AC0
        ROMPBODY 0A8 000                         * C4AC6
        ROMPBODY 0A8 000                         * C4ACC
        ROMPBODY 0A8 000                         * C4AD2
        ROMPBODY 0A8 081                         * C4AD8  key "EQLIB"
        ENDLENGTH                                * C4ADE

* ROMPTR 0A9 075
* refs (1): C31C5
ROMP_0A9_075:
        CON(5)  DOARRY                           * C4ADE  array 18
        LENGTH                                   * C4AE3  length, to #C4B63
        CON(5)  DOROMP                           * C4AE8  element type
        CON(5)  1                                * C4AED  dimensions
        CON(5)  18                               * C4AF2
        ROMPBODY 0AB 075                         * C4AF7  MINEHUNT
        ROMPBODY 0AB 076                         * C4AFD  ZFACTOR
        ROMPBODY 0AB 077                         * C4B03  FANNING
        ROMPBODY 0AB 078                         * C4B09  DARCY
        ROMPBODY 0AB 079                         * C4B0F  F0λ
        ROMPBODY 0AB 07A                         * C4B15  SIDENS
        ROMPBODY 0AB 07B                         * C4B1B  TDELTA
        ROMPBODY 0AB 07C                         * C4B21  TINC
        ROMPBODY 0AB 07D                         * C4B27  gmol
        ROMPBODY 0AB 07E                         * C4B2D  lbmol
        ROMPBODY 0AB 07F                         * C4B33  rpm
        ROMPBODY 0AB 080                         * C4B39  dB
        ROMPBODY 0A8 000                         * C4B3F
        ROMPBODY 0A8 000                         * C4B45
        ROMPBODY 0A8 000                         * C4B4B
        ROMPBODY 0A8 000                         * C4B51
        ROMPBODY 0A8 000                         * C4B57
        ROMPBODY 0A8 081                         * C4B5D  key "EQLIB"
        ENDLENGTH                                * C4B63

LIB0A9.hash:
        CON(5)  DOHSTR                           * C4B63  hash table of library 0A9
        LENGTH                                   * C4B68  length, to #C4BC7
        CON(5)  0                                * C4B6D  names of length 1
        CON(5)  0                                * C4B72  names of length 2
        CON(5)  0                                * C4B77  names of length 3
        CON(5)  0                                * C4B7C  names of length 4
        CON(5)  0                                * C4B81  names of length 5
        CON(5)  0                                * C4B86  names of length 6
        CON(5)  0                                * C4B8B  names of length 7
        CON(5)  0                                * C4B90  names of length 8
        CON(5)  0                                * C4B95  names of length 9
        CON(5)  0                                * C4B9A  names of length 10
        CON(5)  0                                * C4B9F  names of length 11
        CON(5)  0                                * C4BA4  names of length 12
        CON(5)  0                                * C4BA9  names of length 13
        CON(5)  0                                * C4BAE  names of length 14
        CON(5)  0                                * C4BB3  names of length 15
        CON(5)  0                                * C4BB8  names of length 16
        REL(5)  L_C4BC2                          * C4BBD  end of the names
L_C4BC2:
        CON(5)  0                                * C4BC2  command 000 has no name
        ENDLENGTH                                * C4BC7

LIB0A9.link:
        CON(5)  DOHSTR                           * C4BC7  link table of library 0A9
        LENGTH                                   * C4BCC  length, to #C4E1F
        REL(5)  ROMP_0A9_000                     * C4BD1  000 
        REL(5)  ROMP_0A9_001                     * C4BD6  001 
        REL(5)  ROMP_0A9_002                     * C4BDB  002 
        REL(5)  MenuMTH~1                        * C4BE0  003 
        REL(5)  MenuMTH~3                        * C4BE5  004 
        REL(5)  ROMP_0A9_005                     * C4BEA  005 
        REL(5)  ROMP_0A9_006                     * C4BEF  006 
        REL(5)  ROMP_0A9_007                     * C4BF4  007 
        REL(5)  ROMP_0A9_008                     * C4BF9  008 
        REL(5)  ROMP_0A9_009                     * C4BFE  009 
        REL(5)  ROMP_0A9_00A                     * C4C03  00A 
        REL(5)  MenuMTH~4                        * C4C08  00B 
        REL(5)  MenuMTH~5                        * C4C0D  00C 
        REL(5)  MenuMTH~6                        * C4C12  00D 
        REL(5)  MenuMTH~7                        * C4C17  00E 
        REL(5)  ROMP_0A9_00F                     * C4C1C  00F 
        REL(5)  ROMP_0A9_010                     * C4C21  010 
        REL(5)  ROMP_0A9_011                     * C4C26  011 
        REL(5)  ROMP_0A9_012                     * C4C2B  012 
        REL(5)  MenuMTH~8                        * C4C30  013 
        REL(5)  MenuMTH~9                        * C4C35  014 
        REL(5)  MenuMTH~10                       * C4C3A  015 
        REL(5)  MenuPr~1                         * C4C3F  016 
        REL(5)  ROMP_0A9_017                     * C4C44  017 
        REL(5)  ROMP_0A9_018                     * C4C49  018 
        REL(5)  ROMP_0A9_019                     * C4C4E  019 
        REL(5)  ROMP_0A9_01A                     * C4C53  01A 
        REL(5)  ROMP_0A9_01B                     * C4C58  01B 
        REL(5)  ~EditMenu                        * C4C5D  01C 
        REL(5)  ROMP_0A9_01D                     * C4C62  01D 
        REL(5)  ROMP_0A9_01E                     * C4C67  01E 
        REL(5)  ROMP_0A9_01F                     * C4C6C  01F 
        REL(5)  MenuPr~3                         * C4C71  020 
        REL(5)  MenuPr~4                         * C4C76  021 
        REL(5)  ROMP_0A9_022                     * C4C7B  022 
        REL(5)  ROMP_0A9_023                     * C4C80  023 
        REL(5)  ROMP_0A9_024                     * C4C85  024 
        REL(5)  MenuPr~5                         * C4C8A  025 
        REL(5)  MenuPr~6                         * C4C8F  026 
        REL(5)  MenuPr~7                         * C4C94  027 
        REL(5)  MenuPr~8                         * C4C99  028 
        REL(5)  MenuPr~9                         * C4C9E  029 
        REL(5)  ROMP_0A9_02A                     * C4CA3  02A 
        REL(5)  ROMP_0A9_02B                     * C4CA8  02B 
        REL(5)  ROMP_0A9_02C                     * C4CAD  02C 
        REL(5)  ROMP_0A9_02D                     * C4CB2  02D 
        REL(5)  ROMP_0A9_02E                     * C4CB7  02E 
        REL(5)  ROMP_0A9_02F                     * C4CBC  02F 
        REL(5)  ROMP_0A9_030                     * C4CC1  030 
        REL(5)  ROMP_0A9_031                     * C4CC6  031 
        REL(5)  ROMP_0A9_032                     * C4CCB  032 
        REL(5)  ROMP_0A9_033                     * C4CD0  033 
        REL(5)  ROMP_0A9_034                     * C4CD5  034 
        REL(5)  ROMP_0A9_035                     * C4CDA  035 
        REL(5)  ROMP_0A9_036                     * C4CDF  036 
        REL(5)  ROMP_0A9_037                     * C4CE4  037 
        REL(5)  ROMP_0A9_038                     * C4CE9  038 
        REL(5)  ROMP_0A9_039                     * C4CEE  039 
        REL(5)  ROMP_0A9_03A                     * C4CF3  03A 
        REL(5)  ROMP_0A9_03B                     * C4CF8  03B 
        REL(5)  ROMP_0A9_03C                     * C4CFD  03C 
        REL(5)  ROMP_0A9_03D                     * C4D02  03D 
        REL(5)  ROMP_0A9_03E                     * C4D07  03E 
        REL(5)  ROMP_0A9_03F                     * C4D0C  03F 
        REL(5)  ROMP_0A9_040                     * C4D11  040 
        REL(5)  ROMP_0A9_041                     * C4D16  041 
        REL(5)  ROMP_0A9_042                     * C4D1B  042 
        REL(5)  ROMP_0A9_043                     * C4D20  043 
        REL(5)  ROMP_0A9_044                     * C4D25  044 
        REL(5)  ROMP_0A9_045                     * C4D2A  045 
        REL(5)  ROMP_0A9_046                     * C4D2F  046 
        REL(5)  ROMP_0A9_047                     * C4D34  047 
        REL(5)  ROMP_0A9_048                     * C4D39  048 
        REL(5)  ROMP_0A9_049                     * C4D3E  049 
        REL(5)  ROMP_0A9_04A                     * C4D43  04A 
        REL(5)  ROMP_0A9_04B                     * C4D48  04B 
        REL(5)  ROMP_0A9_04C                     * C4D4D  04C 
        REL(5)  ROMP_0A9_04D                     * C4D52  04D 
        REL(5)  ROMP_0A9_04E                     * C4D57  04E 
        REL(5)  ROMP_0A9_04F                     * C4D5C  04F 
        REL(5)  ROMP_0A9_050                     * C4D61  050 
        REL(5)  ROMP_0A9_051                     * C4D66  051 
        REL(5)  ROMP_0A9_052                     * C4D6B  052 
        REL(5)  ROMP_0A9_053                     * C4D70  053 
        REL(5)  ROMP_0A9_054                     * C4D75  054 
        REL(5)  ROMP_0A9_055                     * C4D7A  055 
        REL(5)  ROMP_0A9_056                     * C4D7F  056 
        REL(5)  ROMP_0A9_057                     * C4D84  057 
        REL(5)  ROMP_0A9_058                     * C4D89  058 
        REL(5)  ROMP_0A9_059                     * C4D8E  059 
        REL(5)  ROMP_0A9_05A                     * C4D93  05A 
        REL(5)  ROMP_0A9_05B                     * C4D98  05B 
        REL(5)  ROMP_0A9_05C                     * C4D9D  05C 
        REL(5)  ROMP_0A9_05D                     * C4DA2  05D 
        REL(5)  ROMP_0A9_05E                     * C4DA7  05E 
        REL(5)  ROMP_0A9_05F                     * C4DAC  05F 
        REL(5)  ROMP_0A9_060                     * C4DB1  060 
        REL(5)  ROMP_0A9_061                     * C4DB6  061 
        REL(5)  ROMP_0A9_062                     * C4DBB  062 
        REL(5)  ROMP_0A9_063                     * C4DC0  063 
        REL(5)  ROMP_0A9_064                     * C4DC5  064 
        REL(5)  ROMP_0A9_065                     * C4DCA  065 
        REL(5)  ROMP_0A9_066                     * C4DCF  066 
        REL(5)  ROMP_0A9_067                     * C4DD4  067 
        REL(5)  ROMP_0A9_068                     * C4DD9  068 
        REL(5)  ROMP_0A9_069                     * C4DDE  069 
        REL(5)  ROMP_0A9_06A                     * C4DE3  06A 
        REL(5)  ROMP_0A9_06B                     * C4DE8  06B 
        REL(5)  ROMP_0A9_06C                     * C4DED  06C 
        REL(5)  ROMP_0A9_06D                     * C4DF2  06D 
        REL(5)  ROMP_0A9_06E                     * C4DF7  06E 
        REL(5)  ROMP_0A9_06F                     * C4DFC  06F 
        REL(5)  ROMP_0A9_070                     * C4E01  070 
        REL(5)  ROMP_0A9_071                     * C4E06  071 
        REL(5)  ROMP_0A9_072                     * C4E0B  072 
        REL(5)  ROMP_0A9_073                     * C4E10  073 
        REL(5)  ROMP_0A9_074                     * C4E15  074 
        REL(5)  ROMP_0A9_075                     * C4E1A  075 
        ENDLENGTH                                * C4E1F
        ENDLENGTH                                * C4E1F

        LENGTH                                   * C4E1F  library object without its prolog (its place is the end of the link table before): length, to #C532B
        CON(2)  0                                * C4E24  no title
