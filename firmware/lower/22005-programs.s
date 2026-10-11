* HP 48GX ROM revision R, #22005-#24027: Program structures and library 700
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: x<< ONE{}N x>> xIFEND CK0ATTNABORT xTHEN palparse xIF xNEXT x' swap;->EditStr;+(2st) xSTARTVAR
* Follows on from the previous file (at #22005 in the original ROM).

* n ->
* ROMPTR 002 172 BAUD
* refs (1): 189EA
        CON(1)  8                                * 22005  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22006  library
        CON(3)  #172                             * 22009  command
        RPL
xBAUD:
        ::                                       * 2200C
          CK1&Dispatch                           * 22011
          BINT1                                  * 22016
          DOBAUD                                 * 2201B
        ;                                        * 22020

* n ->
* ROMPTR 002 173 PARITY
* refs (1): 189EA
        CON(1)  8                                * 22025  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22026  library
        CON(3)  #173                             * 22029  command
xPARITY:
        ::                                       * 2202C
          CK1&Dispatch                           * 22031
          BINT1                                  * 22036
          DOPARITY                               * 2203B
        ;                                        * 22040

* n ->
* ROMPTR 002 174 TRANSIO
* refs (1): 189EA
        CON(1)  8                                * 22045  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22046  library
        CON(3)  #174                             * 22049  command
xTRANSIO:
        ::                                       * 2204C
          CK1&Dispatch                           * 22051
          BINT1                                  * 22056
          DOTRANSIO                              * 2205B
        ;                                        * 22060

* -> msg
* ROMPTR 002 175 KERRM
* refs (1): 189EA
        CON(1)  8                                * 22065  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22066  library
        CON(3)  #175                             * 22069  command
xKERRM:
        ::                                       * 2206C
          CK0                                    * 22071
          DOKERRM                                * 22076
        ;                                        * 2207B

* -> nchars 0/1
* ROMPTR 002 176 BUFLEN
* refs (1): 189EA
        CON(1)  8                                * 22080  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22081  library
        CON(3)  #176                             * 22084  command
xBUFLEN:
        ::                                       * 22087
          CK0                                    * 2208C
          DOBUFLEN                               * 22091
        ;                                        * 22096

* x/0 ->
* ROMPTR 002 177 STIME
* refs (1): 189EA
        CON(1)  8                                * 2209B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2209C  library
        CON(3)  #177                             * 2209F  command
xSTIME:
        ::                                       * 220A2
          CK1&Dispatch                           * 220A7
          BINT1                                  * 220AC
          DOSTIME                                * 220B1
        ;                                        * 220B6

* ->
* ROMPTR 002 178 SBRK
* refs (1): 189EA
        CON(1)  8                                * 220BB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 220BC  library
        CON(3)  #178                             * 220BF  command
xSBRK:
        ::                                       * 220C2
          CK0                                    * 220C7
          DOSBRK                                 * 220CC
        ;                                        * 220D1

* $data $type -> $response
* ROMPTR 002 179 PKT
* refs (1): 189EA
        CON(1)  8                                * 220D6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 220D7  library
        CON(3)  #179                             * 220DA  command
xPKT:
        ::                                       * 220DD
          CK2&Dispatch                           * 220E2
          BINT51                                 * 220E7
          DOPKT                                  * 220EC
        ;                                        * 220F1

* refs (2): 2231B 22339
IOSetup:
        ::                                       * 220F6
          OBJ_479D4                              * 220FB
          ?SEMI                                  * 22100

IOSetup!:
          ::                                     * 22105
            OBJ_4792F                            * 2210A
            JstGetTHEMESG                        * 2210F
            DISPROW1                             * 22114
            OBJ_49A38                            * 22119
            JstGetTHEMESG                        * 2211E
            BINT33                               * 22123
            SysITE                               * 22128

_IR_:
            $       "IR"                         * 2212D

_wire_:
            $       "wire"                       * 2213B
            !append$                             * 2214D
            DISPROW2                             * 22152
            OBJ_49A42                            * 22157
            JstGetTHEMESG                        * 2215C
            BINT35                               * 22161
            SysITE                               * 22166

_binary_:
            $       "binary"                     * 2216B

_ASCII_:
            $       "ASCII"                      * 22181
            !append$                             * 22195
            DISPROW3                             * 2219A
            SetDA12Temp                          * 2219F
            GetIOPAR                             * 221A4
            SWAP                                 * 221A9
            6UNROLL                              * 221AE
            6UNROLL                              * 221B3
            2DROP                                * 221B8
            SWAP                                 * 221BD
            OBJ_49A4C                            * 221C2
            JstGetTHEMESG                        * 221C7
            swap;->EditStr;+(2st)                * 221CC
            DISPROW4                             * 221D1
            OBJ_49A56                            * 221D6
            JstGetTHEMESG                        * 221DB
            SWAP                                 * 221E0
            DUPTYPEREAL?                         * 221E5
            ITE                                  * 221EA
            ::                                   * 221EF
              {                                  * 221F4

_none_:
                $       "none "                  * 221F9

_odd_:
                $       "odd "                   * 2220D

_even_:
                $       "even "                  * 2221F

_mark_:
                $       "mark "                  * 22233
              }                                  * 22247
              OVER                               * 2224C
              %ABS                               * 22251
              COERCE                             * 22256
              #1+                                * 2225B
              NTHELCOMP                          * 22260
              ?SKIP                              * 22265

_space_:
              $       "spc "                     * 2226A
              swap;->EditStr;+(2st)              * 2227C
            ;                                    * 22281
            ::                                   * 22286
              DROP                               * 2228B

_invalid_:
              $       "invalid"                  * 22290
            ;                                    * 222A8
            !append$                             * 222AD
            DISPROW5                             * 222B2
            OBJ_49A60                            * 222B7
            JstGetTHEMESG                        * 222BC
            swap;->EditStr;+(2st)                * 222C1
            DISPROW6                             * 222C6
            OBJ_49A6A                            * 222CB
            JstGetTHEMESG                        * 222D0
            swap;->EditStr;+(2st)                * 222D5
            DISPROW7                             * 222DA
          ;                                      * 222DF
          SetDA3NoCh                             * 222E4
        ;                                        * 222E9

* refs (10): 221CC 2227C 222C1 222D5 4A4A0 4A781 ...
swap;->EditStr;+(2st):
        ::                                       * 222EE
          SWAP                                   * 222F3
          EDITDECOMP$                            * 222F8
          !append$                               * 222FD
        ;                                        * 22302

SetupA/B:
        ::                                       * 22307
          AtUserStack                            * 2230C
          BINT35                                 * 22311
          TogSysFlag                             * 22316
          IOSetup                                * 2231B
        ;                                        * 22320

SetupIR/W:
        ::                                       * 22325
          AtUserStack                            * 2232A
          BINT33                                 * 2232F
          TogSysFlag                             * 22334
          IOSetup                                * 22339
        ;                                        * 2233E

SetupBaud:
        ::                                       * 22343
          AtUserStack                            * 22348
          {                                      * 2234D

* 1200
* refs (1): B8CEB
%1200:
            %       1.2E3                        * 22352

* 2400
* refs (1): B8CF0
%2400:
            %       2.4E3                        * 22367

* 4800
* refs (1): B8CF5
%4800:
            %       4.8E3                        * 2237C

* 9600
* refs (5): 2E9A3 B02CE B8521 B8535 B8CFA
%9600:
            %       9.6E3                        * 22391
          }                                      * 223A6
          BINT6                                  * 223AB
          L_22473                                * 223B0
          DOBAUD                                 * 223B5
        ;                                        * 223BA

SetupCKSM:
        ::                                       * 223BF
          AtUserStack                            * 223C4
          {                                      * 223C9
            %1                                   * 223CE
            %2                                   * 223D3
            %3                                   * 223D8
          }                                      * 223DD
          BINT2                                  * 223E2
          L_22473                                * 223E7
          DOCKSM                                 * 223EC
        ;                                        * 223F1

SetupParit:
        ::                                       * 223F6
          AtUserStack                            * 223FB
          {                                      * 22400
            %0_2A2B4                             * 22405
            %1                                   * 2240A
            %2                                   * 2240F
            %3                                   * 22414
            %4                                   * 22419
          }                                      * 2241E
          BINT5                                  * 22423
          L_22473                                * 22428
          DOPARITY                               * 2242D
        ;                                        * 22432

SetupTrans:
        ::                                       * 22437
          AtUserStack                            * 2243C
          {                                      * 22441
            %0_2A2B4                             * 22446
            %1                                   * 2244B
            %2                                   * 22450
            %3                                   * 22455
          }                                      * 2245A
          BINT1                                  * 2245F
          L_22473                                * 22464
          DOTRANSIO                              * 22469
        ;                                        * 2246E

L_22473:
        CON(5)  DOCOL                            * 22473  address (the code jumps or points through it)

        CON(5)  GetIOPAR                         * 22478  address (the code jumps or points through it)

        CON(5)  7ROLL                            * 2247D  address (the code jumps or points through it)

        CON(5)  PICK                             * 22482  address (the code jumps or points through it)

        CON(5)  7UNROLL                          * 22487  address (the code jumps or points through it)

        CON(5)  6DROP                            * 2248C  address (the code jumps or points through it)

        CON(5)  OVERSWAP                         * 22491  address (the code jumps or points through it)

        CON(5)  EQUALPOSCOMP                     * 22496  address (the code jumps or points through it)

        CON(5)  #1+                              * 2249B  address (the code jumps or points through it)

        CON(5)  OVERSWAP                         * 224A0  address (the code jumps or points through it)

        CON(5)  NTHELCOMP                        * 224A5  address (the code jumps or points through it)

        CON(5)  case                             * 224AA  address (the code jumps or points through it)

        CON(5)  SWAPDROP                         * 224AF  address (the code jumps or points through it)

        CON(5)  BINT1                            * 224B4  address (the code jumps or points through it)

        CON(5)  NTHCOMPDROP                      * 224B9  address (the code jumps or points through it)
        NIBHEX  B21                              * 224BE  +

INPUT:
        CON(5)  L_02803                          * 224C1  code object: the address of its machine code
        NIBHEX  0A71                             * 224C6  ..

* $prompt $ -> $' $prompt {specs} -> $'
* ROMPTR 002 17A INPUT
* refs (1): 189EA
xINPUT:
        ::                                       * 224CA
          CK2&Dispatch                           * 224CF
          BINT51                                 * 224D4
          input(2st)                             * 224D9
          BINT53                                 * 224DE
          input(st,li)                           * 224E3
        ;                                        * 224E8

* obj key -> 'SKEY' ->
* ROMPTR 002 17B ASN
* refs (1): 189EA
        CON(1)  8                                * 224ED  command header: flags (meaning not yet known)
        CON(3)  #002                             * 224EE  library
        CON(3)  #17B                             * 224F1  command
xASN:
        ::                                       * 224F4
          CK2&Dispatch                           * 224F9
          BINT1                                  * 224FE
          XEQAsnKey                              * 22503
        ;                                        * 22508

* {ob key ...} -> {'S' ob key ...} -> 'S' ->
* ROMPTR 002 17C STOKEYS
* refs (1): 189EA
        CON(1)  8                                * 2250D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2250E  library
        CON(3)  #17C                             * 22511  command
xSTOKEYS:
        ::                                       * 22514
          CK1&Dispatch                           * 22519
          BINT5                                  * 2251E
          Ck&AsnUKeys                            * 22523
          BINT6                                  * 22528
          StoKeys(nm)                            * 2252D
          BINT7                                  * 22532
          StoKeys(nm)                            * 22537
        ;                                        * 2253C

* rc.p -> { rc.p ... n } -> 0 -> 'S' ->
* ROMPTR 002 17D DELKEYS
* refs (1): 189EA
        CON(1)  8                                * 22541  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22542  library
        CON(3)  #17D                             * 22545  command
xDELKEYS:
        ::                                       * 22548
          CK1&Dispatch                           * 2254D
          BINT1                                  * 22552
          Ck&ClrUKey                             * 22557
          BINT5                                  * 2255C
          XEQDelKeys                             * 22561
          BINT6                                  * 22566
          DelKeys(nm)                            * 2256B
          BINT7                                  * 22570
          DelKeys(nm)                            * 22575
        ;                                        * 2257A

* -> {ob ... key ...} -> {S ob ... key ...}
* ROMPTR 002 17E RCLKEYS
* refs (1): 189EA
        CON(1)  8                                * 2257F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 22580  library
        CON(3)  #17E                             * 22583  command
xRCLKEYS:
        ::                                       * 22586
          CK0                                    * 2258B
          XEQRclKeys                             * 22590
          NonUsrKeyOK?                           * 22595
          NOT?SEMI                               * 2259A
          '                                      * 2259F

* ID S
ID_S:
          ID      S                              * 225A4
          >HCOMP                                 * 225AD
        ;                                        * 225B2

* ob tag -> :tag:ob
* ROMPTR 002 17F →TAG
* refs (1): 189EA
        CON(1)  8                                * 225B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 225B8  library
        CON(3)  #17F                             * 225BB  command
x->TAG:
        ::                                       * 225BE
          CK2&Dispatch                           * 225C3
          BINT3                                  * 225C8
          USER$>TAG                              * 225CD
          BINT6                                  * 225D2
          ID>TAG                                 * 225D7
          BINT7                                  * 225DC
          ID>TAG                                 * 225E1
          BINT1                                  * 225E6
          %>TAG                                  * 225EB
        ;                                        * 225F0

* ob $tag -> tagged
* refs (1): 225CD
USER$>TAG:
        ::                                       * 225F5
          DUPLEN$                                * 225FA
          BINT255d                               * 225FF
          #>case                                 * 22604
          SETSIZEERR                             * 22609
          >TAG                                   * 2260E
        ;                                        * 22613

* ob % -> tagged
* refs (1): 225EB
%>TAG:
        ::                                       * 22618
          DECOMP$                                * 2261D
          >TAG                                   * 22622
        ;                                        * 22627

* tag:obj -> obj
* ROMPTR 002 180 DTAG
* refs (1): 189EA
        CON(1)  8                                * 2262C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2262D  library
        CON(3)  #180                             * 22630  command
xDTAG:
        ::                                       * 22633
          OBJ_214FB                              * 22638
        ;                                        * 2263D

LIB002.hash:
        ACPTR   L_7633B Reset                    * 22642

LIB002.link:
        CON(5)  DOHSTR                           * 22651  link table of library 002
* a branch also enters #22656, where the nibbles decode as addrslot
        LENGTH                                   * 22656  length, to #22DE0
        REL(5)  xASR                             * 2265B  000 ASR
        REL(5)  xRL                              * 22660  001 RL
        REL(5)  xRLB                             * 22665  002 RLB
        REL(5)  xRR                              * 2266A  003 RR
        REL(5)  xRRB                             * 2266F  004 RRB
        REL(5)  xSL                              * 22674  005 SL
        REL(5)  xSLB                             * 22679  006 SLB
        REL(5)  xSR                              * 2267E  007 SR
        REL(5)  xSRB                             * 22683  008 SRB
        REL(5)  xR>B                             * 22688  009 R→B
        REL(5)  xB>R                             * 2268D  00A B→R
        REL(5)  xCONVERT                         * 22692  00B CONVERT
        REL(5)  xUVAL                            * 22697  00C UVAL
        REL(5)  x>UNIT                           * 2269C  00D →UNIT
        REL(5)  xUBASE                           * 226A1  00E UBASE
        REL(5)  xUFACT                           * 226A6  00F UFACT
        REL(5)  xTIME                            * 226AB  010 TIME
        REL(5)  xDATE                            * 226B0  011 DATE
        REL(5)  xTICKS                           * 226B5  012 TICKS
        REL(5)  xWSLOG                           * 226BA  013 WSLOG
        REL(5)  xACKALL                          * 226BF  014 ACKALL
        REL(5)  xACK                             * 226C4  015 ACK
        REL(5)  xSETDATE                         * 226C9  016 →DATE
        REL(5)  xSETTIME                         * 226CE  017 →TIME
        REL(5)  xCLKADJ                          * 226D3  018 CLKADJ
        REL(5)  xSTOALARM                        * 226D8  019 STOALARM
        REL(5)  xRCLALARM                        * 226DD  01A RCLALARM
        REL(5)  xFINDALARM                       * 226E2  01B FINDALARM
        REL(5)  xDELALARM                        * 226E7  01C DELALARM
        REL(5)  xTSTR                            * 226EC  01D TSTR
        REL(5)  xDDAYS                           * 226F1  01E DDAYS
        REL(5)  xDATE+                           * 226F6  01F DATE+
        REL(5)  xCRDIR                           * 226FB  020 CRDIR
        REL(5)  xPATH                            * 22700  021 PATH
        REL(5)  xHOME                            * 22705  022 HOME
        REL(5)  xUPDIR                           * 2270A  023 UPDIR
        REL(5)  xVARS                            * 2270F  024 VARS
        REL(5)  xTVARS                           * 22714  025 TVARS
        REL(5)  xBYTES                           * 22719  026 BYTES
        REL(5)  xNEWOB                           * 2271E  027 NEWOB
        REL(5)  xKILL                            * 22723  028 KILL
        REL(5)  xOFF                             * 22728  029 OFF
        REL(5)  xDOERR                           * 2272D  02A DOERR
        REL(5)  xERR0                            * 22732  02B ERR0
        REL(5)  xERRN                            * 22737  02C ERRN
        REL(5)  xERRM                            * 2273C  02D ERRM
        REL(5)  xEVAL                            * 22741  02E EVAL
        REL(5)  xIFTE                            * 22746  02F IFTE
        REL(5)  xIFT                             * 2274B  030 IFT
        REL(5)  xSYSEVAL                         * 22750  031 SYSEVAL
        REL(5)  xDISP                            * 22755  032 DISP
        REL(5)  xFREEZE                          * 2275A  033 FREEZE
        REL(5)  xBEEP                            * 2275F  034 BEEP
        REL(5)  x>NUM                            * 22764  035 →NUM
        REL(5)  xLAST                            * 22769  036 LASTARG
        REL(5)  xWAIT                            * 2276E  037 WAIT
        REL(5)  xCLLCD                           * 22773  038 CLLCD
        REL(5)  xKEY                             * 22778  039 KEY
        REL(5)  xCONT                            * 2277D  03A CONT
        REL(5)  x=                               * 22782  03B =
        REL(5)  xNEG                             * 22787  03C NEG
        REL(5)  xABS                             * 2278C  03D ABS
        REL(5)  xCONJ                            * 22791  03E CONJ
        REL(5)  xPI                              * 22796  03F π
        REL(5)  xMAXR                            * 2279B  040 MAXR
        REL(5)  xMINR                            * 227A0  041 MINR
        REL(5)  xCONSTANTe                       * 227A5  042 e
        REL(5)  xi                               * 227AA  043 i
        REL(5)  x+                               * 227AF  044 +
        REL(5)  xNEGNEG                          * 227B4  045 
        REL(5)  x-                               * 227B9  046 -
        REL(5)  x*                               * 227BE  047 *
        REL(5)  x/                               * 227C3  048 /
        REL(5)  x^                               * 227C8  049 ^
        REL(5)  rpnXROOT                         * 227CD  04A XROOT
        REL(5)  xXROOT                           * 227D2  04B 
        REL(5)  xINV                             * 227D7  04C INV
        REL(5)  xARG                             * 227DC  04D ARG
        REL(5)  xSIGN                            * 227E1  04E SIGN
        REL(5)  xSQRT                            * 227E6  04F √
        REL(5)  xSQ                              * 227EB  050 SQ
        REL(5)  xSIN                             * 227F0  051 SIN
        REL(5)  xCOS                             * 227F5  052 COS
        REL(5)  xTAN                             * 227FA  053 TAN
        REL(5)  xSINH                            * 227FF  054 SINH
        REL(5)  xCOSH                            * 22804  055 COSH
        REL(5)  xTANH                            * 22809  056 TANH
        REL(5)  xASIN                            * 2280E  057 ASIN
        REL(5)  xACOS                            * 22813  058 ACOS
        REL(5)  xATAN                            * 22818  059 ATAN
        REL(5)  xASINH                           * 2281D  05A ASINH
        REL(5)  xACOSH                           * 22822  05B ACOSH
        REL(5)  xATANH                           * 22827  05C ATANH
        REL(5)  xEXP                             * 2282C  05D EXP
        REL(5)  xLN                              * 22831  05E LN
        REL(5)  xLOG                             * 22836  05F LOG
        REL(5)  xALOG                            * 2283B  060 ALOG
        REL(5)  xLNP1                            * 22840  061 LNP1
        REL(5)  xEXPM                            * 22845  062 EXPM
        REL(5)  xFACT                            * 2284A  063 !
        REL(5)  preFACT                          * 2284F  064 FACT
        REL(5)  xIP                              * 22854  065 IP
        REL(5)  xFP                              * 22859  066 FP
        REL(5)  xFLOOR                           * 2285E  067 FLOOR
        REL(5)  xCEIL                            * 22863  068 CEIL
        REL(5)  xXPON                            * 22868  069 XPON
        REL(5)  xMAX                             * 2286D  06A MAX
        REL(5)  xMIN                             * 22872  06B MIN
        REL(5)  xRND                             * 22877  06C RND
        REL(5)  xTRNC                            * 2287C  06D TRNC
        REL(5)  xMOD                             * 22881  06E MOD
        REL(5)  xMANT                            * 22886  06F MANT
        REL(5)  xD>R                             * 2288B  070 D→R
        REL(5)  xR>D                             * 22890  071 R→D
        REL(5)  x>HMS                            * 22895  072 →HMS
        REL(5)  xHMS>                            * 2289A  073 HMS→
        REL(5)  xHMS+                            * 2289F  074 HMS+
        REL(5)  xHMS-                            * 228A4  075 HMS-
        REL(5)  xRNRM                            * 228A9  076 RNRM
        REL(5)  xCNRM                            * 228AE  077 CNRM
        REL(5)  xDET                             * 228B3  078 DET
        REL(5)  xDOT                             * 228B8  079 DOT
        REL(5)  xCROSS                           * 228BD  07A CROSS
        REL(5)  xRSD                             * 228C2  07B RSD
        REL(5)  x%                               * 228C7  07C %
        REL(5)  x%T                              * 228CC  07D %T
        REL(5)  x%CH                             * 228D1  07E %CH
        REL(5)  xRAND                            * 228D6  07F RAND
        REL(5)  xRDZ                             * 228DB  080 RDZ
        REL(5)  xCOMB                            * 228E0  081 COMB
        REL(5)  xPERM                            * 228E5  082 PERM
        REL(5)  xSF                              * 228EA  083 SF
        REL(5)  xCF                              * 228EF  084 CF
        REL(5)  xFS?                             * 228F4  085 FS?
        REL(5)  xFC?                             * 228F9  086 FC?
        REL(5)  xDEG                             * 228FE  087 DEG
        REL(5)  xRAD                             * 22903  088 RAD
        REL(5)  xGRAD                            * 22908  089 GRAD
        REL(5)  xFIX                             * 2290D  08A FIX
        REL(5)  xSCI                             * 22912  08B SCI
        REL(5)  xENG                             * 22917  08C ENG
        REL(5)  xSTD                             * 2291C  08D STD
        REL(5)  xFS?C                            * 22921  08E FS?C
        REL(5)  xFC?C                            * 22926  08F FC?C
        REL(5)  xBIN                             * 2292B  090 BIN
        REL(5)  xDEC                             * 22930  091 DEC
        REL(5)  xHEX                             * 22935  092 HEX
        REL(5)  xOCT                             * 2293A  093 OCT
        REL(5)  xSTWS                            * 2293F  094 STWS
        REL(5)  xRCWS                            * 22944  095 RCWS
        REL(5)  xRCLF                            * 22949  096 RCLF
        REL(5)  xSTOF                            * 2294E  097 STOF
        REL(5)  x>LIST                           * 22953  098 →LIST
        REL(5)  xR>C                             * 22958  099 R→C
        REL(5)  xRE                              * 2295D  09A RE
        REL(5)  xIM                              * 22962  09B IM
        REL(5)  xSUB                             * 22967  09C SUB
        REL(5)  xREPL                            * 2296C  09D REPL
        REL(5)  xLIST>                           * 22971  09E LIST→
        REL(5)  xC>R                             * 22976  09F C→R
        REL(5)  xSIZE                            * 2297B  0A0 SIZE
        REL(5)  xPOS                             * 22980  0A1 POS
        REL(5)  x>STR                            * 22985  0A2 →STR
        REL(5)  xSTR>                            * 2298A  0A3 STR→
        REL(5)  xNUM                             * 2298F  0A4 NUM
        REL(5)  xCHR                             * 22994  0A5 CHR
        REL(5)  xTYPE                            * 22999  0A6 TYPE
        REL(5)  xVTYPE                           * 2299E  0A7 VTYPE
        REL(5)  xEQ>                             * 229A3  0A8 EQ→
        REL(5)  xOBJ>                            * 229A8  0A9 OBJ→
        REL(5)  x>ARRY                           * 229AD  0AA →ARRY
        REL(5)  xARRY>                           * 229B2  0AB ARRY→
        REL(5)  xRDM                             * 229B7  0AC RDM
        REL(5)  xCON                             * 229BC  0AD CON
        REL(5)  xIDN                             * 229C1  0AE IDN
        REL(5)  xTRN                             * 229C6  0AF TRN
        REL(5)  xPUT                             * 229CB  0B0 PUT
        REL(5)  xPUTI                            * 229D0  0B1 PUTI
        REL(5)  xGET                             * 229D5  0B2 GET
        REL(5)  xGETI                            * 229DA  0B3 GETI
        REL(5)  xV>                              * 229DF  0B4 V→
        REL(5)  x>V2                             * 229E4  0B5 →V2
        REL(5)  x>V3                             * 229E9  0B6 →V3
        REL(5)  xINDEP                           * 229EE  0B7 INDEP
        REL(5)  xPMIN                            * 229F3  0B8 PMIN
        REL(5)  xPMAX                            * 229F8  0B9 PMAX
        REL(5)  xAXES                            * 229FD  0BA AXES
        REL(5)  xCENTR                           * 22A02  0BB CENTR
        REL(5)  xRES                             * 22A07  0BC RES
        REL(5)  x*H                              * 22A0C  0BD *H
        REL(5)  x*W                              * 22A11  0BE *W
        REL(5)  xDRAW                            * 22A16  0BF DRAW
        REL(5)  xAUTO                            * 22A1B  0C0 AUTO
        REL(5)  xDRAX                            * 22A20  0C1 DRAX
        REL(5)  xSCALE                           * 22A25  0C2 SCALE
        REL(5)  xPDIM                            * 22A2A  0C3 PDIM
        REL(5)  xDEPND                           * 22A2F  0C4 DEPND
        REL(5)  xERASE                           * 22A34  0C5 ERASE
        REL(5)  xPX>C                            * 22A39  0C6 PX→C
        REL(5)  xC>PX                            * 22A3E  0C7 C→PX
        REL(5)  xGRAPH                           * 22A43  0C8 PICTURE
        REL(5)  xLABEL                           * 22A48  0C9 LABEL
        REL(5)  xPVIEW                           * 22A4D  0CA PVIEW
        REL(5)  xPIXON                           * 22A52  0CB PIXON
        REL(5)  xPIXOFF                          * 22A57  0CC PIXOFF
        REL(5)  xPIX?                            * 22A5C  0CD PIX?
        REL(5)  xLINE                            * 22A61  0CE LINE
        REL(5)  xTLINE                           * 22A66  0CF TLINE
        REL(5)  xBOX                             * 22A6B  0D0 BOX
        REL(5)  xBLANK                           * 22A70  0D1 BLANK
        REL(5)  xPICT                            * 22A75  0D2 PICT
        REL(5)  xGOR                             * 22A7A  0D3 GOR
        REL(5)  xGXOR                            * 22A7F  0D4 GXOR
        REL(5)  xLCD>                            * 22A84  0D5 LCD→
        REL(5)  x>LCD                            * 22A89  0D6 →LCD
        REL(5)  x>GROB                           * 22A8E  0D7 →GROB
        REL(5)  xARC                             * 22A93  0D8 ARC
        REL(5)  xTEXT                            * 22A98  0D9 TEXT
        REL(5)  xXRNG                            * 22A9D  0DA XRNG
        REL(5)  xYRNG                            * 22AA2  0DB YRNG
        REL(5)  xFUNCTION                        * 22AA7  0DC FUNCTION
        REL(5)  xCONIC                           * 22AAC  0DD CONIC
        REL(5)  POLAR                            * 22AB1  0DE POLAR
        REL(5)  xPARAMETRIC                      * 22AB6  0DF PARAMETRIC
        REL(5)  xTRUTH                           * 22ABB  0E0 TRUTH
        REL(5)  xSCATTER                         * 22AC0  0E1 SCATTER
        REL(5)  xHISTOGRAM                       * 22AC5  0E2 HISTOGRAM
        REL(5)  xBAR                             * 22ACA  0E3 BAR
        REL(5)  xSAME                            * 22ACF  0E4 SAME
        REL(5)  xAND                             * 22AD4  0E5 AND
        REL(5)  xOR                              * 22AD9  0E6 OR
        REL(5)  xNOT                             * 22ADE  0E7 NOT
        REL(5)  xXOR                             * 22AE3  0E8 XOR
        REL(5)  x==                              * 22AE8  0E9 ==
        REL(5)  x#?                              * 22AED  0EA ≠
        REL(5)  x<                               * 22AF2  0EB <
        REL(5)  x>                               * 22AF7  0EC >
        REL(5)  x<=?                             * 22AFC  0ED ≤
        REL(5)  x>=?                             * 22B01  0EE ≥
        REL(5)  xOLDPRT                          * 22B06  0EF OLDPRT
        REL(5)  xPR1                             * 22B0B  0F0 PR1
        REL(5)  xPRSTC                           * 22B10  0F1 PRSTC
        REL(5)  xPRST                            * 22B15  0F2 PRST
        REL(5)  xCR                              * 22B1A  0F3 CR
        REL(5)  xPRVAR                           * 22B1F  0F4 PRVAR
        REL(5)  xDELAY                           * 22B24  0F5 DELAY
        REL(5)  xPRLCD                           * 22B29  0F6 PRLCD
        REL(5)  DERIV                            * 22B2E  0F7 ∂
        REL(5)  xDER                             * 22B33  0F8 
        REL(5)  xRCEQ                            * 22B38  0F9 RCEQ
        REL(5)  xSTEQ                            * 22B3D  0FA STEQ
        REL(5)  xROOT                            * 22B42  0FB ROOT
        REL(5)  INTEG                            * 22B47  0FC ∫
        REL(5)  xINTEGRAL                        * 22B4C  0FD 
        REL(5)  ä                                * 22B51  0FE Σ
        REL(5)  WHERE                            * 22B56  0FF |
        REL(5)  xWHERE                           * 22B5B  100 
        REL(5)  xQUOTE                           * 22B60  101 QUOTE
        REL(5)  APPLY                            * 22B65  102 APPLY
        REL(5)  xAPPLY                           * 22B6A  103 
        REL(5)  xFCNAPPLY                        * 22B6F  104 
        REL(5)  ROMP_002_105                     * 22B74  105 
        REL(5)  ROMP_002_106                     * 22B79  106 
        REL(5)  x->Q                             * 22B7E  107 →Q
        REL(5)  x->QPI                           * 22B83  108 →Qπ
        REL(5)  xMATCHUP                         * 22B88  109 ↑MATCH
        REL(5)  xMATCHDN                         * 22B8D  10A ↓MATCH
        REL(5)  xFORMUNIT                        * 22B92  10B _
        REL(5)  xPREDIV                          * 22B97  10C RATIO
        REL(5)  xDUP                             * 22B9C  10D DUP
        REL(5)  xDUP2                            * 22BA1  10E DUP2
        REL(5)  xSWAP                            * 22BA6  10F SWAP
        REL(5)  xDROP                            * 22BAB  110 DROP
        REL(5)  xDROP2                           * 22BB0  111 DROP2
        REL(5)  xROT                             * 22BB5  112 ROT
        REL(5)  xOVER                            * 22BBA  113 OVER
        REL(5)  xDEPTH                           * 22BBF  114 DEPTH
        REL(5)  xDROPN                           * 22BC4  115 DROPN
        REL(5)  xDUPN                            * 22BC9  116 DUPN
        REL(5)  xPICK                            * 22BCE  117 PICK
        REL(5)  xROLL                            * 22BD3  118 ROLL
        REL(5)  xROLLD                           * 22BD8  119 ROLLD
        REL(5)  xCLEAR                           * 22BDD  11A CLEAR
        REL(5)  xSTOSIGMA                        * 22BE2  11B STOΣ
        REL(5)  xCLSIGMA                         * 22BE7  11C CLΣ
        REL(5)  xRCLSIGMA                        * 22BEC  11D RCLΣ
        REL(5)  xSIGMA+                          * 22BF1  11E Σ+
        REL(5)  xSIGMA-                          * 22BF6  11F Σ-
        REL(5)  xNSIGMA                          * 22BFB  120 NΣ
        REL(5)  xCORR                            * 22C00  121 CORR
        REL(5)  xCOV                             * 22C05  122 COV
        REL(5)  äX                               * 22C0A  123 ΣX
        REL(5)  xSUMY                            * 22C0F  124 ΣY
        REL(5)  xSUMX2                           * 22C14  125 ΣX^2
        REL(5)  xSUMY2                           * 22C19  126 ΣY^2
        REL(5)  xSUMXY                           * 22C1E  127 ΣX*Y
        REL(5)  xMAXSIGMA                        * 22C23  128 MAXΣ
        REL(5)  xMEAN                            * 22C28  129 MEAN
        REL(5)  xMINSIGMA                        * 22C2D  12A MINΣ
        REL(5)  xSDEV                            * 22C32  12B SDEV
        REL(5)  xTOT                             * 22C37  12C TOT
        REL(5)  xVAR                             * 22C3C  12D VAR
        REL(5)  xLR                              * 22C41  12E LR
        REL(5)  xPREDV                           * 22C46  12F PREDV
        REL(5)  xPREDY                           * 22C4B  130 PREDY
        REL(5)  xPREDX                           * 22C50  131 PREDX
        REL(5)  xXCOL                            * 22C55  132 XCOL
        REL(5)  xYCOL                            * 22C5A  133 YCOL
        REL(5)  xUTPC                            * 22C5F  134 UTPC
        REL(5)  xUTPN                            * 22C64  135 UTPN
        REL(5)  xUTPF                            * 22C69  136 UTPF
        REL(5)  xUTPT                            * 22C6E  137 UTPT
        REL(5)  xSIGMACOL                        * 22C73  138 COLΣ
        REL(5)  xSCLSIGMA                        * 22C78  139 SCLΣ
        REL(5)  xSIGMALINE                       * 22C7D  13A ΣLINE
        REL(5)  xBINS                            * 22C82  13B BINS
        REL(5)  xBARPLOT                         * 22C87  13C BARPLOT
        REL(5)  xHISTPLOT                        * 22C8C  13D HISTPLOT
        REL(5)  xSCATRPLOT                       * 22C91  13E SCATRPLOT
        REL(5)  xLINFIT                          * 22C96  13F LINFIT
        REL(5)  xLOGFIT                          * 22C9B  140 LOGFIT
        REL(5)  xEXPFIT                          * 22CA0  141 EXPFIT
        REL(5)  xPWRFIT                          * 22CA5  142 PWRFIT
        REL(5)  xBESTFIT                         * 22CAA  143 BESTFIT
        REL(5)  xSINV                            * 22CAF  144 SINV
        REL(5)  xSNEG                            * 22CB4  145 SNEG
        REL(5)  xSCONJ                           * 22CB9  146 SCONJ
        REL(5)  xSTO+                            * 22CBE  147 STO+
        REL(5)  xSTO-                            * 22CC3  148 STO-
        REL(5)  xSTO/                            * 22CC8  149 STO/
        REL(5)  xSTO*                            * 22CCD  14A STO*
        REL(5)  xINCR                            * 22CD2  14B INCR
        REL(5)  xDECR                            * 22CD7  14C DECR
        REL(5)  xCOLCT                           * 22CDC  14D COLCT
        REL(5)  xEXPAN                           * 22CE1  14E EXPAN
        REL(5)  xRULES                           * 22CE6  14F RULES
        REL(5)  xISOL                            * 22CEB  150 ISOL
        REL(5)  xQUAD                            * 22CF0  151 QUAD
        REL(5)  xSHOW                            * 22CF5  152 SHOW
        REL(5)  xTAYLR                           * 22CFA  153 TAYLR
        REL(5)  xRCL                             * 22CFF  154 RCL
        REL(5)  xSTO                             * 22D04  155 STO
        REL(5)  xDEFINE                          * 22D09  156 DEFINE
        REL(5)  xPURGE                           * 22D0E  157 PURGE
        REL(5)  xMEM                             * 22D13  158 MEM
        REL(5)  xORDER                           * 22D18  159 ORDER
        REL(5)  xCLUSR                           * 22D1D  15A CLVAR
        REL(5)  xTMENU                           * 22D22  15B TMENU
        REL(5)  xMENU                            * 22D27  15C MENU
        REL(5)  xRCLMENU                         * 22D2C  15D RCLMENU
        REL(5)  xPVARS                           * 22D31  15E PVARS
        REL(5)  xPGDIR                           * 22D36  15F PGDIR
        REL(5)  xARCHIVE                         * 22D3B  160 ARCHIVE
        REL(5)  xRESTORE                         * 22D40  161 RESTORE
        REL(5)  xMERGE                           * 22D45  162 MERGE
        REL(5)  xFREE                            * 22D4A  163 FREE
        REL(5)  xLIBS                            * 22D4F  164 LIBS
        REL(5)  xATTACH                          * 22D54  165 ATTACH
        REL(5)  xDETACH                          * 22D59  166 DETACH
        REL(5)  xXMIT                            * 22D5E  167 XMIT
        REL(5)  xSRECV                           * 22D63  168 SRECV
        REL(5)  xOPENIO                          * 22D68  169 OPENIO
        REL(5)  xCLOSEIO                         * 22D6D  16A CLOSEIO
        REL(5)  xSEND                            * 22D72  16B SEND
        REL(5)  xKGET                            * 22D77  16C KGET
        REL(5)  xRECN                            * 22D7C  16D RECN
        REL(5)  xRECV                            * 22D81  16E RECV
        REL(5)  xFINISH                          * 22D86  16F FINISH
        REL(5)  xSERVER                          * 22D8B  170 SERVER
        REL(5)  xCKSM                            * 22D90  171 CKSM
        REL(5)  xBAUD                            * 22D95  172 BAUD
        REL(5)  xPARITY                          * 22D9A  173 PARITY
        REL(5)  xTRANSIO                         * 22D9F  174 TRANSIO
        REL(5)  xKERRM                           * 22DA4  175 KERRM
        REL(5)  xBUFLEN                          * 22DA9  176 BUFLEN
        REL(5)  xSTIME                           * 22DAE  177 STIME
        REL(5)  xSBRK                            * 22DB3  178 SBRK
        REL(5)  xPKT                             * 22DB8  179 PKT
        REL(5)  xINPUT                           * 22DBD  17A INPUT
        REL(5)  xASN                             * 22DC2  17B ASN
        REL(5)  xSTOKEYS                         * 22DC7  17C STOKEYS
        REL(5)  xDELKEYS                         * 22DCC  17D DELKEYS
        REL(5)  xRCLKEYS                         * 22DD1  17E RCLKEYS
        REL(5)  x->TAG                           * 22DD6  17F →TAG
        REL(5)  xDTAG                            * 22DDB  180 DTAG
        ENDLENGTH                                * 22DE0
        ASSEMBLE
        A=B-A   A                                * 22DE0
        CSR     A                                * 22DE2
        RTNSXM                                   * 22DE4
        NIBHEX  0                                * 22DE6

LIB700:
        CON(3)  #700                             * 22DE7  library number
        REL(5)  LIB700.hash                      * 22DEA  hash table
        CON(5)  0                                * 22DEF  message table
        REL(5)  LIB700.link                      * 22DF4  link table
        REL(5)  LIB700.config                    * 22DF9  config
        RPL

LIB700.hash:
        ACPTR   L_7612D Reset                    * 22DFE

LIB700.link:
        CON(5)  DOHSTR                           * 22E0D  link table of library 700
        LENGTH                                   * 22E12  length, to #22EA8
        REL(5)  xIF                              * 22E17  000 IF
        REL(5)  xTHEN                            * 22E1C  001 THEN
        REL(5)  xELSE                            * 22E21  002 ELSE
        REL(5)  xIFEND                           * 22E26  003 END
        REL(5)  xALG->                           * 22E2B  004 →
        REL(5)  xWHILE                           * 22E30  005 WHILE
        REL(5)  xREPEAT                          * 22E35  006 REPEAT
        REL(5)  xDO                              * 22E3A  007 DO
        REL(5)  xUNTIL                           * 22E3F  008 UNTIL
        REL(5)  xSTART                           * 22E44  009 START
        REL(5)  xSTARTVAR                        * 22E49  00A FOR
        REL(5)  xNEXT                            * 22E4E  00B NEXT
        REL(5)  xSTEP                            * 22E53  00C STEP
        REL(5)  xIFERR                           * 22E58  00D IFERR
        REL(5)  xHALT                            * 22E5D  00E HALT
        REL(5)  xSILENT'                         * 22E62  00F 
        REL(5)  xRPN->                           * 22E67  010 
        REL(5)  x>>ABND                          * 22E6C  011 »
        REL(5)  x<<                              * 22E71  012 «
        REL(5)  x>>                              * 22E76  013 
        REL(5)  x'                               * 22E7B  014 '
        REL(5)  xENDTIC                          * 22E80  015 
        REL(5)  xWHILEEND                        * 22E85  016 
        REL(5)  xENDDO                           * 22E8A  017 
        REL(5)  xERRTHEN                         * 22E8F  018 
        REL(5)  xCASE                            * 22E94  019 CASE
        REL(5)  xTHENCASE                        * 22E99  01A 
        REL(5)  xDIR                             * 22E9E  01B XLIB
        REL(5)  xPROMPT                          * 22EA3  01C PROMPT
        ENDLENGTH                                * 22EA8
        BSS     20                               * 22EA8

* ->
* ROMPTR 700 000 IF
* refs (12): 22DE7 23BDC C595C C597F D3BBF D3C0B ...
        CON(1)  5                                * 22EBC  command header: flags (meaning not yet known)
        CON(3)  #700                             * 22EBD  library
        CON(3)  #000                             * 22EC0  command
xIF:
        ::                                       * 22EC3
          CK0ATTNABORT                           * 22EC8
        ;                                        * 22ECD

* slots of 700 000 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23BD2                        * 22ED2  slot 0

_IF-prompt_:
        $       "IF-prompt"                      * 22ED7  slot 1

* 0/1 ->
* ROMPTR 700 001 THEN
* refs (14): 14C5D 22DE7 22F5E 23C31 C5957 C597A ...
        CON(1)  10                               * 22EF3  command header: flags (meaning not yet known)
        CON(3)  #700                             * 22EF4  library
        CON(3)  #001                             * 22EF7  command
xTHEN:
        ::                                       * 22EFA
          CK1&Dispatch                           * 22EFF
          BINT1                                  * 22F04
          then(r)                                * 22F09
          BINT10                                 * 22F0E
          then(ex)                               * 22F13
        ;                                        * 22F18

* slots of 700 001 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_14C30                        * 22F1D  slot 0

* refs (1): 22F09
then(r):
        ::                                       * 22F22  slot 1
          j%0=case                               * 22F27
          OBJ_22F3B                              * 22F2C
          OBJ_4241B                              * 22F31
        ;                                        * 22F36

* refs (3): 22F2C 237DF 5E050
OBJ_22F3B:
        ::                                       * 22F3B  slot 2
          RSKIP                                  * 22F40
          COLASKIP                               * 22F45
        ;                                        * 22F4A

* refs (1): 22F13
then(ex):
        ::                                       * 22F4F  slot 3
          SYMCRUNCH1                             * 22F54
          COLA                                   * 22F59
          xTHEN                                  * 22F5E
        ;                                        * 22F63

* ob -> %
* refs (9): 22F54 22F95 230A8 2316C 23218 233AD ...
SYMCRUNCH1:
        ::                                       * 22F68  slot 4
          DUPTYPEIDNT?                           * 22F6D
          IT                                     * 22F72
          XEQRCL                                 * 22F77
          CRUNCH                                 * 22F7C
        ;                                        * 22F81

* ob1 ob2 -> % ob2
* refs (4): 1A518 23185 23231 5691C
SYMCRUNCH2:
        ::                                       * 22F86  slot 5
          SWAP                                   * 22F8B
          CK1NOLASTWD                            * 22F90
          SYMCRUNCH1                             * 22F95
          DEPTH                                  * 22F9A
          #>1                                    * 22F9F
          ?SWAP                                  * 22FA4
        ;                                        * 22FA9

* ->
* ROMPTR 700 002 ELSE
* refs (8): 22DE7 23C9F 2412C C5975 C5E34 D3CE8 ...
        CON(1)  10                               * 22FAE  command header: flags (meaning not yet known)
        CON(3)  #700                             * 22FAF  library
        CON(3)  #002                             * 22FB2  command
xELSE:
        ::                                       * 22FB5
          CK0                                    * 22FBA
          COLASKIP                               * 22FBF
        ;                                        * 22FC4

* slots of 700 002 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_14C71                        * 22FC9  slot 0

* ROMPTR 700 003 END
* refs (24): 1487A 14CCB 22DE7 23B0A 23B87 23CFE ...
        CON(1)  3                                * 22FCE  command header: flags (meaning not yet known)
        CON(3)  #700                             * 22FCF  library
        CON(3)  #003                             * 22FD2  command
xIFEND:
        ::                                       * 22FD5
          CK0ATTNABORT                           * 22FDA
        ;                                        * 22FDF

* ROMPTR 700 004 →
* refs (5): 22DE7 24253 5DF0D 8C1B8 D184B
        CON(1)  8                                * 22FE4  command header: flags (meaning not yet known)
        CON(3)  #700                             * 22FE5  library
        CON(3)  #004                             * 22FE8  command
xALG->:
        ::                                       * 22FEB
          CK0ATTNABORT                           * 22FF0
          OBJ_23502                              * 22FF5
          DEPTH                                  * 22FFA
          OVER                                   * 22FFF
          #2*                                    * 23004
          #>case                                 * 23009
          OBJ_54693                              * 2300E
          NDROP                                  * 23013
          SETSTACKERR                            * 23018
        ;                                        * 2301D

* slots of 700 004 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_2419A                        * 23022  slot 0
        CON(5)  OBJ_14A55                        * 23027  slot 1

* ->
* ROMPTR 700 005 WHILE
* refs (3): 22DE7 23F83 C5BFD
        CON(1)  9                                * 2302C  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2302D  library
        CON(3)  #005                             * 23030  command
xWHILE:
        ::                                       * 23033
          CK0ATTNABORT                           * 23038
          COLA                                   * 2303D
          BEGIN                                  * 23042
        ;                                        * 23047

* slots of 700 005 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23F79                        * 2304C  slot 0
        CON(5)  OBJ_148F2                        * 23051  slot 1

* 1/0 ->
* ROMPTR 700 006 REPEAT
* refs (5): 14956 22DE7 230B2 23FD8 C5BF8
        CON(1)  10                               * 23056  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23057  library
        CON(3)  #006                             * 2305A  command
xREPEAT:
        ::                                       * 2305D
          CK1&Dispatch                           * 23062
          BINT1                                  * 23067
          repeat(r)                              * 2306C
          BINT10                                 * 23071
          repeat(ex)                             * 23076
        ;                                        * 2307B

* slots of 700 006 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_1494C                        * 23080  slot 0

* refs (1): 2306C
repeat(r):
        ::                                       * 23085  slot 1
          OBJ_4241B                              * 2308A
          %0<>                                   * 2308F
          COLA                                   * 23094
          WHILE                                  * 23099
        ;                                        * 2309E

* refs (1): 23076
repeat(ex):
        ::                                       * 230A3  slot 2
          SYMCRUNCH1                             * 230A8
          COLA                                   * 230AD
          xREPEAT                                * 230B2
        ;                                        * 230B7

* ->
* ROMPTR 700 007 DO
* refs (3): 22DE7 23D17 C5B89
        CON(1)  9                                * 230BC  command header: flags (meaning not yet known)
        CON(3)  #700                             * 230BD  library
        CON(3)  #007                             * 230C0  command
xDO:
        ::                                       * 230C3
          CK0ATTNABORT                           * 230C8
          COLA                                   * 230CD
          BEGIN                                  * 230D2
        ;                                        * 230D7

* slots of 700 007 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23D0D                        * 230DC  slot 0
        CON(5)  OBJ_148F2                        * 230E1  slot 1

* ->
* ROMPTR 700 008 UNTIL
* refs (3): 22DE7 23D6C C5B84
        CON(1)  2                                * 230E6  command header: flags (meaning not yet known)
        CON(3)  #700                             * 230E7  library
        CON(3)  #008                             * 230EA  command
xUNTIL:
        ::                                       * 230ED
          CK0ATTNABORT                           * 230F2
        ;                                        * 230F7

* start finish ->
* ROMPTR 700 009 START
* refs (9): 14AF0 22DE7 23176 2318F 23E89 C5A7E ...
        CON(1)  9                                * 230FC  command header: flags (meaning not yet known)
        CON(3)  #700                             * 230FD  library
        CON(3)  #009                             * 23100  command
xSTART:
        ::                                       * 23103
          CK2&Dispatch                           * 23108
          BINT17                                 * 2310D
          start(2r)                              * 23112
          BINT26                                 * 23117
          start(2ex)                             * 2311C
          SYMREAL                                * 23121
          start(ex,r)                            * 23126
          SYMSYM                                 * 2312B
          start(2ex)                             * 23130
        ;                                        * 23135

* slots of 700 009 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23E7F                        * 2313A  slot 0
        CON(5)  OBJ_14AE6                        * 2313F  slot 1

* refs (1): 23112
start(2r):
        ::                                       * 23144  slot 2
          OBJ_23754                              * 23149
          BIND                                   * 2314E
          OBJ_4241B                              * 23153
          COLA                                   * 23158
          BEGIN                                  * 2315D
        ;                                        * 23162

* refs (2): 2311C 23130
start(2ex):
        ::                                       * 23167  slot 3
          SYMCRUNCH1                             * 2316C
          COLA                                   * 23171
          xSTART                                 * 23176
        ;                                        * 2317B

* refs (1): 23126
start(ex,r):
        ::                                       * 23180  slot 4
          SYMCRUNCH2                             * 23185
          COLA                                   * 2318A
          xSTART                                 * 2318F
        ;                                        * 23194

* start finish ->
* ROMPTR 700 00A FOR
* refs (9): 22DE7 23222 2323B 23EB6 C5B02 C5B1B ...
        CON(1)  9                                * 23199  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2319A  library
        CON(3)  #00A                             * 2319D  command
xSTARTVAR:
        ::                                       * 231A0
          CK2&Dispatch                           * 231A5
          BINT17                                 * 231AA
          for(2r)                                * 231AF
          BINT26                                 * 231B4
          for(2ex)                               * 231B9
          SYMREAL                                * 231BE
          for(ex,r)                              * 231C3
          SYMSYM                                 * 231C8
          for(2ex)                               * 231CD
        ;                                        * 231D2

* slots of 700 00A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23E9D                        * 231D7  slot 0
        CON(5)  OBJ_14B13                        * 231DC  slot 1

* refs (1): 231AF
for(2r):
        ::                                       * 231E1  slot 2
          'R                                     * 231E6
          '                                      * 231EB
          Π'stop                                 * 231F0
          TWO{}N                                 * 231F5
          BIND                                   * 231FA
          OBJ_4241B                              * 231FF
          COLA                                   * 23204
          BEGIN                                  * 23209
        ;                                        * 2320E

* refs (2): 231B9 231CD
for(2ex):
        ::                                       * 23213  slot 3
          SYMCRUNCH1                             * 23218
          COLA                                   * 2321D
          xSTARTVAR                              * 23222
        ;                                        * 23227

* refs (1): 231C3
for(ex,r):
        ::                                       * 2322C  slot 4
          SYMCRUNCH2                             * 23231
          COLA                                   * 23236
          xSTARTVAR                              * 2323B
        ;                                        * 23240

* ->
* ROMPTR 700 00B NEXT
* refs (10): 22DE7 23F51 56B7D C5A79 C5AFD D3C4B ...
        CON(1)  11                               * 23245  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23246  library
        CON(3)  #00B                             * 23249  command
xNEXT:
        ::                                       * 2324C
          CK0                                    * 23251
          COLA                                   * 23256
          next_2326A                             * 2325B
        ;                                        * 23260
        NIBHEX  27B41                            * 23265  rK

* refs (1): 2325B
next_2326A:
        CON(5)  (*)+5                            * 2326A  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 2326F
        SETDEC                                   * 23276
        A=0     W                                * 23278
        B=0     W                                * 2327B
        P=      14                               * 2327E

STEP:
        B=B+1   P                                * 23280
L_23283:
        D1=(5)  TEMPENV                          * 23283
        C=DAT1  A                                * 2328A
        D1=C                                     * 2328D
        RSTK=C                                   * 23290
        D1=D1+  15                               * 23292
        D1=D1+  10                               * 23295
        C=DAT1  A                                * 23298
        D0=C                                     * 2329B
        C=DAT0  A                                * 2329E
        D=C     A                                * 232A1
        P=      0                                * 232A3
        LC(5)   DOREAL                           * 232A5
        ?D=C    A                                * 232AC
        GOYES   L_232C7                          * 232AF
        SETHEX                                   * 232B1
        GOSBVL  GETPTR                           * 232B3
        LC(5)   SETTYPEERR                       * 232BA

step(r):
        A=C     A                                * 232C1
        PC=(A)                                   * 232C3
L_232C7:
        P=      14                               * 232C7
        D0=D0+  5                                * 232C9
        C=DAT0  W                                * 232CC
        GOSBVL  SUB_2BCAC                        * 232D0
        ST=0    0                                * 232D7
        ?A=0    S                                * 232DA
        GOYES   L_232E2                          * 232DD

IFERR:
        ST=1    0                                * 232DF
L_232E2:
        GOSBVL  RADDF                            * 232E2
        D1=D1-  10                               * 232E9
        C=DAT1  A                                * 232EC
        D0=C                                     * 232EF
        D0=D0+  5                                * 232F2
        C=DAT0  W                                * 232F5
        GOSBVL  SUB_2BCAC                        * 232F9
        P=      4                                * 23300
        ?ST=0   0                                * 23302
        GOYES   L_23309                          * 23305
        P=      1                                * 23307
L_23309:
        GOSBVL  TST15                            * 23309
        GOC     L_23356                          * 23310
        GOSBVL  PACK                             * 23313
        GOSBVL  PUSH%                            * 2331A
        D1=D1+  5                                * 23321
        D=D+1   A                                * 23324
        C=RSTK                                   * 23326
        CD1EX                                    * 23328
        RSTK=C                                   * 2332B
        D1=D1+  15                               * 2332D
        D1=D1+  10                               * 23330
        DAT1=A  A                                * 23333
        C=B     A                                * 23336
        CD0EX                                    * 23338
        D0=D0-  5                                * 2333B
        A=DAT0  A                                * 2333E
        D0=A                                     * 23341
        C=RSTK                                   * 23344
        D1=C                                     * 23346
        LC(5)   OBJ_4241B                        * 23349
        A=C     A                                * 23350
        PC=(A)                                   * 23352
L_23356:
        P=      0                                * 23356
        SETHEX                                   * 23358
        GOSBVL  GETPTR                           * 2335A
        LC(5)   #00005                           * 23361
        B=B-C   A                                * 23368
        D=D+1   A                                * 2336A
        LC(5)   ABND                             * 2336C
        A=C     A                                * 23373
        PC=(A)                                   * 23375

* n -> symb ->
* ROMPTR 700 00C STEP
* refs (5): 22DE7 233B7 23F6A C5A92 C5B16
        CON(1)  11                               * 23379  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2337A  library
        CON(3)  #00C                             * 2337D  command
        RPL
xSTEP:
        ::                                       * 23380
          CK1&Dispatch                           * 23385
          BINT1                                  * 2338A
          OBJ_233C1                              * 2338F
          BINT10                                 * 23394
          OBJ_233A8                              * 23399
        ;                                        * 2339E
        NIBHEX  27B41                            * 233A3  rK

* refs (1): 23399
OBJ_233A8:
        ::                                       * 233A8
          SYMCRUNCH1                             * 233AD
          COLA                                   * 233B2
          xSTEP                                  * 233B7
        ;                                        * 233BC

* refs (1): 2338F
OBJ_233C1:
        CON(5)  (*)+5                            * 233C1  primitive code object
        ASSEMBLE
        GOSBVL  POP1%                            * 233C6
        GOSBVL  SPLITA                           * 233CD
        GOTO    L_23283                          * 233D4

* ->
* ROMPTR 700 00D IFERR
* refs (6): 22DE7 24050 2DD92 C5E1B C5E3E D3E42
        CON(1)  9                                * 233D8  command header: flags (meaning not yet known)
        CON(3)  #700                             * 233D9  library
        CON(3)  #00D                             * 233DC  command
        RPL
xIFERR:
        ::                                       * 233DF
          CK0                                    * 233E4
          'R                                     * 233E9
          ERRSET                                 * 233EE
          EVAL                                   * 233F3
          ERRTRAP                                * 233F8
          ::                                     * 233FD
            OBJ_387BE                            * 23402
            Sig?ErrJmp                           * 23407
            OBJ_3881D                            * 2340C
            RDROP                                * 23411
          ;                                      * 23416
          RSKIP                                  * 2341B
          RSKIP                                  * 23420
          COLASKIP                               * 23425
        ;                                        * 2342A

* slots of 700 00D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_24046                        * 2342F  slot 0
        CON(5)  OBJ_1483E                        * 23434  slot 1

* refs (2): 40976 4099E
OBJ_23439:
        ::                                       * 23439  slot 2
          KeyOb@                                 * 2343E
          '                                      * 23443
          Π'est                                  * 23448
          BINT1                                  * 2344D
          DOBIND                                 * 23452
          EVAL                                   * 23457
          1GETABND                               * 2345C
          KeyOb!                                 * 23461
        ;                                        * 23466

* ->
* ROMPTR 700 00E HALT
* refs (2): 22DE7 2432A
        CON(1)  8                                * 2346B  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2346C  library
        CON(3)  #00E                             * 2346F  command
xHALT:
        ::                                       * 23472
          CK0                                    * 23477
          COLA                                   * 2347C
          halt                                   * 23481
        ;                                        * 23486

* slots of 700 00E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_24320                        * 2348B  slot 0
        CON(5)  OBJ_14BE5                        * 23490  slot 1

* -> nextob
* ROMPTR 700 00F
* refs (4): 22DE7 23DDA 25998 D362F
        CON(1)  8                                * 23495  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23496  library
        CON(3)  #00F                             * 23499  command
xSILENT':
        ::                                       * 2349C
          CK0ATTNABORT                           * 234A1
          'R                                     * 234A6
        ;                                        * 234AB

* slots of 700 00F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  TrueTrue                         * 234B0  slot 0
        CON(5)  OBJ_14E2C                        * 234B5  slot 1

* ob1 .. obn ->
* ROMPTR 700 010
* refs (9): 22DE7 242B7 5DF38 D1864 D2F56 D3BD3 ...
        CON(1)  8                                * 234BA  command header: flags (meaning not yet known)
        CON(3)  #700                             * 234BB  library
        CON(3)  #010                             * 234BE  command
xRPN->:
        ::                                       * 234C1
          CK0ATTNABORT                           * 234C6
          OBJ_23502                              * 234CB
          DEPTH                                  * 234D0
          OVER                                   * 234D5
          #2*                                    * 234DA
          #>case                                 * 234DF
          DOBIND                                 * 234E4
          NDROP                                  * 234E9
          SETSTACKERR                            * 234EE
        ;                                        * 234F3

        CON(5)  OBJ_2419A                        * 234F8  address (the code jumps or points through it)

        CON(5)  OBJ_149BF                        * 234FD  address (the code jumps or points through it)

* refs (2): 22FF5 234CB
OBJ_23502:
        CON(5)  (*)+5                            * 23502  primitive code object
        ASSEMBLE
        C=B     A                                * 23507
        CD0EX                                    * 23509
        RSTK=C                                   * 2350C
        D0=D0-  5                                * 2350E
        C=DAT0  A                                * 23511
        CD0EX                                    * 23514
        RSTK=C                                   * 23517
        C=0     A                                * 23519
        RSTK=C                                   * 2351B
L_2351D:
        D=D-1   A                                * 2351D
        GONC    L_23568                          * 2351F
        C=RSTK                                   * 23522
        R0=C                                     * 23524
        C=RSTK                                   * 23527
        C=RSTK                                   * 23529
        D0=C                                     * 2352B
        GOSBVL  SAVPTR                           * 2352E
        GOSBVL  GARBAGECOL                       * 23535  inline data follows
        GOSBVL  GETPTR                           * 2353C
        D=D-1   A                                * 23543
        GONC    L_23551                          * 23545
        D=0     A                                * 23548
        GOVLNG  DOMEMERR                         * 2354A
L_23551:
        C=B     A                                * 23551
        CD0EX                                    * 23553
        RSTK=C                                   * 23556
        D0=D0-  5                                * 23558
        C=DAT0  A                                * 2355B
        CD0EX                                    * 2355E
        RSTK=C                                   * 23561
        C=R0                                     * 23563
        RSTK=C                                   * 23566
L_23568:
        A=DAT0  A                                * 23568
        LC(5)   DOLAM                            * 2356B
        ?C=A    A                                * 23572
        GOYES   L_235BB                          * 23575
        AD0EX                                    * 23577
        C=DAT0  A                                * 2357A
        D0=(5)  DOLAM                            * 2357D
        AD0EX                                    * 23584
        ?C=A    A                                * 23587
        GOYES   L_235B2                          * 2358A
        C=RSTK                                   * 2358C
        R0=C                                     * 2358E
        C=RSTK                                   * 23591
        C=RSTK                                   * 23593
        D0=C                                     * 23595
        D=D+1   A                                * 23598
        GOSBVL  SAVPTR                           * 2359A
        GOSBVL  PUSH#                            * 235A1
        A=DAT0  A                                * 235A8
        D0=D0+  5                                * 235AB
        PC=(A)                                   * 235AE
L_235B2:
        C=DAT0  A                                * 235B2
        D0=D0+  5                                * 235B5
        GONC    L_235D6                          * 235B8
L_235BB:
        AD0EX                                    * 235BB
        D0=A                                     * 235BE
        D0=D0+  5                                * 235C1
        C=0     A                                * 235C4
        C=DAT0  B                                * 235C6
        D0=D0+  2                                * 235C9
        C=C+C   A                                * 235CC
        AD0EX                                    * 235CE
        C=C+A   A                                * 235D1
        CD0EX                                    * 235D3
L_235D6:
        D1=D1-  5                                * 235D6
        DAT1=C  A                                * 235D9
        C=RSTK                                   * 235DC
        C=C+1   A                                * 235DE
        A=C     A                                * 235E0
        C=RSTK                                   * 235E2
        CD0EX                                    * 235E4
        DAT0=C  A                                * 235E7
        CD0EX                                    * 235EA
        RSTK=C                                   * 235ED
        C=A     A                                * 235EF
        RSTK=C                                   * 235F1
        GOTO    L_2351D                          * 235F3

* ROMPTR 700 011 »
* refs (7): 22DE7 24311 D2FA8 D3CDE D3F55 D3F6E ...
        CON(1)  11                               * 235F7  command header: flags (meaning not yet known)
        CON(3)  #700                             * 235F8  library
        CON(3)  #011                             * 235FB  command
        RPL
x>>ABND:
        ::                                       * 235FE
          CK0ATTNABORT                           * 23603
          ABND                                   * 23608
        ;                                        * 2360D

* slots of 700 011 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_14CDF                        * 23612  slot 0

* ROMPTR 700 012 «
* refs (39): 150FC 22DE7 23DE9 2428F 24514 24C80 ...
        CON(1)  1                                * 23617  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23618  library
        CON(3)  #012                             * 2361B  command
x<<:
        ::                                       * 2361E
          CK0ATTNABORT                           * 23623
        ;                                        * 23628

* slots of 700 012 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23DD0                        * 2362D  slot 0

* ROMPTR 700 013
* refs (25): 22DE7 23E3E 3DB12 5959C 5E016 8C23A ...
        CON(1)  11                               * 23632  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23633  library
        CON(3)  #013                             * 23636  command
x>>:
        ::                                       * 23639
          CK0ATTNABORT                           * 2363E
        ;                                        * 23643

* slots of 700 013 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_14D02                        * 23648  slot 0

* ROMPTR 700 014 '
* refs (10): 16E3A 22DE7 23AC4 40418 59583 6B2BE ...
        CON(1)  8                                * 2364D  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2364E  library
        CON(3)  #014                             * 23651  command
x':
        ::                                       * 23654
          CK0ATTNABORT                           * 23659
          'R                                     * 2365E
        ;                                        * 23663

* slots of 700 014 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23A6F                        * 23668  slot 0
        CON(5)  OBJ_14BB3                        * 2366D  slot 1

* ROMPTR 700 015
* refs (8): 16F48 22DE7 23AD3 40427 59592 8C28F ...
        CON(1)  0                                * 23672  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23673  library
        CON(3)  #015                             * 23676  command
xENDTIC:
        ::                                       * 23679
          CK0ATTNABORT                           * 2367E
        ;                                        * 23683

* slots of 700 015 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23A6F                        * 23688  slot 0

* ROMPTR 700 016
* refs (3): 22DE7 24037 C5BF3
        CON(1)  11                               * 2368D  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2368E  library
        CON(3)  #016                             * 23691  command
xWHILEEND:
        ::                                       * 23694
          CK0ATTNABORT                           * 23699
          COLA                                   * 2369E
          REPEAT                                 * 236A3
        ;                                        * 236A8

* slots of 700 016 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_1499C                        * 236AD  slot 0

* 1/0 ->
* ROMPTR 700 017
* refs (5): 1491A 22DE7 2370E 23DC1 C5B7F
        CON(1)  11                               * 236B2  command header: flags (meaning not yet known)
        CON(3)  #700                             * 236B3  library
        CON(3)  #017                             * 236B6  command
xENDDO:
        ::                                       * 236B9
          CK1&Dispatch                           * 236BE
          BINT1                                  * 236C3
          enddo(r)                               * 236C8
          BINT10                                 * 236CD
          enddo(ex)                              * 236D2
        ;                                        * 236D7

* slots of 700 017 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_1490B                        * 236DC  slot 0

* refs (1): 236C8
enddo(r):
        ::                                       * 236E1  slot 1
          OBJ_4241B                              * 236E6
          %0<>                                   * 236EB
          COLA                                   * 236F0
          UNTIL                                  * 236F5
        ;                                        * 236FA

* refs (1): 236D2
enddo(ex):
        ::                                       * 236FF  slot 2
          SYMCRUNCH1                             * 23704
          COLA                                   * 23709
          xENDDO                                 * 2370E
        ;                                        * 23713

* ROMPTR 700 018
* refs (6): 22DE7 240BE 2DD9C C5E16 C5E39 D3E88
        CON(1)  2                                * 23718  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23719  library
        CON(3)  #018                             * 2371C  command
xERRTHEN:
        ::                                       * 2371F
          CK0ATTNABORT                           * 23724
        ;                                        * 23729

* refs (3): 231F0 2375E 56B41
Π'stop:
        LAM     'stop                            * 2372E

* refs (1): 23759
Π'noname:
        LAM     'noname                          * 2373F

* refs (1): 23149
OBJ_23754:
        {                                        * 23754
          Π'noname                               * 23759
          Π'stop                                 * 2375E
        }                                        * 23763

* ->
* refs (16): 22EC8 22FDA 22FF0 23038 230C8 230F2 ...
CK0ATTNABORT:
        ::                                       * 23768
          'RSAVEWORD                             * 2376D
          CK0NOLASTWD                            * 23772
          COLA                                   * 23777
          ?ATTNQUIT                              * 2377C
        ;                                        * 23781

* ->
* ROMPTR 700 019 CASE
* refs (3): 22DE7 23AEC C59F6
        CON(1)  1                                * 23786  command header: flags (meaning not yet known)
        CON(3)  #700                             * 23787  library
        CON(3)  #019                             * 2378A  command
xCASE:
        ::                                       * 2378D
          CK0ATTNABORT                           * 23792
        ;                                        * 23797

* slots of 700 019 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_23AE2                        * 2379C  slot 0

* ROMPTR 700 01A
* refs (6): 14CA3 22DE7 23802 23B69 C59F1 C5A0F
        CON(1)  9                                * 237A1  command header: flags (meaning not yet known)
        CON(3)  #700                             * 237A2  library
        CON(3)  #01A                             * 237A5  command
xTHENCASE:
        ::                                       * 237A8
          CK1&Dispatch                           * 237AD
          BINT1                                  * 237B2
          thencase(r)                            * 237B7
          BINT10                                 * 237BC
          thencase(ex)                           * 237C1
        ;                                        * 237C6

* slots of 700 01A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  failed                           * 237CB  slot 0
        CON(5)  OBJ_14C99                        * 237D0  slot 1

* refs (1): 237B7
thencase(r):
        ::                                       * 237D5  slot 2
          j%0=case                               * 237DA
          OBJ_22F3B                              * 237DF
          OBJ_4241B                              * 237E4
          COLACOLA                               * 237E9
        ;                                        * 237EE

* refs (1): 237C1
thencase(ex):
        ::                                       * 237F3  slot 3
          SYMCRUNCH1                             * 237F8
          COLA                                   * 237FD
          xTHENCASE                              * 23802
        ;                                        * 23807

* ROMPTR 700 01B XLIB
* refs (1): 22DE7
        CON(1)  2                                * 2380C  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2380D  library
        CON(3)  #01B                             * 23810  command
xDIR:
        ::                                       * 23813
        ;                                        * 23818

* $ ->
* ROMPTR 700 01C PROMPT
* refs (2): 22DE7 24343
        CON(1)  8                                * 2381D  command header: flags (meaning not yet known)
        CON(3)  #700                             * 2381E  library
        CON(3)  #01C                             * 23821  command
xPROMPT:
        ::                                       * 23824
          CK1                                    * 23829

* refs (1): 14C08
Chk1&2Disp!(st)Fr:
          ::                                     * 2382E
            CK1NOLASTWD                          * 23833
            CK&DISPATCH1                         * 23838
            BINT3                                * 2383D
            1&2Disp!(st)Fr                       * 23842
          ;                                      * 23847
          COLA                                   * 2384C
          halt                                   * 23851
        ;                                        * 23856

        CON(5)  OBJ_24339                        * 2385B  address (the code jumps or points through it)

        CON(5)  OBJ_14BFE                        * 23860  address (the code jumps or points through it)

* refs (1): 23842
1&2Disp!(st)Fr:
        ::                                       * 23865
          DISPSTATUS2                            * 2386A
          SetDA1Valid                            * 2386F
        ;                                        * 23874

* refs (3): 238AE 258E4 25A9D
{'ioinprogress}:
        {                                        * 23879

* refs (3): 26239 26270 262CF
Π'ioinprogress:
          LAM     'ioinprogress                  * 2387E
        }                                        * 2389F

* $ -> ob T               \ -> $ #pos $' F
* refs (13): 0C209 1413C 20E93 212EF 21519 2DFBE ...
palparse:
        ::                                       * 238A4
          FALSE                                  * 238A9
          {'ioinprogress}                        * 238AE
          BIND                                   * 238B3

* refs (1): 25902
OBJ_238B8:
          ::                                     * 238B8
            {}_23989                             * 238BD
            SWAP                                 * 238C2
            ERRSET                               * 238C7
            ::                                   * 238CC
              OBJ_25D3A                          * 238D1
              SWAPONE                            * 238D6
              GetNextToken                       * 238DB
              OBJ_239E3                          * 238E0
            ;                                    * 238E5
            ERRTRAP                              * 238EA
            OBJ_23993                            * 238EF
            DROP                                 * 238F4
            case                                 * 238F9
            drop(1-5,7);true                     * 238FE

{st,ofs,tok}:
            {                                    * 23903

Πst:
              LAM     st                         * 23908

Πofs:
              LAM     ofs                        * 23913

Πtok:
              LAM     tok                        * 23920
            }                                    * 2392D
            BIND                                 * 23932
            BEGIN                                * 23937
            {}_23989                             * 2393C
            EQ                                   * 23941
            UNTIL                                * 23946

Πst_2394B:
            LAM     st                           * 2394B

Πofs_23956:
            LAM     ofs                          * 23956

Πtok_23963:
            LAM     tok                          * 23963
            ABND                                 * 23970
            FALSE                                * 23975
          ;                                      * 2397A
          ABND                                   * 2397F
        ;                                        * 23984

* refs (8): 238BD 2393C 239B1 28977 289C7 B67BF ...
{}_23989:
        {                                        * 23989
        }                                        * 2398E

* refs (1): 238EF
OBJ_23993:
        ::                                       * 23993
          ERROR@                                 * 23998
          OBJ_26289                              * 2399D
          #=?SKIP                                * 239A2
          ::                                     * 239A7
            BEGIN                                * 239AC
            {}_23989                             * 239B1
            EQ                                   * 239B6
            UNTIL                                * 239BB
          ;                                      * 239C0
          ERRJMP                                 * 239C5
        ;                                        * 239CA

* refs (1): 238FE
drop(1-5,7);true:
        ::                                       * 239CF
          5DROP                                  * 239D4
          SWAPDROPTRUE                           * 239D9
        ;                                        * 239DE

* refs (1): 238E0
OBJ_239E3:
        ::                                       * 239E3
          OBJ_2530E                              * 239E8
          OBJ_23A06                              * 239ED
          !*triand                               * 239F2
          OBJ_2525A                              * 239F7
          TrueTrue                               * 239FC
        ;                                        * 23A01

* refs (2): 239ED 23A24
OBJ_23A06:
        ::                                       * 23A06
          nultrior                               * 23A0B
          TrueTrue                               * 23A10
          OBJ_23A2E                              * 23A15
          !*triand                               * 23A1A
          COLA                                   * 23A1F
          OBJ_23A06                              * 23A24
        ;                                        * 23A29

* refs (16): 23A15 23B46 23BB9 23C0E 23C77 23CD6 ...
OBJ_23A2E:
        ::                                       * 23A2E
          tok'                                   * 23A33
          tok8cktrior                            * 23A38
          OBJ_23A6F                              * 23A3D
          OBJ_24384                              * 23A42
          !*trior                                * 23A47
          TrueTrue                               * 23A4C
          OBJ_245DC                              * 23A51
          !*trior                                * 23A56
          TrueTrue                               * 23A5B
          COLA                                   * 23A60
          OBJ_2469F                              * 23A65
        ;                                        * 23A6A

* refs (3): 23668 23688 23A3D
OBJ_23A6F:
        ::                                       * 23A6F
          OBJ_2472B                              * 23A74
          !*trior                                * 23A79
          OBJ_23A8D                              * 23A7E
          TrueTrue                               * 23A83
        ;                                        * 23A88

* refs (1): 23A7E
OBJ_23A8D:
        ::                                       * 23A8D
          6PICK                                  * 23A92
          need'case                              * 23A97
          OBJ_23AB0                              * 23A9C
          DROP                                   * 23AA1
          TrueTrue                               * 23AA6
        ;                                        * 23AAB

* refs (1): 23A9C
OBJ_23AB0:
        ::                                       * 23AB0
          DROP                                   * 23AB5
          4psh                                   * 23ABA
          PTR     addt:                          * 23ABF
          x'                                     * 23AC4
          ROTSWAP                                * 23AC9
          PTR     addt:                          * 23ACE
          xENDTIC                                * 23AD3
          swapB;drop;2true                       * 23AD8
        ;                                        * 23ADD

* refs (1): 2379C
OBJ_23AE2:
        ::                                       * 23AE2
          'Rapndit                               * 23AE7
          xCASE                                  * 23AEC
          OBJ_2530E                              * 23AF1
          OBJ_23B19                              * 23AF6
          !*triand                               * 23AFB
          OBJ_252CD                              * 23B00
          'Rapndit                               * 23B05
          xIFEND                                 * 23B0A
          TrueTrue                               * 23B0F
        ;                                        * 23B14

* refs (3): 23AF6 23B55 23B91
OBJ_23B19:
        ::                                       * 23B19
          nultrior                               * 23B1E
          TrueTrue                               * 23B23
          _END__253D6                            * 23B28
          tok8trior                              * 23B2D
          TrueTrue                               * 23B32
          _THEN_                                 * 23B37
          tok8trior                              * 23B3C
          OBJ_23B5F                              * 23B41
          OBJ_23A2E                              * 23B46
          !*triand                               * 23B4B
          COLA                                   * 23B50
          OBJ_23B19                              * 23B55
        ;                                        * 23B5A

* refs (1): 23B41
OBJ_23B5F:
        ::                                       * 23B5F
          'Rapndit                               * 23B64
          xTHENCASE                              * 23B69
          OBJ_2530E                              * 23B6E
          OBJ_23B9B                              * 23B73
          !*triand                               * 23B78
          OBJ_252CD                              * 23B7D
          'Rapndit                               * 23B82
          xIFEND                                 * 23B87
          COLA                                   * 23B8C
          OBJ_23B19                              * 23B91
        ;                                        * 23B96

* refs (2): 23B73 23BC8
OBJ_23B9B:
        ::                                       * 23B9B
          nultrior                               * 23BA0
          TrueTrue                               * 23BA5
          _END__253D6                            * 23BAA
          tok8trior                              * 23BAF
          TrueTrue                               * 23BB4
          OBJ_23A2E                              * 23BB9
          !*triand                               * 23BBE
          COLA                                   * 23BC3
          OBJ_23B9B                              * 23BC8
        ;                                        * 23BCD

* refs (1): 22ED2
OBJ_23BD2:
        ::                                       * 23BD2
          'Rapndit                               * 23BD7
          xIF                                    * 23BDC
          COLA                                   * 23BE1
          OBJ_23BF0                              * 23BE6
        ;                                        * 23BEB

* refs (2): 23BE6 23C1D
OBJ_23BF0:
        ::                                       * 23BF0
          nultrior                               * 23BF5
          failed                                 * 23BFA
          _THEN_                                 * 23BFF
          tok8trior                              * 23C04
          OBJ_23C27                              * 23C09
          OBJ_23A2E                              * 23C0E
          !*triand                               * 23C13
          COLA                                   * 23C18
          OBJ_23BF0                              * 23C1D
        ;                                        * 23C22

* refs (1): 23C09
OBJ_23C27:
        ::                                       * 23C27
          'Rapndit                               * 23C2C
          xTHEN                                  * 23C31
          OBJ_2530E                              * 23C36
          COLA                                   * 23C3B
          OBJ_23C4A                              * 23C40
        ;                                        * 23C45

* refs (2): 23C40 23C86
OBJ_23C4A:
        ::                                       * 23C4A
          nultrior                               * 23C4F
          OBJ_23CEF                              * 23C54
          _END__253D6                            * 23C59
          tok8trior                              * 23C5E
          OBJ_23CEF                              * 23C63
          _ELSE_                                 * 23C68
          tok8trior                              * 23C6D
          OBJ_23C90                              * 23C72
          OBJ_23A2E                              * 23C77
          !*triand                               * 23C7C
          COLA                                   * 23C81
          OBJ_23C4A                              * 23C86
        ;                                        * 23C8B

* refs (1): 23C72
OBJ_23C90:
        ::                                       * 23C90
          OBJ_252CD                              * 23C95
          'Rapndit                               * 23C9A
          xELSE                                  * 23C9F
          OBJ_2530E                              * 23CA4
          COLA                                   * 23CA9
          OBJ_23CB8                              * 23CAE
        ;                                        * 23CB3

* refs (2): 23CAE 23CE5
OBJ_23CB8:
        ::                                       * 23CB8
          nultrior                               * 23CBD
          OBJ_23CEF                              * 23CC2
          _END__253D6                            * 23CC7
          tok8trior                              * 23CCC
          OBJ_23CEF                              * 23CD1
          OBJ_23A2E                              * 23CD6
          !*triand                               * 23CDB
          COLA                                   * 23CE0
          OBJ_23CB8                              * 23CE5
        ;                                        * 23CEA

* refs (4): 23C54 23C63 23CC2 23CD1
OBJ_23CEF:
        ::                                       * 23CEF
          OBJ_252CD                              * 23CF4
          'Rapndit                               * 23CF9
          xIFEND                                 * 23CFE
          TrueTrue                               * 23D03
        ;                                        * 23D08

* refs (1): 230DC
OBJ_23D0D:
        ::                                       * 23D0D
          'Rapndit                               * 23D12
          xDO                                    * 23D17
          COLA                                   * 23D1C
          OBJ_23D2B                              * 23D21
        ;                                        * 23D26

* refs (2): 23D21 23D58
OBJ_23D2B:
        ::                                       * 23D2B
          nultrior                               * 23D30
          failed                                 * 23D35
          _UNTIL_                                * 23D3A
          tok8trior                              * 23D3F
          OBJ_23D62                              * 23D44
          OBJ_23A2E                              * 23D49
          !*triand                               * 23D4E
          COLA                                   * 23D53
          OBJ_23D2B                              * 23D58
        ;                                        * 23D5D

* refs (1): 23D44
OBJ_23D62:
        ::                                       * 23D62
          'Rapndit                               * 23D67
          xUNTIL                                 * 23D6C
          COLA                                   * 23D71
          OBJ_23D80                              * 23D76
        ;                                        * 23D7B

* refs (2): 23D76 23DAD
OBJ_23D80:
        ::                                       * 23D80
          nultrior                               * 23D85
          OBJ_23DB7                              * 23D8A
          _END__253D6                            * 23D8F
          tok8trior                              * 23D94
          OBJ_23DB7                              * 23D99
          OBJ_23A2E                              * 23D9E
          !*triand                               * 23DA3
          COLA                                   * 23DA8
          OBJ_23D80                              * 23DAD
        ;                                        * 23DB2

* refs (2): 23D8A 23D99
OBJ_23DB7:
        ::                                       * 23DB7
          'Rapndit                               * 23DBC
          xENDDO                                 * 23DC1
          TrueTrue                               * 23DC6
        ;                                        * 23DCB

* refs (1): 2362D
OBJ_23DD0:
        ::                                       * 23DD0
          'Rapndit                               * 23DD5
          xSILENT'                               * 23DDA
          OBJ_2530E                              * 23DDF
          'Rapndit                               * 23DE4
          x<<                                    * 23DE9
          COLA                                   * 23DEE
          OBJ_23DFD                              * 23DF3
        ;                                        * 23DF8

* refs (5): 23DF3 23E2A 2451E 24C85 24E3D
OBJ_23DFD:
        ::                                       * 23DFD
          nultrior                               * 23E02
          OBJ_23E34                              * 23E07
          tok>>                                  * 23E0C
          tok8trior                              * 23E11
          OBJ_23E34                              * 23E16
          OBJ_23A2E                              * 23E1B
          !*triand                               * 23E20
          COLA                                   * 23E25
          OBJ_23DFD                              * 23E2A
        ;                                        * 23E2F

* refs (2): 23E07 23E16
OBJ_23E34:
        ::                                       * 23E34
          'Rapndit                               * 23E39
          x>>                                    * 23E3E
          OBJ_252B4                              * 23E43
          TrueTrue                               * 23E48
        ;                                        * 23E4D

* refs (3): 23EA2 241A4 241EA
OBJ_23E52:
        ::                                       * 23E52
          nultrior                               * 23E57
          failed                                 * 23E5C
          OBJ_246BD                              * 23E61
          !*triand                               * 23E66
          ID>LAM                                 * 23E6B
          COLA                                   * 23E70
          DaDGNTc                                * 23E75
        ;                                        * 23E7A

* refs (1): 2313A
OBJ_23E7F:
        ::                                       * 23E7F
          'Rapndit                               * 23E84
          xSTART                                 * 23E89
          COLA                                   * 23E8E
          OBJ_23F01                              * 23E93
        ;                                        * 23E98

* refs (1): 231D7
OBJ_23E9D:
        ::                                       * 23E9D
          OBJ_23E52                              * 23EA2
          !*triand                               * 23EA7
          4psh                                   * 23EAC
          PTR     addt:                          * 23EB1
          xSTARTVAR                              * 23EB6
          ROTSWAP                                * 23EBB
          OVERDUP                                * 23EC0
          BINT1                                  * 23EC5
          DOBIND                                 * 23ECA
          SWAPUnDROP                             * 23ECF
          OBJ_23F01                              * 23ED4
          ABND                                   * 23ED9
          !*triand                               * 23EDE
          TrueTrue                               * 23EE3
        ;                                        * 23EE8

* ob -> { ob }
* refs (31): 05ECE 16C61 1745F 17798 186ED 19416 ...
ONE{}N:
        ::                                       * 23EED
          BINT1                                  * 23EF2
          P{}N                                   * 23EF7
        ;                                        * 23EFC

* refs (3): 23E93 23ED4 23F3D
OBJ_23F01:
        ::                                       * 23F01
          nultrior                               * 23F06
          failed                                 * 23F0B
          _NEXT_                                 * 23F10
          tok8trior                              * 23F15
          OBJ_23F47                              * 23F1A
          _STEP_                                 * 23F1F
          tok8trior                              * 23F24
          OBJ_23F60                              * 23F29
          OBJ_23A2E                              * 23F2E
          !*triand                               * 23F33
          COLA                                   * 23F38
          OBJ_23F01                              * 23F3D
        ;                                        * 23F42

* refs (1): 23F1A
OBJ_23F47:
        ::                                       * 23F47
          'Rapndit                               * 23F4C
          xNEXT                                  * 23F51
          TrueTrue                               * 23F56
        ;                                        * 23F5B

* refs (1): 23F29
OBJ_23F60:
        ::                                       * 23F60
          'Rapndit                               * 23F65
          xSTEP                                  * 23F6A
          TrueTrue                               * 23F6F
        ;                                        * 23F74

* refs (1): 2304C
OBJ_23F79:
        ::                                       * 23F79
          'Rapndit                               * 23F7E
          xWHILE                                 * 23F83
          COLA                                   * 23F88
          OBJ_23F97                              * 23F8D
        ;                                        * 23F92

* refs (2): 23F8D 23FC4
OBJ_23F97:
        ::                                       * 23F97
          nultrior                               * 23F9C
          failed                                 * 23FA1
          _REPEAT_                               * 23FA6
          tok8trior                              * 23FAB
          OBJ_23FCE                              * 23FB0
          OBJ_23A2E                              * 23FB5
          !*triand                               * 23FBA
          COLA                                   * 23FBF
          OBJ_23F97                              * 23FC4
        ;                                        * 23FC9

* refs (1): 23FB0
OBJ_23FCE:
        ::                                       * 23FCE
          'Rapndit                               * 23FD3
          xREPEAT                                * 23FD8
          OBJ_2530E                              * 23FDD
          COLA                                   * 23FE2
          OBJ_23FF1                              * 23FE7
        ;                                        * 23FEC

* refs (2): 23FE7 2401E
OBJ_23FF1:
        ::                                       * 23FF1
          nultrior                               * 23FF6
          OBJ_24028                              * 23FFB
          _END__253D6                            * 24000
          tok8trior                              * 24005
          OBJ_24028                              * 2400A
          OBJ_23A2E                              * 2400F
          !*triand                               * 24014
          COLA                                   * 24019
          OBJ_23FF1                              * 2401E
        ;                                        * 24023
