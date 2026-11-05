* HP 48GX ROM revision R, #B7B7D-#BA575: Form data, part 2: alarm browser, Statistics, I/O and Kermit, Modes, Flags browser, Var browser; library tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: VarStoFld DirScanChar XferXModem XferSet48 XferSendHP48 XferSend XferRestoreIO XferRecv XferPutPort XferPutFormat XferProtoItems XferOverwrite?
* Follows on from the previous file (at #B7B7D in the original ROM).
        RPL

* ROMPTR 0B5 0D8
* refs (1): B4B39
* alarm -> $: alarm message, "" if -1
AlmMsg:
        :: BINT2 NTHCOMPDROP DUP MINUSONE EQUAL casedrop NULL$ * B7B7D
        ;                                        * B7BA5

* ROMPTR 0B5 0D9
* refs (1): B4B39
* alarm -> %h %m %s item
AlmTime:
        :: CARCOMP Ticks>TOD XLIB Tim%>Fields ;  * B7BAA

* ROMPTR 0B5 0DA
* refs (1): B4B39
* alarm -> %m %d %yy
AlmDate:
        :: CARCOMP Ticks>Date XLIB Date>Fields ; * B7BC9

* ROMPTR 0B5 0DB
* refs (1): B4B39
* alarm -> %n item: repeat interval in the largest unit that fits it
AlmRepeat:
        ::                                       * B7BE8
          :: CARCOMP Ticks>Rpt XLIB TicksPerWeek OVER %<= case * B7BED
            :: XLIB TicksPerWeek %/ BINT1 ;      * B7C16
            XLIB TicksPerDay OVER %<= case       * B7C35
            :: XLIB TicksPerDay %/ BINT2 ;       * B7C4F
            XLIB TicksPerHour OVER %<= case      * B7C6E
            :: XLIB TicksPerHour %/ BINT3 ;      * B7C88
            XLIB TicksPerMin OVER %<= case       * B7CA7
            :: XLIB TicksPerMin %/ BINT4 ;       * B7CC1
            XLIB TicksPerSec %/ BINT5 ;          * B7CE0
          XLIB AlmUnitItems SWAP NTHCOMPDROP ;   * B7CFA

* ROMPTR 0B5 0DC
* refs (1): B4B39
* alarm -> : deletes it, if it is still in the list
AlmDelete:
        :: ALARMS@ NTHOF DUP#0=csDROP UNCOERCE DELALARM ; * B7D14

* ROMPTR 0B5 0DD
* refs (1): B4B39
* As StatGetDAT
StatGetDAT2:
        :: Exist@äDAT? NOTcase MINUSONE          * B7D37
          ChkStatArray ;                         * B7D4B

* ROMPTR 0B5 0DE
* refs (1): B4B39
* As StatPutDAT
StatPutDAT2:
        :: XLIB IFSkipNoVal STATCLST å- ;        * B7D55

* ROMPTR 0B5 0DF
* refs (1): B4B39
* -> item: fit model in ΣPAR as a choose item
StatGetFit:
        :: ChkReakäPAR 5UNROLL 4DROP             * B7D74
          { xLINFIT XLIB StatItemLin xLOGFIT XLIB StatItemLog xEXPFIT * B7D88
            XLIB StatItemExp xPWRFIT XLIB StatItemPwr xBESTFIT * B7DB2
            XLIB StatItemBest }                  * B7DD2
          EQLookup DROP ;                        * B7DE2

* ROMPTR 0B5 0E0
* refs (1): B4B39
* -> %xcol %ycol from ΣPAR
StatGetCols:
        :: ChkReakäPAR 3DROP ;                   * B7DF1

* ROMPTR 0B5 0E1
* refs (1): B4B39
~STATCOL:
        :: STATCOL ;                             * B7E05

* ROMPTR 0B5 0E2
* refs (1): B4B39
* %col ob -> %: Single-var form's Mean. The five after it take the same arguments; ob is the Sample/Population flag, used by SDev and Var only
StatFldMean:
        :: DROP StatColArgs ColumnMEAN ;         * B7E14

* ROMPTR 0B5 0E3
* refs (1): B4B39
* %col flag -> %: sample or population standard deviation
StatFldSDev:
        :: SWAP StatColArgs ROT ITE ColumnTDEV ColumnPSDEV * B7E2D
        ;                                        * B7E50

* ROMPTR 0B5 0E4
* refs (1): B4B39
* %col flag -> %: sample or population variance
StatFldVar:
        :: SWAP StatColArgs ROT ITE ColumnVAR ColumnPVAR * B7E55
        ;                                        * B7E78

* ROMPTR 0B5 0E5
* refs (1): B4B39
StatFldTotal:
        :: DROP StatColArgs ColumnTOT ;          * B7E7D

* ROMPTR 0B5 0E6
* refs (1): B4B39
StatFldMax:
        :: DROP StatColArgs ColumnMAX ;          * B7E96

* ROMPTR 0B5 0E7
* refs (1): B4B39
StatFldMin:
        :: DROP StatColArgs ColumnMIN ;          * B7EAF

* ROMPTR 0B5 0E8
* refs (1): B4B39
* Frequencies form: drops the data field and runs BINS
StatBins:
        :: 4ROLLDROP SWAP bins(3r) ;             * B7EC8

* ROMPTR 0B5 0E9
* refs (1): B4B39
* -> eq %corr %cov: fits the model and gives the fit equation, correlation and covariance
StatFitResults:
        :: StatFitEq STATCORR STATCOV ;          * B7EE1

* ROMPTR 0B5 0EA
* refs (1): B4B39
~STATPREDX:
        :: STATPREDX ;                           * B7EFA

* ROMPTR 0B5 0EB
* refs (1): B4B39
~STATPREDY:
        :: STATPREDY ;                           * B7F09

* ROMPTR 0B5 0EC
* refs (1): B4B39
~STATX:
        :: STATX ;                               * B7F18

* ROMPTR 0B5 0ED
* refs (1): B4B39
~STATY:
        :: STATY ;                               * B7F27

* ROMPTR 0B5 0EE
* refs (1): B4B39
~STATXX:
        :: STATXX ;                              * B7F36

* ROMPTR 0B5 0EF
* refs (1): B4B39
~STATYY:
        :: STATYY ;                              * B7F45

* ROMPTR 0B5 0F0
* refs (1): B4B39
~STATXY:
        :: STATXY ;                              * B7F54

* ROMPTR 0B5 0F1
* refs (1): B4B39
~STATN:
        :: STATN ;                               * B7F63

* ROMPTR 0B5 0F2
* refs (1): B4B39
* Choose list of Sample or Population
StatTypeItems:
        { XLIB StatItemSample XLIB StatItemPop } * B7F72

* ROMPTR 0B5 0F3
* refs (1): B4B39
StatItemSample:
        { # BB17 TRUE }                          * B7F92  "Sample"

* ROMPTR 0B5 0F4
* refs (1): B4B39
StatItemPop:
        { # BB18 FALSE }                         * B7FAB  "Population"

* ROMPTR 0B5 0F5
* refs (1): B4B39
* Choose list of fit models
StatFitItems:
        { XLIB StatItemLin XLIB StatItemLog XLIB StatItemExp * B7FC4
          XLIB StatItemPwr XLIB StatItemBest }   * B7FEA

* ROMPTR 0B5 0F6
* refs (1): B4B39
* Item: message, command
StatItemLin:
        { # BB3B xLINFIT }                       * B8005  "Linear Fit"

* ROMPTR 0B5 0F7
* refs (1): B4B39
StatItemLog:
        { # BB3C xLOGFIT }                       * B801E  "Logarithmic Fit"

* ROMPTR 0B5 0F8
* refs (1): B4B39
StatItemExp:
        { # BB3D xEXPFIT }                       * B8037  "Exponential Fit"

* ROMPTR 0B5 0F9
* refs (1): B4B39
StatItemPwr:
        { # BB3E xPWRFIT }                       * B8050  "Power Fit"

* ROMPTR 0B5 0FA
* refs (1): B4B39
StatItemBest:
        { # BB3F xBESTFIT }                      * B8069  "Best Fit"

* ROMPTR 0B5 0FB
* refs (1): B4B39
* ob|{} -> : Send to HP 48. Sends with the link settings of XferSet48 and restores them, also on error
XferSendHP48:
        :: XLIB IFCkValArg                       * B8082

* ROMPTR 0B5 0FC
* refs (1): B4B39
* Saves IOPAR and flags -33 and -35 in local variables, then sets translate code 3, IR and binary mode, the HP 48 to HP 48 link
XferSet48:
          :: XLIB IOGetPar BINT6 {}N DUP BINT33 TestSysFlag BINT35 * B8092  flag -33: Transfer via wire / Transfer via IR
            TestSysFlag 3NULLLAM{} BIND INCOMPDROP SWAPDROP %3 SWAP * B80C0
            6->list;StoInIPAR BINT33 SetSysFlag BINT35 SetSysFlag ; * B80E3  flag -33: Transfer via wire / Transfer via IR  flag -35: ASCII transfer / Binary transfer
          ERRSET                                 * B8101
          :: DUPTYPELIST? ITE SENDLIST SENDNAME  * B8106
          ;                                      * B811F
          ERRTRAP                                * B8124
          :: XLIB XferRestoreIO ERRJMP ;         * B8129

* ROMPTR 0B5 0FD
* refs (1): B4B39
* Restores flags -33 and -35 and IOPAR, and abandons the local variables
XferRestoreIO:
          :: 1GETLAM BINT35 XLIB FlagPut 2GETLAM BINT33 XLIB FlagPut 3GETLAM * B8143
            StoIOPAR ABND ;                      * B8177
        ;                                        * B8186

* ROMPTR 0B5 0FE
* refs (1): B4B39
* ob -> ob: Bad Argument Value if ob is -1, an empty field
IFCkValArg:
        :: MINUSONE OVER EQUAL casedrop XLIB BadValueErr * B818B
        ;                                        * B81AF

* ROMPTR 0B5 0FF
* refs (1): B4B39
* Get from HP 48: receives with XferSet48's settings through RECN with an empty name
XferGetHP48:
        :: XLIB XferSet48 ERRSET                 * B81B4
          :: NULL$TEMP DORECN ; ERRTRAP          * B81C9
          :: XLIB XferRestoreIO ERRJMP ; XLIB XferRestoreIO ; * B81E2

* ROMPTR 0B5 100
* refs (1): B4B39
* -> item: Print form's port, from flag -34
PrtGetPort:
        :: BINT34 TestSysFlag ITE XLIB IOItemWire XLIB IOItemIR * B820C  flag -34: Print via IR / Print via wire
        ;                                        * B8236

* ROMPTR 0B5 101
* refs (1): B4B39
* item -> : sets flag -34. Printing by wire also clears flag -33
PrtPutPort:
        :: XLIB ~BINT3;NTHCOMPROM@ DUP ?SKIP     * B823B
          :: BINT33 ClrSysFlag ;                 * B8255  flag -33: Transfer via wire / Transfer via IR
          NOT BINT34 XLIB FlagPut ;              * B8269

* ROMPTR 0B5 102
* refs (1): B4B39
* %|-1 -> : DELAY, with the empty-field check
PrtPutDelay:
        :: XLIB IFCkValArg DODELAY ;             * B8283

* ROMPTR 0B5 103
* refs (1): B4B39
* -> %delay %width from PRTPAR; defaults 1.8 and 80
PrtGetDelayWidth:
        :: XLIB PrtGetPar #3- NDROP SWAPDROP DUPTYPEREAL? NOTcasedrop %80 * B829D
          SWAP DUPTYPEREAL? NOTcasedrop %1.8     * B82CB
          SWAP ;                                 * B82DF

* ROMPTR 0B5 104
* refs (1): B4B39
* -> flag: flag -38 clear
PrtLinefeed?:
        :: BINT38 TestSysFlag NOT ;              * B82E9  flag -38: Add linefeeds / No linefeeds

* ROMPTR 0B5 105
* refs (1): B4B39
* flag ->
PrtLinefeed!:
        :: NOT BINT38 XLIB FlagPut ;             * B8302

* ROMPTR 0B5 106
* refs (1): B4B39
* %|-1 -> : stores the line width in PRTPAR; values below 1 become 80
PrtPutWidth:
        :: XLIB IFCkValArg DUP %1 %>= ?SKIP      * B8321
          :: DROP %80 ;                          * B8345
          XLIB PrtGetPar DUP#1- ROLLDROP DUP#1+ ROLL OVER#1- UNROLL {}N * B8359
          StoPRTPAR ;                            * B8387

* ROMPTR 0B5 107
* refs (1): B4B39
* ob|-1 -> : prints ob, or a blank line if the field is empty
PrtObj:
        :: DUP MINUSONE EQUAL casedrop DOCR      * B8391
          pr1 DROP ;                             * B83AF

* ROMPTR 0B5 108
* refs (1): B4B39
* -> item: transfer port, from flag -33
XferGetPort:
        :: BINT33 TestSysFlag ITE XLIB IOItemIR XLIB IOItemWire * B83BE  flag -33: Transfer via wire / Transfer via IR
        ;                                        * B83E8

* ROMPTR 0B5 109
* refs (1): B4B39
* item ->
XferPutPort:
        :: XLIB ~BINT3;NTHCOMPROM@ BINT33 XLIB FlagPut ; * B83ED

* ROMPTR 0B5 10A
* refs (1): B4B39
* -> item: ASCII or binary, from flag -35
XferGetFormat:
        :: XLIB XferFmtItems BINT35 TestSysFlag ITE BINT2 BINT1 * B8412  flag -35: ASCII transfer / Binary transfer
          NTHCOMPDROP ;                          * B843B

* ROMPTR 0B5 10B
* refs (1): B4B39
* item ->
XferPutFormat:
        :: XLIB ~BINT3;NTHCOMPROM@ NOT BINT35 XLIB FlagPut ; * B8445

* ROMPTR 0B5 10C
* refs (1): B4B39
* Reads the translate, checksum, baud and parity fields from IOPAR, replacing bad values by defaults
IOGetFields:
        :: XLIB IOGetPar XLIB IOTransItems SWAP DUPTYPEREAL? ITE COERCE * B846F
          DROPONE                                * B849E
          DUP BINT3 #> IT DROPONE                * B84A3
          #1+ NTHCOMPDROP XLIB IOCksumItems ROT  * B84BC
          :: DUPTYPEREAL? NOTcasedrop BINT3      * B84D6
            IO%1to3? NOTcasedrop BINT3           * B84EA
            COERCE ;                             * B84F9
          NTHCOMPDROP ROTDROPROTDROP 4ROLL       * B8503
          :: DUPTYPEREAL? NOTcasedrop %9600      * B8512
            %IP># s=okBaud? NOTcasedrop %9600    * B8526
            UNCOERCE ;                           * B853A
          XLIB IOParityItems 5ROLL               * B8544
          :: DUPTYPEREAL? NOTcasedrop BINT1      * B8554
            %IP># DUP BINT4 #>case DROPONE       * B8568
            #1+ ;                                * B8581
          NTHCOMPDROP ;                          * B858B

* ROMPTR 0B5 10D
* refs (1): B4B39
* Stores those four fields back in IOPAR
IOPutFields:
        :: XLIB ~BINT3;NTHCOMPROM@ 4ROLL XLIB ~BINT3;NTHCOMPROM@ 4UNROLL * B8595
          XLIB IOGetPar DROP 7UNROLL ROTDROPROTDROP 6ROLL DUPTYPEBINT? ITE * B85BA
          :: DROP 5ROLL ;                        * B85E3
          :: 6ROLL DROP XLIB ~BINT2;NTHCOMPROM@ ; * B85F7
          6ROLL 6->list;StoInIPAR ;              * B8616

* ROMPTR 0B5 10E
* refs (1): B4B39
* -> flag: flag -36
XferOverwrite?:
        :: BINT36 TestSysFlag ;                  * B8625  flag -36: RECV renames / RECV overwrites

* ROMPTR 0B5 10F
* refs (1): B4B39
* flag ->
XferOverwrite!:
        :: BINT36 XLIB FlagPut ;                 * B8639

* ROMPTR 0B5 110
* refs (1): B4B39
* -> $path { names }: asks the Kermit server for "DIR /W" and splits the reply. The first line, up to ":\", holds the path; $KERMIT$.TMP is left out of the names
SrvDir:
        :: $ "DIR /W" $ "C" XLIB SrvCmd '        * B8653
* #pos $ -> #start #end | #0: machine code that finds the next name in the reply
          CODE                                   * B868A  143 nibbles
            GOSBVL  POP#                         * B8694
            GOSBVL  SAVPTR                       * B869B
            C=0     A                            * B86A2
            R0=C                                 * B86A4
            GOSBVL  GetStrLenStk                 * B86A7
            ?C<A    A                            * B86AE
            GOYES   SrvDir.L3                    * B86B1
            D=C     A                            * B86B3
            A=A-1   A                            * B86B5
            B=A     A                            * B86B7
            CD1EX                                * B86B9
            A=A+A   A                            * B86BC
            C=C+A   A                            * B86BE
            D1=C                                 * B86C0
            ST=0    4                            * B86C3
SrvDir.loop1:
            GOSUB   DirScanChar                  * B86C6
            GOC     SrvDir.loop1                 * B86CA
            C=B     A                            * B86CD
            R0=C                                 * B86CF
SrvDir.loop2:
            GOSUB   DirScanChar                  * B86D2
            GONC    SrvDir.loop2                 * B86D6
            C=B     A                            * B86D9
            R1=C                                 * B86DB
            GOVLNG  Push2#Loop                   * B86DE
SrvDir.L3:
            A=0     A                            * B86E5
            GOVLNG  PUSH#ALOOP                   * B86E7

* refs (2): B86C6 B86D2
* Steps through one character at D1. Carry set on a blank, tab or newline, else clear. Ends the scan (pushes #0) at end of text, or at a blank straight after a newline, the end of the listing
DirScanChar:
            D=D-1   A                            * B86EE
            GOC     SrvDir.L3                    * B86F0
            B=B+1   A                            * B86F3
            A=DAT1  B                            * B86F5
            D1=D1+  2                            * B86F8
            LC(2)   #20                          * B86FB
            ?C=A    B                            * B86FF
            GOYES   DirScanChar.L1               * B8702
            LC(2)   #09                          * B8704
            ?C=A    B                            * B8708
            GOYES   DirScanChar.L1               * B870B
            C=C+1   A                            * B870D
            ST=1    4                            * B870F
            ?C=A    B                            * B8712
            RTNYES                               * B8715
            ST=0    4                            * B8717
            RTNCC                                * B871A
DirScanChar.L1:
            ?ST=1   4                            * B871C
            GOYES   SrvDir.L3                    * B871F
            RTNSC                                * B8721
          ENDCODE                                * B8723
          2NULLLAM{} BIND 2GETLAM $ ":\\" BINT1 POS$ DUP#0=csedrp * B8723
          :: NULL$ NULL{} ABND ; #1- 2GETLAM NEWLINE$ 3PICK POS$ DUP#0=case * B874F
          :: 2DROP NULL$ NULL{} ABND ;           * B8786
          DUPUNROT 2GETLAM 3UNROLL #1-SUB$ BINT0 ROT BEGIN 2GETLAM SWAP * B87A4
          1GETLAM EVAL DUP#0<> WHILE             * B87D1
          :: DUP4UNROLL #1-SUB$ DUP $ "$KERMIT$.TMP" EQUAL ITE DROP * B87E5
            :: ROT#1+ ROT ;                      * B882A
          ;                                      * B883E
          REPEAT 2DROP {}N ABND ;                * B8843

* ROMPTR 0B5 111
* refs (1): B4B39
* { names } -> { names }: entries that are not [directories]
SrvFiles:
        :: ' NOT XLIB SrvFilter ;                * B885C

* ROMPTR 0B5 112
* refs (1): B4B39
* { names } -> { names }: entries that are [directories]
SrvDirs:
        :: ' NOP XLIB SrvFilter ;                * B887B

* ROMPTR 0B5 113
* refs (1): B4B39
* { names } ob -> { names }: keeps entries by SrvIsDir?'s flag, run through ob
SrvFilter:
        :: SWAP DUPNULL{}? case SWAPDROP         * B889A
          INNERDUP ZERO_DO SWAP XLIB SrvIsDir? SWAPDROP 3PICK #3+PICK EVAL * B88B3
          ITE                                    * B88E1
          :: OVER #1+UNROLL ;                    * B88E6
          :: DROP #1- ;                          * B88FA
          LOOP {}N SWAPDROP ;                    * B890E

* ROMPTR 0B5 114
* refs (1): B4B39
* $ -> $ #len flag: flag TRUE if the name is in square brackets
SrvIsDir?:
        :: DUP CAR$ CHR_[ EQUAL SWAP DUPLEN$ 2DUP SUB$1# # 5D #= 4ROLL AND ; * B8922

* ROMPTR 0B5 115
* refs (1): B4B39
* $data $type -> $reply: sends a Kermit generic command with flag -39 set and translate code 1; IOPAR and the system flags are restored afterwards, also on error. Reply is "" unless it is a string
SrvCmd:
        :: GetIOPAR RCLSYSF 2NULLLAM{} BIND BINT39 ERRSET SetSysFlag %1 * B896D
          6->list;StoInIPAR %1 3UNROLL DOPKT ERRTRAP * B899A
          :: GetIOPAR DROP 2GETLAM 6->list;StoInIPAR 1GETABND STOSYSF ERRJMP ; * B89B3
          GetIOPAR DROP 2GETLAM 6->list;StoInIPAR 1GETABND STOSYSF * B89E0
          DUPTYPECSTR? ITE SWAPDROP DROPNULL$    * B89FE
        ;                                        * B8A12

* ROMPTR 0B5 116
* refs (1): B4B39
* $ -> : Kermit generic C, change directory. Brackets are stripped from a [directory] first
SrvCd:
        :: XLIB SrvIsDir? IT                     * B8A17
          :: SWAP BINT2 3PICK #1-SUB$ SWAP #2- ; * B8A2C
          BINT32 #+ #>CHR >H$ CHR_C >H$ $ "G" XLIB SrvCmd DROP ; * B8A54

* ROMPTR 0B5 117
* refs (1): B4B39
* ob -> : KGET, for a name or a list
XferGet:
        :: XLIB IFCkValArg DUPTYPELIST? ITE kget(li) GETNAME * B8A93
        ;                                        * B8AB7

* ROMPTR 0B5 118
* refs (1): B4B39
* -> : RECN with an empty name
XferRecv:
        :: NULL$TEMP DORECN ;                    * B8ABC

* ROMPTR 0B5 119
* refs (1): B4B39
* ob flagRecv -> : XRECV or XSEND
XferXModem:
        :: SWAP XLIB IFCkValArg SWAP ITE XLIB XRECV XLIB XSEND * B8AD0
          AtUserStack ;                          * B8B05

* ROMPTR 0B5 11A
* refs (1): B4B39
* ob -> : SEND, for a name or a list
XferSend:
        :: XLIB IFCkValArg DUPTYPELIST? ITE SENDLIST SENDNAME * B8B0F
        ;                                        * B8B33

* ROMPTR 0B5 11B
* refs (1): B4B39
* flag #n -> : sets or clears system flag n
FlagPut:
        :: SWAP ITE SetSysFlag ClrSysFlag        * B8B38
        ;                                        * B8B51

* ROMPTR 0B5 11C
* refs (1): B4B39
* -> PRTPAR's elements #n: resets PRTPAR if it is missing, not a list or too short
PrtGetPar:
        :: ' ID PRTPAR Sys@ NOTcase Reset&BreakPRTPAR * B8B56
          DUPTYPELIST? NOTcasedrop Reset&BreakPRTPAR * B8B82
          INNERDUP BINT3 #> NOTcase              * B8B91
          :: NDROP Reset&BreakPRTPAR ;           * B8BA5
        ;                                        * B8BB9

* ROMPTR 0B5 11D
* refs (1): B4B39
~Reset&BreakPRTPAR;DROP:
        :: Reset&BreakPRTPAR DROP ;              * B8BBE

* ROMPTR 0B5 11E
* refs (1): B4B39
* -> the 6 elements of IOPAR: resets it if it is missing, not a list or of the wrong size
IOGetPar:
        :: ' ID IOPAR Sys@ NOTcase ResetIOPAR&-> * B8BD2
          DUPTYPELIST? NOTcasedrop ResetIOPAR&-> * B8BFC
          DUPLENCOMP BINT6 #<> casedrop ResetIOPAR&-> * B8C0B
          INCOMPDROP ;                           * B8C24

* ROMPTR 0B5 11F
* refs (1): B4B39
* Choose list of IR or Wire
IOPortItems:
        { XLIB IOItemIR XLIB IOItemWire }        * B8C2E

* ROMPTR 0B5 120
* refs (1): B4B39
IOItemIR:
        { # BA2C # BA2D TRUE }                   * B8C4E  "Infrared"  "IR"

* ROMPTR 0B5 121
* refs (1): B4B39
IOItemWire:
        { # BA2E # BA2E FALSE }                  * B8C71  "Wire"  "Wire"

* ROMPTR 0B5 122
* refs (1): B4B39
* Choose list of Kermit or XModem
XferProtoItems:
        { XLIB XferItemKermit XLIB XferItemXModem } * B8C94

* ROMPTR 0B5 123
* refs (1): B4B39
XferItemKermit:
        { # BA2F TRUE }                          * B8CB4  "Kermit"

* ROMPTR 0B5 124
* refs (1): B4B39
XferItemXModem:
        { # BA30 FALSE }                         * B8CCD  "XModem"

* ROMPTR 0B5 125
* refs (1): B4B39
* Choose list of baud rates
IOBaudItems:
        { %1200 %2400 %4800 %9600 }              * B8CE6

* ROMPTR 0B5 126
* refs (1): B4B39
* Choose list of parities; the last element of an item is the IOPAR value
IOParityItems:
        { XLIB IOItemNone XLIB IOItemOdd XLIB IOItemEven XLIB IOItemMark * B8D04
          XLIB IOItemSpace }                     * B8D35

* ROMPTR 0B5 127
* refs (1): B4B39
IOItemNone:
        { # BA3A # BA3A %0_2A2B4 }               * B8D45  "None"  "None"

* ROMPTR 0B5 128
* refs (1): B4B39
IOItemOdd:
        { # BA31 # BA31 %1 }                     * B8D68  "Odd"  "Odd"

* ROMPTR 0B5 129
* refs (1): B4B39
IOItemEven:
        { # BA32 # BA32 %2 }                     * B8D8B  "Even"  "Even"

* ROMPTR 0B5 12A
* refs (1): B4B39
IOItemMark:
        { # BA33 # BA33 %3 }                     * B8DAE  "Mark"  "Mark"

* ROMPTR 0B5 12B
* refs (1): B4B39
IOItemSpace:
        { # BA34 # BA35 %4 }                     * B8DD1  "Space"  "Spc"

* ROMPTR 0B5 12C
* refs (1): B4B39
* Choose list of ASCII or Binary
XferFmtItems:
        { XLIB XferItemASCII XLIB XferItemBinary } * B8DF4

* ROMPTR 0B5 12D
* refs (1): B4B39
XferItemASCII:
        { # BA36 # BA37 TRUE }                   * B8E14  "ASCII"  "ASC"

* ROMPTR 0B5 12E
* refs (1): B4B39
XferItemBinary:
        { # BA38 # BA39 FALSE }                  * B8E37  "Binary"  "Bin"

* ROMPTR 0B5 12F
* refs (1): B4B39
* Choose list of translate codes
IOTransItems:
        { XLIB IOTransNone XLIB IOTransNewl XLIB IOTrans159 XLIB IOTrans255 } * B8E5A

* ROMPTR 0B5 130
* refs (1): B4B39
IOTransNone:
        { # BA3A # BA3A %0_2A2B4 }               * B8E90  "None"  "None"

* ROMPTR 0B5 131
* refs (1): B4B39
IOTransNewl:
        { # BA3B # BA3C %1 }                     * B8EB3  "Newline (Ch 10)"  "Newl"

* ROMPTR 0B5 132
* refs (1): B4B39
IOTrans159:
        { # BA3D # BA3E %2 }                     * B8ED6  "Chr 128-159"  "→159"

* ROMPTR 0B5 133
* refs (1): B4B39
IOTrans255:
        { # BA40 # BA3F %3 }                     * B8EF9  "Chr 128-255"  "→255"

* ROMPTR 0B5 134
* refs (1): B4B39
* Choose list of checksum types
IOCksumItems:
        { XLIB IOCksum1 XLIB IOCksum2 XLIB IOCksum3 } * B8F1C

* ROMPTR 0B5 135
* refs (1): B4B39
IOCksum1:
        { # BA41 %1 }                            * B8F47  "One-digit arith"

* ROMPTR 0B5 136
* refs (1): B4B39
IOCksum2:
        { # BA42 %2 }                            * B8F60  "Two-digit arith"

* ROMPTR 0B5 137
* refs (1): B4B39
IOCksum3:
        { # BA43 %3 }                            * B8F79  "Three-digit CRC"

* ROMPTR 0B5 138
* refs (1): B4B39
* -> item %digits: number format and digits from the system flags
ModeNumFmt:
        :: XLIB ModeFmtItems NumbMode #1+ NTHCOMPDROP * B8F92

* ROMPTR 0B5 139
* refs (1): B4B39
* -> #digits: flags -45 to -48, read as one nibble
ModeDigits#:
          CODE                                   * B8FB1  27 nibbles
            GOSBVL  SAVPTR                       * B8FBB
            A=0     A                            * B8FC2
            D0=(5)  #8084E                       * B8FC4
            A=DAT0  1                            * B8FCB
            GOVLNG  PUSH#ALOOP                   * B8FCF
          ENDCODE                                * B8FD6
          UNCOERCE ;                             * B8FD6

* ROMPTR 0B5 13A
* refs (1): B4B39
* -> item
ModeAngle:
        :: DEG? case XLIB ModeItemDeg            * B8FE0
          RAD? case XLIB ModeItemRad             * B8FFA
          XLIB ModeItemGrad ;                    * B900F

* ROMPTR 0B5 13B
* refs (1): B4B39
* -> item
ModeCoord:
        :: BINT16 TestSysFlag NOTcase XLIB ModeItemRect * B901F  flag -16: coordinate system
          BINT15 TestSysFlag NOTcase XLIB ModeItemCyl * B903E  flag -15: coordinate system
          XLIB ModeItemSph ;                     * B9058

* ROMPTR 0B5 13C
* refs (1): B4B39
* -> flag: flag -56 clear
ModeBeep?:
        :: BINT56 TestSysFlag NOT ;              * B9068  flag -56: Standard beep on / Standard beep off

* ROMPTR 0B5 13D
* refs (1): B4B39
* flag ->
ModeBeep!:
        :: BINT56 SWAP ITE ClrSysFlag SetSysFlag * B9081
        ;                                        * B909F

* ROMPTR 0B5 13E
* refs (1): B4B39
* -> flag: flag -40
ModeClock?:
        :: BINT40 TestSysFlag ;                  * B90A4  flag -40: Don't show clock / Show clock

* ROMPTR 0B5 13F
* refs (1): B4B39
* flag ->
ModeClock!:
        :: BINT40 SWAP ITE SetSysFlag ClrSysFlag * B90B8
        ;                                        * B90D6

* ROMPTR 0B5 140
* refs (1): B4B39
* -> flag: flag -51
ModeFM,?:
        :: BINT51 TestSysFlag ;                  * B90DB  flag -51: Fraction mark: . / Fraction mark: ,

* ROMPTR 0B5 141
* refs (1): B4B39
* flag ->
ModeFM,!:
        :: BINT51 SWAP ITE SetSysFlag ClrSysFlag * B90EF
        ;                                        * B910D

* ROMPTR 0B5 142
* refs (1): B4B39
* item -> : sets the angle mode. Not used in this ROM
ModePutAngle:
        :: XLIB ~BINT3;NTHCOMPROM@               * B9112
          { SETDEG xDEG SETRAD xRAD SETGRAD xGRAD } EQLookup DROP BINT1 ::N ; * B9122

* ROMPTR 0B5 143
* refs (1): B4B39
* Choose list of number formats; the last element of an item applies it to %digits
ModeFmtItems:
        { XLIB ModeItemStd XLIB ModeItemFix XLIB ModeItemSci * B9163
          XLIB ModeItemEng }                     * B9189

* ROMPTR 0B5 144
* refs (1): B4B39
ModeItemStd:
        { # B924 # B925                          * B9199  "Standard"  "Std"
          :: DROP DOSTD ; }                      * B91B2

* ROMPTR 0B5 145
* refs (1): B4B39
ModeItemFix:
        { # B926 # B927 DOFIX }                  * B91CB  "Fixed"  "Fix"

* ROMPTR 0B5 146
* refs (1): B4B39
ModeItemSci:
        { # B928 # B929 DOSCI }                  * B91EE  "Scientific"  "Sci"

* ROMPTR 0B5 147
* refs (1): B4B39
ModeItemEng:
        { # B92A # B92B DOENG }                  * B9211  "Engineering"  "Eng"

* ROMPTR 0B5 148
* refs (1): B4B39
* Choose list of digits, 0 to 12
ModeDigitItems:
        { %0_2A2B4 %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 } * B9234

* ROMPTR 0B5 149
* refs (1): B4B39
* Choose list of angle modes
ModeAngleItems:
        { XLIB ModeItemDeg XLIB ModeItemRad XLIB ModeItemGrad } * B927F

* ROMPTR 0B5 14A
* refs (1): B4B39
ModeItemDeg:
        { # B92C # B92D SETDEG }                 * B92AA  "Degrees"  "Deg"

* ROMPTR 0B5 14B
* refs (1): B4B39
ModeItemRad:
        { # B92E # B92F SETRAD }                 * B92CD  "Radians"  "Rad"

* ROMPTR 0B5 14C
* refs (1): B4B39
ModeItemGrad:
        { # B930 # B931 SETGRAD }                * B92F0  "Grads"  "Grad"

* ROMPTR 0B5 14D
* refs (1): B4B39
* Choose list of coordinate systems
ModeCoordItems:
        { XLIB ModeItemRect XLIB ModeItemCyl XLIB ModeItemSph } * B9313

* ROMPTR 0B5 14E
* refs (1): B4B39
ModeItemRect:
        { # B932 XLIB ModeSetRect }              * B933E  "Rectangular"

* ROMPTR 0B5 14F
* refs (1): B4B39
ModeItemCyl:
        { # B933 XLIB ModeSetCyl }               * B935D  "Polar"

* ROMPTR 0B5 150
* refs (1): B4B39
ModeItemSph:
        { # B934 XLIB ModeSetSph }               * B937C  "Spherical"

* ROMPTR 0B5 151
* refs (1): B4B39
ModeSetRect:
        :: BINT16 ClrSysFlag ;                   * B939B  flag -16: coordinate system

* ROMPTR 0B5 152
* refs (1): B4B39
ModeSetCyl:
        :: BINT15 ClrSysFlag BINT16 SetSysFlag ; * B93AF  flag -15: coordinate system  flag -16: coordinate system

* ROMPTR 0B5 153
* refs (1): B4B39
ModeSetSph:
        :: BINT15 SetSysFlag BINT16 SetSysFlag ; * B93CD  flag -15: coordinate system  flag -16: coordinate system

* ROMPTR 0B5 154
* refs (1): B4B39
* Flag numbers shown by the system flags browser, one character each
FlagBrwList:
        $ "\01\02\03\0E\13\14\15\16\1B\1C\1D\1F !\"#$%&'()*+,3456789:;<=>?" * B93EB

* ROMPTR 0B5 155
* refs (1): B4B39
FlagBrwCount:
        # 26                                     * B9441  38

* ROMPTR 0B5 156
* refs (1): B4B39
* #row -> chr: flag number of a browser row
FlagBrw#:
        :: XLIB FlagBrwList SWAP SUB$1# ;        * B944B

* ROMPTR 0B5 157
* refs (1): B4B39
* #flag -> $: browser line for the flag in its current state
FlagBrwText:
        :: DUP XLIB FlagState ITE # B95C # B936  * B946A  "01 Principal value"  "01 General solutions"
          XLIB FlagBrwList ROT #>CHR BINT1 POS$ #1-+ JstGetTHEMESG ; * B9498

* ROMPTR 0B5 158
* refs (1): B4B39
ROMP_0B5_158:
        :: ;                                     * B94C6

* ROMPTR 0B5 159
* refs (1): B4B39
* types -> #: number of variables in this directory that pass VarBrwType?
VarBrwCount:
        :: DUPTYPELIST? ?SKIP ONE{}N             * B94D0
          ' XLIB VarBrwType? BINT1 MINUSONE XLIB BrowseGetVars DUP BINT1 psh * B94E4
          #1+ NDROP ;                            * B9518

* ROMPTR 0B5 15A
* refs (1): B4B39
* Filter of the Var browser: is the variable's type in the list? -1 in the list, or as the type, passes everything
VarBrwType?:
        :: 3PICK ?ROMPTR> XEQTYPE COERCE SWAPDROP 5PICK SWAP' * B9527
          :: DUP MINUSONE #= 3PICK MINUSONE #= OR case2drop TRUE * B954F
            #= ;                                 * B9581
          POSCOMP #0<> ;                         * B958B

* ROMPTR 0B5 15C
* refs (2): B4B39 B4B39
* ob name -> : stores a variable, stripping tags. Both fields must be filled in. Link entries 15B and 15C
VarStoFld:
        :: XLIB IFCkValArg SWAP XLIB IFCkValArg SWAP STRIPTAGSl2 XEQSTOID ; * B959A

* ROMPTR 0B5 15D
* refs (1): B4B39
* id -> $: browser line: name, plus value if flag -59 is clear, cut to 23 characters
VarBrwLine:
        :: DUP ID>$ BINT59 TestSysFlag ITE SWAPDROP * B95CE  flag -59: Show variables / Show names only
          :: $ ": " &$ SWAP XEQRCL XLIB Decomp1Std &$ ; * B95F1
          BINT1 BINT23 SUB$ ;                    * B9628

* ROMPTR 0B5 15E
* refs (1): B4B39
* -> #row #count. Probably: position of the current directory in the tree of directories, and their number
DirBrwPos:
        :: CONTEXT@ BINT0 XLIB DirBrwNext MINUSONE XLIB DirBrwWalk DROP * B963C
          ZEROSWAP #- BINT0 ROT#- SWAP ;         * B966B

* ROMPTR 0B5 15F
* refs (1): B4B39
* Probably: moves n directories back in the tree walk
DirBrwPrev:
        :: XLIB DirBrwWalk ROTROT2DROP ;         * B9689

* ROMPTR 0B5 160
* refs (1): B4B39
* Probably: common tree walker of DirBrwPos and DirBrwPrev
DirBrwWalk:
        :: '                                     * B96A3
          :: BEGIN ?ATTNQUIT DUP MYRAMROMPAIR ITE * B96AD
            :: SWAP PrevNonNull ITE FalseTrue FALSE * B96CB
            ;                                    * B96E9
            TrueTrue                             * B96EE
            UNTIL ;                              * B96F3
          '                                      * B96FD
          :: SWAPDROP SWAP#1-SWAP CONTEXT@ OVER EQ IT * B9702
            :: ROTDROP OVERSWAP ;                * B9725
            OVER#0= NOT?SEMI                     * B9739
            2RDROP TRUE ;                        * B9743
          2SWAP DUPUNROT SWAP BEGIN DUP LastNonNull * B9752
          :: ?SKIP                               * B9770
            :: 5PICK EVAL case COLATRUE          * B977A
            ;                                    * B9793
            BEGIN ?ATTNQUIT DUPTYPERRP? case     * B9798
            :: 5PICK EVAL FALSE RDROP ;          * B97AC
            PrevNonNull ITE FALSE                * B97CA
            :: 5PICK EVAL ;                      * B97D9
            UNTIL TRUE ;                         * B97ED
          UNTIL 4ROLLDROP 4ROLLDROP ;            * B97FC

* ROMPTR 0B5 161
* refs (1): B4B39
* rrp #n -> rrp'. Probably: moves n directories forward in the tree walk; #0 starts at HOME
DirBrwNext:
        :: DUP#0=csedrp                          * B9810
          ::                                     * B981A
            CODE                                 * B981F  23 nibbles
              LC(5)   #80711                     * B9829
              CD1EX                              * B9830
              A=DAT1  A                          * B9833
              D1=C                               * B9836
              GOVLNG  PUSHA                      * B9839
            ENDCODE                              * B9840
          ;                                      * B9840
          SWAP BEGIN DUP MYRAMROMPAIR NOTcase SWAPDROP * B9845
          DUPUNROT LastNonNull DROP BEGIN ?ATTNQUIT 2DUPEQ ITE FALSE * B9863
          :: DUPTYPERRP? NOTcaseTRUE ROTDROP     * B988B
            DUPUNROT TRUE ;                      * B989F
          WHILE                                  * B98AE
          :: PrevNonNull DROP ; REPEAT DROP MYRAMROMPAIR DROPOVER EQ BEGIN * B98B3
          OVERSWAP ITE DROPFALSE LastNonNull     * B98E5
          WHILE                                  * B98F9
          :: BINT0 3UNROLL BEGIN DUPTYPERRP? IT  * B98FE
            :: SWAPDROPDUP ROT#1+UNROT ;         * B991C
            PrevNonNull NOT_UNTIL SWAP #0= ;     * B9930
          REPEAT SWAP#1-SWAP OVER#0= UNTIL SWAPDROP ; * B9949

* ROMPTR 0B5 162
* refs (1): B4B39
* name|-1 -> : CRDIR, with the empty-field check
VarCrDir:
        :: XLIB IFCkValArg CREATEDIR ;           * B9967

* ROMPTR 0B5 163
* refs (1): B4B39
* rrp -> $: browser line: name indented by depth, "HOME" for the root, cut to 23 characters
DirBrwLine:
        :: BINT0 OVER BEGIN MYRAMROMPAIR NOT DUP ?SKIP ROT#1+UNROT * B9981
          UNTIL SWAPDUP SYSRRP? case             * B99AE
          :: 2DROP $ "HOME" ;                    * B99C2
          RAM-WORDNAME ID>$ SWAP #2* Blank$ !insert$ BINT1 BINT23 SUB$ ; * B99E3

* ROMPTR 0B5 164
* refs (1): B4B39
* vars path -> : COPYVAR. Copies variables to a directory path
CopyVars:
        :: ' NOP XLIB CopyMoveVars ;             * B9A15

* ROMPTR 0B5 165
* refs (1): B4B39
* vars path ob -> : copies variables along a path, running ob on each source variable. An error restores the directory and the variable. A directory named in the path is created if needed; a clash is the "Name Conflict" error
CopyMoveVars:
        :: SWAPROT XLIB IFCkValArg SWAP XLIB IFCkValArg DUPTYPEIDNT? IT * B9A34
          :: BINT1 {}N ;                         * B9A63
          DUPNULLCOMP? caseSIZEERR ZEROZERO      * B9A77
          5ROLL CONTEXT@ 4NULLLAM{} BIND ERRSET  * B9A86
          :: INNERCOMP #1-SWAP OVER #2+UNROLL DUP#0=ITE DROP * B9A9F
            :: ZERO_DO ISTOP-INDEX ROLL XLIB EnterPathDir NOTcase * B9AC2
              :: caseSIZEERR SETNONEXTERR        * B9AE6
              ;                                  * B9AF5
              LOOP ;                             * B9AFA
            XLIB EnterPathDir CONTEXT@ 3UNROLL ITE ZEROSWAP * B9B04
            :: DROP SWAPROT DUPTYPELIST? NOT?SEMI * B9B23
              DUPLENCOMP #1= ?SEMI               * B9B3C
              ROTDROP SWAP2DUP EQUALPOSCOMP #0=?SKIP * B9B4B
              :: # 13C ERROROUT ; DUP CREATEDIR XEQRCL SWAP ZEROSWAP ; * B9B5F  "Name Conflict"
            DUPTYPELIST? ITE INNERCOMP BINT1     * B9B96
            DUP#0=csDROP ZERO_DO DUPTYPEIDNT? NcaseTYPEERR DUP * B9BAA
            3PUTLAM 1GETLAM CONTEXT! DUP XEQRCL DUP 4PUTLAM 2GETLAM EVAL * B9BC3
            ERRSET                               * B9BF0
            :: ISTOP-INDEX #3+PICK CONTEXT! ISTOP-INDEX #2+PICK DUP#0=ITE * B9BF5
              DROPSWAP ROTDROP STRIPTAGSl2 XEQSTOID ; * B9C18
            ERRTRAP                              * B9C31
            :: 1GETLAM CONTEXT! 4GETLAM 3GETLAM 2GETLAM TYPECOL? IT XEQSTOID * B9C36
              ERRJMP ;                           * B9C63
            LOOP ;                               * B9C6D
          ERRTRAP                                * B9C77
          :: 1GETABND CONTEXT! ERRJMP ; 1GETABND CONTEXT! 2DROP ; * B9C7C

* ROMPTR 0B5 166
* refs (1): B4B39
* ob -> flag flag. Probably: enters one element of a path: a directory name, HOME or UPDIR
EnterPathDir:
        :: DUPTYPEIDNT? case                     * B9CA9
          :: dup;RclInVars(gn)? NOTcase FalseFalse * B9CB8
            TYPERRP? NOTcase TrueFalse           * B9CCC
            EVAL TRUE ;                          * B9CDB
          ' xHOME OVER EQ ' xUPDIR 3PICK EQOR NOTcase SETTYPEERR * B9CEA
          EvalNoCK TRUE ;                        * B9D1C

* ROMPTR 0B5 167
* refs (1): B4B39
* vars path -> : MOVEVAR. Copies, then purges each source variable
MoveVars:
        :: '                                     * B9D2B
          :: DUPTYPERRP? 3PICKSWAP ITE DIRARGERR ?PURGE_HERE * B9D35
          ;                                      * B9D53
          XLIB CopyMoveVars ;                    * B9D58

* ROMPTR 0B5 168
* refs (1): B4B39
* name|{names} -> : purge for the Var browser
VarPurge:
        :: DUPTYPEIDNT? case ?PURGE_HERE         * B9D68
          purge(li) ;                            * B9D7C

* ROMPTR 0B5 169
* refs (1): B4B39
* name|{names} -> #: total size of the variables
VarBytes:
        :: DUPTYPELIST? ITE INNERCOMP BINT1      * B9D86
          ZEROSWAP DUP#0=csDROP ZERO_DO SWAP VARSIZE SWAPDROP COERCE #+ LOOP ; * B9D9F

* ROMPTR 0B5 16A
* refs (1): B4B39
* -> #: bytes free, after a garbage collection
FreeMem#:
        :: GARBAGE MEM #2/ ;                     * B9DD1

LIB0B5.hash:
        CON(5)  DOHSTR                           * B9DEA  hash table of library 0B5
        LENGTH                                   * B9DEF  length, to #B9E4E
        CON(5)  0                                * B9DF4  names of length 1
        CON(5)  0                                * B9DF9  names of length 2
        CON(5)  0                                * B9DFE  names of length 3
        CON(5)  0                                * B9E03  names of length 4
        CON(5)  0                                * B9E08  names of length 5
        CON(5)  0                                * B9E0D  names of length 6
        CON(5)  0                                * B9E12  names of length 7
        CON(5)  0                                * B9E17  names of length 8
        CON(5)  0                                * B9E1C  names of length 9
        CON(5)  0                                * B9E21  names of length 10
        CON(5)  0                                * B9E26  names of length 11
        CON(5)  0                                * B9E2B  names of length 12
        CON(5)  0                                * B9E30  names of length 13
        CON(5)  0                                * B9E35  names of length 14
        CON(5)  0                                * B9E3A  names of length 15
        CON(5)  0                                * B9E3F  names of length 16
        REL(5)  LIB0B5.hash.L1                   * B9E44  end of the names
LIB0B5.hash.L1:
        CON(5)  0                                * B9E49  command 000 has no name
        ENDLENGTH                                * B9E4E

LIB0B5.link:
        CON(5)  DOHSTR                           * B9E4E  link table of library 0B5
        LENGTH                                   * B9E53  length, to #BA56F
        REL(5)  SlvGetEQ                         * B9E58  000 
        REL(5)  SlvPutEQ                         * B9E5D  001 
        REL(5)  SlvEqVars                        * B9E62  002 
        REL(5)  SlvSolveVar                      * B9E67  003 
        REL(5)  SlvEvalEq                        * B9E6C  004 
        REL(5)  ~SAFE@                           * B9E71  005 
        REL(5)  SlvStoVar                        * B9E76  006 
        REL(5)  PolyCoef>Sym                     * B9E7B  007 
        REL(5)  IFCkVal                          * B9E80  008 
        REL(5)  PolyRoots>Sym                    * B9E85  009 
        REL(5)  PolyRoots>Coef                   * B9E8A  00A 
        REL(5)  PolyCoef>Roots                   * B9E8F  00B 
        REL(5)  IFEditMatrix                     * B9E94  00C 
        REL(5)  SysSolveAxB                      * B9E99  00D 
        REL(5)  ~MAT*                            * B9E9E  00E 
        REL(5)  TvmGetN                          * B9EA3  00F 
        REL(5)  TvmPutN                          * B9EA8  010 
        REL(5)  IFSkipNoVal                      * B9EAD  011 
        REL(5)  TvmGetI%YR                       * B9EB2  012 
        REL(5)  TvmPutI%YR                       * B9EB7  013 
        REL(5)  TvmGetPV                         * B9EBC  014 
        REL(5)  TvmPutPV                         * B9EC1  015 
        REL(5)  TvmGetPMT                        * B9EC6  016 
        REL(5)  TvmPutPMT                        * B9ECB  017 
        REL(5)  TvmGetFV                         * B9ED0  018 
        REL(5)  TvmPutFV                         * B9ED5  019 
        REL(5)  TvmGetPYR                        * B9EDA  01A 
        REL(5)  TvmPutPYR                        * B9EDF  01B 
        REL(5)  TvmGetBegEnd                     * B9EE4  01C 
        REL(5)  TvmPutBegEnd                     * B9EE9  01D 
        REL(5)  TvmSolveN                        * B9EEE  01E 
        REL(5)  TvmSolveI%YR                     * B9EF3  01F 
        REL(5)  TvmSolvePV                       * B9EF8  020 
        REL(5)  TvmSolvePMT                      * B9EFD  021 
        REL(5)  TvmSolveFV                       * B9F02  022 
        REL(5)  TvmAmort                         * B9F07  023 
        REL(5)  TvmFldFmt                        * B9F0C  024 
        REL(5)  TvmBegEndItems                   * B9F11  025 
        REL(5)  TvmItemBegin                     * B9F16  026 
        REL(5)  TvmItemEnd                       * B9F1B  027 
        REL(5)  GetEQ                            * B9F20  028 
        REL(5)  PutEQ                            * B9F25  029 
        REL(5)  GetFirstEq                       * B9F2A  02A 
        REL(5)  FirstEq                          * B9F2F  02B 
        REL(5)  GetDeq3                          * B9F34  02C 
        REL(5)  PutDeq3                          * B9F39  02D 
        REL(5)  PltPutIndep                      * B9F3E  02E 
        REL(5)  PltPutIndep                      * B9F43  02F 
        REL(5)  PltIndepRng                      * B9F48  030 
        REL(5)  PltIndepRngRev                   * B9F4D  031 
        REL(5)  PltIndepRngT                     * B9F52  032 
        REL(5)  PltPutIndepRng                   * B9F57  033 
        REL(5)  PltPutIndepRng                   * B9F5C  034 
        REL(5)  PltPutIndepRng                   * B9F61  035 
        REL(5)  PltHView                         * B9F66  036 
        REL(5)  PltPutDepend                     * B9F6B  037 
        REL(5)  PltPutDepend                     * B9F70  038 
        REL(5)  PltPutDepend                     * B9F75  039 
        REL(5)  PltDepRng                        * B9F7A  03A 
        REL(5)  PltPutDepRng                     * B9F7F  03B 
        REL(5)  PltVView                         * B9F84  03C 
        REL(5)  PltRes>Fld                       * B9F89  03D 
        REL(5)  PltRes>Fld                       * B9F8E  03E 
        REL(5)  PltPutRes                        * B9F93  03F 
        REL(5)  PltPixelStep                     * B9F98  040 
        REL(5)  PltPixPerUnit                    * B9F9D  041 
        REL(5)  PltDefStep                       * B9FA2  042 
        REL(5)  PltDefStepPolar                  * B9FA7  043 
        REL(5)  PltPutResNum                     * B9FAC  044 
        REL(5)  PltPutResNum                     * B9FB1  045 
        REL(5)  PltDefWidth                      * B9FB6  046 
        REL(5)  PltDefWidth                      * B9FBB  047 
        REL(5)  StatGetDAT                       * B9FC0  048 
        REL(5)  StatGetDAT                       * B9FC5  049 
        REL(5)  StatPutDAT                       * B9FCA  04A 
        REL(5)  PltPtypeItem                     * B9FCF  04B 
        REL(5)  PltPtypeItem                     * B9FD4  04C 
        REL(5)  PltPtypeItem                     * B9FD9  04D 
        REL(5)  PltPtypeItem                     * B9FDE  04E 
        REL(5)  PltPtypeItem                     * B9FE3  04F 
        REL(5)  PltPtypeItems                    * B9FE8  050 
        REL(5)  PltItemFUNCTION                  * B9FED  051 
        REL(5)  PltItemPOLAR                     * B9FF2  052 
        REL(5)  PltItemCONIC                     * B9FF7  053 
        REL(5)  PltItemTRUTH                     * B9FFC  054 
        REL(5)  PltItemPARAMETRIC                * BA001  055 
        REL(5)  PltItemDIFFEQ                    * BA006  056 
        REL(5)  PltItemHISTOGRAM                 * BA00B  057 
        REL(5)  PltItemBAR                       * BA010  058 
        REL(5)  PltItemSCATTER                   * BA015  059 
        REL(5)  PltItemSLOPEFIELD                * BA01A  05A 
        REL(5)  PltItemWIREFRAME                 * BA01F  05B 
        REL(5)  PltItemPCONTOUR                  * BA024  05C 
        REL(5)  PltItemYSLICE                    * BA029  05D 
        REL(5)  PltItemGRIDMAP                   * BA02E  05E 
        REL(5)  PltItemPARSURFACE                * BA033  05F 
        REL(5)  PltConnect?                      * BA038  060 
        REL(5)  PltConnect!                      * BA03D  061 
        REL(5)  PltSimult?                       * BA042  062 
        REL(5)  PltSimult!                       * BA047  063 
        REL(5)  DeqInitVal                       * BA04C  064 
        REL(5)  DeqPutInit                       * BA051  065 
        REL(5)  DeqSolveRKF                      * BA056  066 
        REL(5)  DeqSolveRRK                      * BA05B  067 
        REL(5)  DeqTol                           * BA060  068 
        REL(5)  DeqPutTol                        * BA065  069 
        REL(5)  PltTicks>Fld                     * BA06A  06A 
        REL(5)  PltPutTicks                      * BA06F  06B 
        REL(5)  PltGetAxesLbl                    * BA074  06C 
        REL(5)  PltPutAxesLbl                    * BA079  06D 
        REL(5)  PltGetAxesCtr                    * BA07E  06E 
        REL(5)  PltPutAxesCtr                    * BA083  06F 
        REL(5)  PltAxes?                         * BA088  070 
        REL(5)  PltAxes!                         * BA08D  071 
        REL(5)  DeqGetPlotVars                   * BA092  072 
        REL(5)  Deq$>%                           * BA097  073 
        REL(5)  DeqPutPlotVars                   * BA09C  074 
        REL(5)  PltGetZoom                       * BA0A1  075 
        REL(5)  PltPutZoom                       * BA0A6  076 
        REL(5)  PltReset                         * BA0AB  077 
        REL(5)  ~DOERASE                         * BA0B0  078 
        REL(5)  PltDraw                          * BA0B5  079 
        REL(5)  DeqDraw                          * BA0BA  07A 
        REL(5)  RompLookup                       * BA0BF  07B 
        REL(5)  VparNumX@                        * BA0C4  07C 
        REL(5)  VparNumX!                        * BA0C9  07D 
        REL(5)  VparNumY@                        * BA0CE  07E 
        REL(5)  VparNumY!                        * BA0D3  07F 
        REL(5)  VparXvol@                        * BA0D8  080 
        REL(5)  VparXvol!                        * BA0DD  081 
        REL(5)  VparYvol@                        * BA0E2  082 
        REL(5)  VparYvol!                        * BA0E7  083 
        REL(5)  VparZvol@                        * BA0EC  084 
        REL(5)  VparZvol!                        * BA0F1  085 
        REL(5)  VparEye@                         * BA0F6  086 
        REL(5)  VparEye!                         * BA0FB  087 
        REL(5)  VparXXrng@                       * BA100  088 
        REL(5)  VparXXrng!                       * BA105  089 
        REL(5)  VparYYrng@                       * BA10A  08A 
        REL(5)  VparYYrng!                       * BA10F  08B 
        REL(5)  VparVals                         * BA114  08C 
        REL(5)  VparDefault>                     * BA119  08D 
        REL(5)  VparDefaults                     * BA11E  08E 
        REL(5)  VparGet                          * BA123  08F 
        REL(5)  VparPut                          * BA128  090 
        REL(5)  VparSto                          * BA12D  091 
        REL(5)  SymFGetExpr                      * BA132  092 
        REL(5)  SymFPutExpr                      * BA137  093 
        REL(5)  SymFSymbolic?                    * BA13C  094 
        REL(5)  SymFPrincipal?                   * BA141  095 
        REL(5)  SymFPrincipal!                   * BA146  096 
        REL(5)  SymFIntegrate                    * BA14B  097 
        REL(5)  SymFDeriv                        * BA150  098 
        REL(5)  SymFDerivStep                    * BA155  099 
        REL(5)  SymFTaylor                       * BA15A  09A 
        REL(5)  SymFIsol                         * BA15F  09B 
        REL(5)  SymFQuad                         * BA164  09C 
        REL(5)  SymFColct                        * BA169  09D 
        REL(5)  SymFExpan                        * BA16E  09E 
        REL(5)  SymFMatch                        * BA173  09F 
        REL(5)  SymFResultItems                  * BA178  0A0 
        REL(5)  SymFItemSymb                     * BA17D  0A1 
        REL(5)  SymFItemNum                      * BA182  0A2 
        REL(5)  TimNow                           * BA187  0A3 
        REL(5)  Tim%>Fields                      * BA18C  0A4 
        REL(5)  TimSetTime                       * BA191  0A5 
        REL(5)  TimToday                         * BA196  0A6 
        REL(5)  Date>Fields                      * BA19B  0A7 
        REL(5)  TimSetDate                       * BA1A0  0A8 
        REL(5)  TimMonthDays                     * BA1A5  0A9 
        REL(5)  TimYear%                         * BA1AA  0AA 
        REL(5)  TimDayOfWeek                     * BA1AF  0AB 
        REL(5)  TimStoAlarm                      * BA1B4  0AC 
        REL(5)  Tim24h!                          * BA1B9  0AD 
        REL(5)  TimDateFmt@                      * BA1BE  0AE 
        REL(5)  TimDateFmt!                      * BA1C3  0AF 
        REL(5)  TimDayItems                      * BA1C8  0B0 
        REL(5)  TimYearItems                     * BA1CD  0B1 
        REL(5)  TimMinItems                      * BA1D2  0B2 
        REL(5)  AlmMultItems                     * BA1D7  0B3 
        REL(5)  TimHourItems                     * BA1DC  0B4 
        REL(5)  TimAMPMItems                     * BA1E1  0B5 
        REL(5)  TimItemAM                        * BA1E6  0B6 
        REL(5)  TimItemPM                        * BA1EB  0B7 
        REL(5)  TimItem24h                       * BA1F0  0B8 
        REL(5)  TimMonthItems                    * BA1F5  0B9 
        REL(5)  TimMonthItems~1                  * BA1FA  0BA 
        REL(5)  TimMonthItems~2                  * BA1FF  0BB 
        REL(5)  TimMonthItems~3                  * BA204  0BC 
        REL(5)  TimMonthItems~4                  * BA209  0BD 
        REL(5)  TimMonthItems~5                  * BA20E  0BE 
        REL(5)  TimMonthItems~6                  * BA213  0BF 
        REL(5)  TimMonthItems~7                  * BA218  0C0 
        REL(5)  TimMonthItems~8                  * BA21D  0C1 
        REL(5)  TimMonthItems~9                  * BA222  0C2 
        REL(5)  TimMonthItems~10                 * BA227  0C3 
        REL(5)  TimMonthItems~11                 * BA22C  0C4 
        REL(5)  TimMonthItems~12                 * BA231  0C5 
        REL(5)  AlmUnitItems                     * BA236  0C6 
        REL(5)  AlmUnitWeek                      * BA23B  0C7 
        REL(5)  TicksPerWeek                     * BA240  0C8 
        REL(5)  AlmUnitDay                       * BA245  0C9 
        REL(5)  TicksPerDay                      * BA24A  0CA 
        REL(5)  AlmUnitHour                      * BA24F  0CB 
        REL(5)  TicksPerHour                     * BA254  0CC 
        REL(5)  AlmUnitMin                       * BA259  0CD 
        REL(5)  TicksPerMin                      * BA25E  0CE 
        REL(5)  AlmUnitSec                       * BA263  0CF 
        REL(5)  TicksPerSec                      * BA268  0D0 
        REL(5)  AlmUnitNames                     * BA26D  0D1 
        REL(5)  TimDateFmtItems                  * BA272  0D2 
        REL(5)  TimItemMDY                       * BA277  0D3 
        REL(5)  TimItemDMY                       * BA27C  0D4 
        REL(5)  AlmCount                         * BA281  0D5 
        REL(5)  AlmGet                           * BA286  0D6 
        REL(5)  AlmLine                          * BA28B  0D7 
        REL(5)  AlmMsg                           * BA290  0D8 
        REL(5)  AlmTime                          * BA295  0D9 
        REL(5)  AlmDate                          * BA29A  0DA 
        REL(5)  AlmRepeat                        * BA29F  0DB 
        REL(5)  AlmDelete                        * BA2A4  0DC 
        REL(5)  StatGetDAT2                      * BA2A9  0DD 
        REL(5)  StatPutDAT2                      * BA2AE  0DE 
        REL(5)  StatGetFit                       * BA2B3  0DF 
        REL(5)  StatGetCols                      * BA2B8  0E0 
        REL(5)  ~STATCOL                         * BA2BD  0E1 
        REL(5)  StatFldMean                      * BA2C2  0E2 
        REL(5)  StatFldSDev                      * BA2C7  0E3 
        REL(5)  StatFldVar                       * BA2CC  0E4 
        REL(5)  StatFldTotal                     * BA2D1  0E5 
        REL(5)  StatFldMax                       * BA2D6  0E6 
        REL(5)  StatFldMin                       * BA2DB  0E7 
        REL(5)  StatBins                         * BA2E0  0E8 
        REL(5)  StatFitResults                   * BA2E5  0E9 
        REL(5)  ~STATPREDX                       * BA2EA  0EA 
        REL(5)  ~STATPREDY                       * BA2EF  0EB 
        REL(5)  ~STATX                           * BA2F4  0EC 
        REL(5)  ~STATY                           * BA2F9  0ED 
        REL(5)  ~STATXX                          * BA2FE  0EE 
        REL(5)  ~STATYY                          * BA303  0EF 
        REL(5)  ~STATXY                          * BA308  0F0 
        REL(5)  ~STATN                           * BA30D  0F1 
        REL(5)  StatTypeItems                    * BA312  0F2 
        REL(5)  StatItemSample                   * BA317  0F3 
        REL(5)  StatItemPop                      * BA31C  0F4 
        REL(5)  StatFitItems                     * BA321  0F5 
        REL(5)  StatItemLin                      * BA326  0F6 
        REL(5)  StatItemLog                      * BA32B  0F7 
        REL(5)  StatItemExp                      * BA330  0F8 
        REL(5)  StatItemPwr                      * BA335  0F9 
        REL(5)  StatItemBest                     * BA33A  0FA 
        REL(5)  XferSendHP48                     * BA33F  0FB 
        REL(5)  XferSet48                        * BA344  0FC 
        REL(5)  XferRestoreIO                    * BA349  0FD 
        REL(5)  IFCkValArg                       * BA34E  0FE 
        REL(5)  XferGetHP48                      * BA353  0FF 
        REL(5)  PrtGetPort                       * BA358  100 
        REL(5)  PrtPutPort                       * BA35D  101 
        REL(5)  PrtPutDelay                      * BA362  102 
        REL(5)  PrtGetDelayWidth                 * BA367  103 
        REL(5)  PrtLinefeed?                     * BA36C  104 
        REL(5)  PrtLinefeed!                     * BA371  105 
        REL(5)  PrtPutWidth                      * BA376  106 
        REL(5)  PrtObj                           * BA37B  107 
        REL(5)  XferGetPort                      * BA380  108 
        REL(5)  XferPutPort                      * BA385  109 
        REL(5)  XferGetFormat                    * BA38A  10A 
        REL(5)  XferPutFormat                    * BA38F  10B 
        REL(5)  IOGetFields                      * BA394  10C 
        REL(5)  IOPutFields                      * BA399  10D 
        REL(5)  XferOverwrite?                   * BA39E  10E 
        REL(5)  XferOverwrite!                   * BA3A3  10F 
        REL(5)  SrvDir                           * BA3A8  110 
        REL(5)  SrvFiles                         * BA3AD  111 
        REL(5)  SrvDirs                          * BA3B2  112 
        REL(5)  SrvFilter                        * BA3B7  113 
        REL(5)  SrvIsDir?                        * BA3BC  114 
        REL(5)  SrvCmd                           * BA3C1  115 
        REL(5)  SrvCd                            * BA3C6  116 
        REL(5)  XferGet                          * BA3CB  117 
        REL(5)  XferRecv                         * BA3D0  118 
        REL(5)  XferXModem                       * BA3D5  119 
        REL(5)  XferSend                         * BA3DA  11A 
        REL(5)  FlagPut                          * BA3DF  11B 
        REL(5)  PrtGetPar                        * BA3E4  11C 
        REL(5)  ~Reset&BreakPRTPAR;DROP          * BA3E9  11D 
        REL(5)  IOGetPar                         * BA3EE  11E 
        REL(5)  IOPortItems                      * BA3F3  11F 
        REL(5)  IOItemIR                         * BA3F8  120 
        REL(5)  IOItemWire                       * BA3FD  121 
        REL(5)  XferProtoItems                   * BA402  122 
        REL(5)  XferItemKermit                   * BA407  123 
        REL(5)  XferItemXModem                   * BA40C  124 
        REL(5)  IOBaudItems                      * BA411  125 
        REL(5)  IOParityItems                    * BA416  126 
        REL(5)  IOItemNone                       * BA41B  127 
        REL(5)  IOItemOdd                        * BA420  128 
        REL(5)  IOItemEven                       * BA425  129 
        REL(5)  IOItemMark                       * BA42A  12A 
        REL(5)  IOItemSpace                      * BA42F  12B 
        REL(5)  XferFmtItems                     * BA434  12C 
        REL(5)  XferItemASCII                    * BA439  12D 
        REL(5)  XferItemBinary                   * BA43E  12E 
        REL(5)  IOTransItems                     * BA443  12F 
        REL(5)  IOTransNone                      * BA448  130 
        REL(5)  IOTransNewl                      * BA44D  131 
        REL(5)  IOTrans159                       * BA452  132 
        REL(5)  IOTrans255                       * BA457  133 
        REL(5)  IOCksumItems                     * BA45C  134 
        REL(5)  IOCksum1                         * BA461  135 
        REL(5)  IOCksum2                         * BA466  136 
        REL(5)  IOCksum3                         * BA46B  137 
        REL(5)  ModeNumFmt                       * BA470  138 
        REL(5)  ModeDigits#                      * BA475  139 
        REL(5)  ModeAngle                        * BA47A  13A 
        REL(5)  ModeCoord                        * BA47F  13B 
        REL(5)  ModeBeep?                        * BA484  13C 
        REL(5)  ModeBeep!                        * BA489  13D 
        REL(5)  ModeClock?                       * BA48E  13E 
        REL(5)  ModeClock!                       * BA493  13F 
        REL(5)  ModeFM,?                         * BA498  140 
        REL(5)  ModeFM,!                         * BA49D  141 
        REL(5)  ModePutAngle                     * BA4A2  142 
        REL(5)  ModeFmtItems                     * BA4A7  143 
        REL(5)  ModeItemStd                      * BA4AC  144 
        REL(5)  ModeItemFix                      * BA4B1  145 
        REL(5)  ModeItemSci                      * BA4B6  146 
        REL(5)  ModeItemEng                      * BA4BB  147 
        REL(5)  ModeDigitItems                   * BA4C0  148 
        REL(5)  ModeAngleItems                   * BA4C5  149 
        REL(5)  ModeItemDeg                      * BA4CA  14A 
        REL(5)  ModeItemRad                      * BA4CF  14B 
        REL(5)  ModeItemGrad                     * BA4D4  14C 
        REL(5)  ModeCoordItems                   * BA4D9  14D 
        REL(5)  ModeItemRect                     * BA4DE  14E 
        REL(5)  ModeItemCyl                      * BA4E3  14F 
        REL(5)  ModeItemSph                      * BA4E8  150 
        REL(5)  ModeSetRect                      * BA4ED  151 
        REL(5)  ModeSetCyl                       * BA4F2  152 
        REL(5)  ModeSetSph                       * BA4F7  153 
        REL(5)  FlagBrwList                      * BA4FC  154 
        REL(5)  FlagBrwCount                     * BA501  155 
        REL(5)  FlagBrw#                         * BA506  156 
        REL(5)  FlagBrwText                      * BA50B  157 
        REL(5)  ROMP_0B5_158                     * BA510  158 
        REL(5)  VarBrwCount                      * BA515  159 
        REL(5)  VarBrwType?                      * BA51A  15A 
        REL(5)  VarStoFld                        * BA51F  15B 
        REL(5)  VarStoFld                        * BA524  15C 
        REL(5)  VarBrwLine                       * BA529  15D 
        REL(5)  DirBrwPos                        * BA52E  15E 
        REL(5)  DirBrwPrev                       * BA533  15F 
        REL(5)  DirBrwWalk                       * BA538  160 
        REL(5)  DirBrwNext                       * BA53D  161 
        REL(5)  VarCrDir                         * BA542  162 
        REL(5)  DirBrwLine                       * BA547  163 
        REL(5)  CopyVars                         * BA54C  164 
        REL(5)  CopyMoveVars                     * BA551  165 
        REL(5)  EnterPathDir                     * BA556  166 
        REL(5)  MoveVars                         * BA55B  167 
        REL(5)  VarPurge                         * BA560  168 
        REL(5)  VarBytes                         * BA565  169 
        REL(5)  FreeMem#                         * BA56A  16A 
        ENDLENGTH                                * BA56F
        ENDLENGTH                                * BA56F

        LENGTH                                   * BA56F  library object without its prolog (its place is the end of the link table before): length, to #BE9B4
        CON(2)  0                                * BA574  no title
