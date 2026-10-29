* HP 48GX ROM revision R, #8C9F6-#8D27B: Library part 0F1
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TRUTH SCATTER POLAR_8C9FD PARAMETRIC HISTOGRAM BAR
* Follows on from the previous file (at #8C9F6 in the original ROM).

* ROMPTR 0F1 035 POLAR
* refs (1): 8999A
        CON(1)  12                               * 8C9F6  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C9F7  library
        CON(3)  #035                             * 8C9FA  command
        RPL
POLAR_8C9FD:
        :: CK0 'IDPOLAR PUTPTYPE ;               * 8C9FD

        { FALSE OBJ_4BA0D NOP TRUE               * 8CA16
          { OBJ_47116 OBJ_0C622 OBJ_737F1        * 8CA2F
            { OBJ_73DE8 OBJ_73A8F }              * 8CA43
            :: BINT25 GETLAM PTR NULL:: EQUALcasedrop Message60E * 8CA57
              15GETLAM SWAP %>C% ;               * 8CA75
          }                                      * 8CA89
          FALSE OBJ_4B6C5                        * 8CA8E
          :: BINT31 TestSysFlag ITE              * 8CA98
            :: ' OBJ_4CE0B ;                     * 8CAAC
            :: ' OBJ_4C34B ;                     * 8CAC0
          ;                                      * 8CAD4
          :: RAD? ITE % 3.49065850399E-2 %2      * 8CAD9
          ;                                      * 8CB02
          FALSE FALSE FALSE OBJ_73211 OBJ_73270 ROMPTR 0F1 03F OBJ_73526 * 8CB07
          OBJ_48DCE }                            * 8CB30

* ROMPTR 0F1 036
* refs (1): 8999A
        CON(1)  12                               * 8CB3A  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CB3B  library
        CON(3)  #036                             * 8CB3E  command
PARAMETRIC:
        :: CK0 'IDPARAMETER PUTPTYPE ;           * 8CB41

        { FALSE OBJ_4BE9F NOP TRUE               * 8CB5A
          { OBJ_47170 OBJ_0C6BD OBJ_737F1        * 8CB73
            { OBJ_73D84 OBJ_73A35 }              * 8CB87
            :: BINT25 GETLAM PTR NULL:: EQUALcasedrop Message60E * 8CB9B
              15GETLAM SWAP TWO{}N ;             * 8CBB9
          }                                      * 8CBCD
          FALSE OBJ_4B6C5                        * 8CBD2
          :: BINT31 TestSysFlag ITE              * 8CBDC
            :: ' OBJ_4CE0B ;                     * 8CBF0
            :: ' OBJ_4C34B ;                     * 8CC04
          ;                                      * 8CC18
          :: 16GETLAM 15GETLAM %- BINT130 UNCOERCE %/ ; FALSE FALSE FALSE * 8CC1D
          OBJ_73211 OBJ_73270 ROMPTR 0F1 03F OBJ_73526 OBJ_48DCE } * 8CC54

* ROMPTR 0F1 037
* refs (1): 8999A
        CON(1)  12                               * 8CC78  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CC79  library
        CON(3)  #037                             * 8CC7C  command
TRUTH:
        :: CK0 'IDTRUTH PUTPTYPE ;               * 8CC7F

        { FALSE OBJ_4C4B8 NOP TRUE NULL{} FALSE OBJ_4B6C5 * 8CC98
          :: BINT31 TestSysFlag ITE              * 8CCC0
            :: ' OBJ_4CE0B ;                     * 8CCD4
            :: ' OBJ_4C34B ;                     * 8CCE8
          ;                                      * 8CCFC
          :: %%1 10GETLAM %%/>% ; FALSE TRUE TRUE OBJ_73211 OBJ_73270 * 8CD01
          ROMPTR 0F1 03F OBJ_73594 NOP }         * 8CD33

* ROMPTR 0F1 038
* refs (1): 8999A
        CON(1)  12                               * 8CD4D  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CD4E  library
        CON(3)  #038                             * 8CD51  command
SCATTER:
        :: CK0 'IDSCATTER PUTPTYPE ;             * 8CD54

        { FALSE                                  * 8CD6D
          :: DROP OBJ_4C8D1 ; NOP TRUE NULL{} TRUE OBJ_4B6C5 * 8CD77
          :: BINT31 TestSysFlag ITE              * 8CDA4
            :: ' OBJ_4CE0B ;                     * 8CDB8
            :: ' OBJ_4C34B ;                     * 8CDCC
          ;                                      * 8CDE0
          :: %%1 10GETLAM %%/>% ; TRUE FALSE FALSE OBJ_73211 OBJ_73270 * 8CDE5
          ROMPTR 0F1 03F OBJ_7355D OBJ_48E28 }   * 8CE17

* ROMPTR 0F1 039
* refs (1): 8999A
        CON(1)  12                               * 8CE31  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CE32  library
        CON(3)  #039                             * 8CE35  command
HISTOGRAM:
        :: CK0 'IDHISTOGRAM PUTPTYPE ;           * 8CE38

        { FALSE                                  * 8CE51
          :: DROP OBJ_4D993 ; NOP TRUE NULL{} FALSE OBJ_4B6C5 * 8CE5B
          :: BINT31 TestSysFlag ITE              * 8CE88
            :: ' OBJ_4CE0B ;                     * 8CE9C
            :: ' OBJ_4C34B ;                     * 8CEB0
          ;                                      * 8CEC4
          :: 16GETLAM 15GETLAM %- %13 %/ ; FALSE FALSE FALSE OBJ_73211 * 8CEC9
          OBJ_73270 ROMPTR 0F1 03F OBJ_73594 OBJ_48E8C } * 8CF00

* ROMPTR 0F1 03A
* refs (1): 8999A
        CON(1)  12                               * 8CF1F  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8CF20  library
        CON(3)  #03A                             * 8CF23  command
BAR:
        :: CK0 'IDBAR PUTPTYPE ;                 * 8CF26

        { FALSE                                  * 8CF3F
          :: DROP OBJ_4D9CF ; NOP TRUE NULL{} FALSE OBJ_4B6C5 * 8CF49
          :: BINT31 TestSysFlag ITE              * 8CF76
            :: ' OBJ_4CE0B ;                     * 8CF8A
            :: ' OBJ_4C34B ;                     * 8CF9E
          ;                                      * 8CFB2
          %1 FALSE FALSE FALSE OBJ_73211 OBJ_73270 ROMPTR 0F1 03F OBJ_73594 * 8CFB7
          OBJ_48ECD }                            * 8CFE5

* ROMPTR 0F1 03B
* refs (1): 8999A
PTYPE>PINFO~1:
        :: SWAP OBJ_2708E NOTcasedrop DROPFALSE  * 8CFEF
          SWAP NTHELCOMP ;                       * 8D008

* ROMPTR 0F1 03C
* refs (1): 8999A
ChkPut('PPAR',li,s)~1:
        :: SWAPINCOMP DUP #1=case ChkPut('PPAR',li,s)~1~1 * 8D017
          DUPTWO #=case ChkPut('PPAR',li,s)~1~2  * 8D030
          #3= NcaseTYPEERR DUPTYPEREAL?          * 8D03F
          3PICK TYPEREAL? DUP ?SKIP              * 8D04E
          :: DROP 5PICK BINT7 #= NcaseTYPEERR 3PICK * 8D062
            DUPTYPEARRY? NcaseTYPEERR DIMLIMITS  * 8D085
            LENCOMP #1= NcaseTYPEERR BINT1       * 8D094
            4PICK GETATELN DROP TYPEREAL? ;      * 8D0A8
          5PICK TYPEIDNT? AND AND NcaseTYPEERR THREE{}N * 8D0C1
          BINT8 ROT#- PutBackPPAR(_,s) ;         * 8D0DF

* ROMPTR 0F1 03D
* refs (1): 8999A
CHECKPVARS~3:
        :: DUPTYPELIST? IT                       * 8D0F3
          :: INNERCOMP #3= NOT?INVPPAR TYPEREAL? NOT?INVPPAR DUPTYPEREAL? * 8D102
            caseDROP DUPTYPEARRY?                * 8D125
            NOT?INVPPAR DUP DIMLIMITS LENCOMP #1= NOT?INVPPAR ONESWAP * 8D12F
            GETATELN DROP TYPEREAL? NOT?INVPPAR ; * 8D152
          TYPEIDNT? NOT?INVPPAR ;                * 8D16B

* ROMPTR 0F1 03E
* refs (1): 8999A
ROMP_0F1_03E:
        :: OBJ_46B54 1PUTLAM 18GETLAM ' Π'SAVEDDEPTH STO OBJ_4C314 TRUE' * 8D17A
          LAM 'EnvOK STOLAM DispMenu ;           * 8D1A7

* ROMPTR 0F1 03F
* refs (1): 8999A
ROMP_0F1_03F:
        :: OBJ_73230 ERRJMP INDEPVAR ?PURGE_HERE BINT0 ' Π'PlotEnv_50D3E STO * 8D1C9
          OBJ_4E6C7 ERRJMP ;                     * 8D1F6

* ROMPTR 0F1 040
* refs (1): 8999A
ROMP_0F1_040:
        :: OBJ_735EE IT OBJ_48305                * 8D205
          OBJ_4E6C7 INDEPVAR ?PURGE_HERE ABND ABND ; * 8D219

* ROMPTR 0F1 041
* refs (1): 8999A
EXPR>~1~romptr~1:
        :: DUP RPTRACC NOTcaseFALSE OBJ_72BD2    * 8D237
          TYPECOL #=case OBJ_5FAE0               * 8D250
          PALPTRDCMP NOTcaseFALSE $>ID           * 8D25F
          COMPILEID ;                            * 8D26E
        NIBHEX  0000                             * 8D278  ..
