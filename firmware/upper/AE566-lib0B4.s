* HP 48GX ROM revision R, #AE566-#B1605: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #AE566 in the original ROM).
        RPL

* ROMPTR 0B4 16F
* refs (1): A2437
ROMP_0B4_16F:
        ::                                       * AE566
          { BINT60 TRUE BINT62 ROMPTR 0B5 0D5 BINT80 ROMPTR 0B5 0D6 BINT81 * AE56B
            ROMPTR 0B4 170 BINT83                * AE59F
            :: ' ROMPTR 0B4 171 ; BINT96         * AE5AF
            :: ROMPTR 0B3 03E TRUE ; }           * AE5CE  ~BBReReadNElems
          EQLookup case                          * AE5ED
          :: EVAL TRUE ;                         * AE5F7
          DROPFALSE ;                            * AE60B

* ROMPTR 0B4 170
* refs (1): A2437
ROMP_0B4_170:
        :: ROMPTR 0B3 038 DUP _chr(31)_ EQUAL ITE * AE615  ~BBGetNStr
          :: NULL$ DUP ;                         * AE639
          :: DUP BINT1 BINT3 SUB$ OVER BINT5 BINT24 SUB$ ROT BINT26 OVERLEN$ * AE64D
            SUB$ ;                               * AE689
          7GETLAM 8GETLAM MAKEGROB 4ROLL $>grob OVER BINT1 BINT2 GROB! ROT * AE693
          $>grob OVER BINT19 BINT2 GROB! SWAP DUPLEN$ BINT5 8GETLAM BINT131 * AE6C5
          #<> IT #1-                             * AE6F7
          DUPUNROT #>ITE                         * AE706
          :: 1_#1-SUB$ CHR_... >T$ ; DROP $>GROB OVER BINT100 BINT1 GROB! ; * AE710

* ROMPTR 0B4 171
* refs (1): A2437
ROMP_0B4_171:
        :: NoExitAction                          * AE74C
          {                                      * AE756
            {                                    * AE75B
              :: TakeOver 12GETLAM #0<> ITE      * AE760
                :: PTR DirLabel: $ "EDIT" ; NULL$ * AE779
              ;                                  * AE79F
              ROMPTR 0B4 172 }                   * AE7A4
            {                                    * AE7B4
              :: PTR DirLabel: $ "NEW" ; ROMPTR 0B4 173 } * AE7B9
            {                                    * AE7E8
              :: TakeOver 12GETLAM #0<> ITE $ "PURG" NULL$ * AE7ED
              ;                                  * AE81D
              ROMPTR 0B4 174 }                   * AE822
            NullMenuKey NullMenuKey              * AE832
            { $ "OK" ROMPTR 0B3 02E } }          * AE83C  DoCKeyOK
        ;                                        * AE864

* ROMPTR 0B4 172
* refs (1): A2437
ROMP_0B4_172:
        :: TakeOver 12GETLAM #0=case DoBadKey    * AE869
          18GETLAM ROMPTR 0B3 03F 1LAMBIND 1GETLAM ROMPTR 0B5 0D8 1GETLAM * AE882  ~BBGetN
          ROMPTR 0B5 0D9 1GETLAM ROMPTR 0B5 0DA 3UNROLL 2DUP SWAP 5ROLL * AE8AC
          1GETLAM ROMPTR 0B5 0DB BINT12 {}N ROMPTR 0B4 139 NOT?SEMI * AE8DB
          1GETABND ROMPTR 0B5 0DC ROMPTR 0B3 03E * AE905  ~BBReReadNElems
          ROMPTR 0B3 026 18GETLAM 12GETLAM #MIN BINT1 #MAX 18PUTLAM FALSE * AE920  ~BBReReadWidth
          ROMPTR 0B3 019 ;                       * AE94E  ~BBRecalOff&Disp

* ROMPTR 0B4 173
* refs (1): A2437
ROMP_0B4_173:
        :: TakeOver ROMPTR 0B4 14C ROMPTR 0B4 139 NOT?SEMI * AE95E
          ROMPTR 0B3 03E                         * AE983  ~BBReReadNElems
          ROMPTR 0B3 026 18GETLAM 12GETLAM #MIN BINT1 #MAX 18PUTLAM FALSE * AE98E  ~BBReReadWidth
          ROMPTR 0B3 019 ;                       * AE9BC  ~BBRecalOff&Disp

* ROMPTR 0B4 174
* refs (1): A2437
ROMP_0B4_174:
        :: TakeOver 12GETLAM #0=case DoBadKey    * AE9CC
          18GETLAM ROMPTR 0B3 03F ROMPTR 0B5 0DC * AE9E5  ~BBGetN
          ROMPTR 0B3 03E                         * AEA00  ~BBReReadNElems
          ROMPTR 0B3 026 18GETLAM 12GETLAM #MIN BINT1 #MAX 18PUTLAM FALSE * AEA0B  ~BBReReadWidth
          ROMPTR 0B3 019 ;                       * AEA39  ~BBRecalOff&Disp

* ROMPTR 0B4 175
* refs (1): A2437
ROMP_0B4_175:
        :: ROMPTR 0B0 0AB                        * AEA49
          {                                      * AEA59
            { # BB01 ROMPTR 0B4 176 }            * AEA5E
            { # BB02 ROMPTR 0B4 17D }            * AEA7D
            { # BB03 ROMPTR 0B4 17F }            * AEA9C
            { # BB04 ROMPTR 0B4 18F } }          * AEABB
          ROMPTR 0B0 0A9 ;                       * AEADF

* ROMPTR 0B4 176
* refs (1): A2437
ROMP_0B4_176:
        ::                                       * AEAEF

* ROMPTR 0B4 177
* refs (1): A2437
ROMP_0B4_177:
          :: # BB06 BINT1 BINT10 ;               * AEAF4

* ROMPTR 0B4 178
* refs (1): A2437
ROMP_0B4_178:
          :: # BE17 BINT97 BINT10 ; # BB07 BINT1 BINT19 # BB08 BINT14 BINT28 * AEB12
          # BB09 BINT56 BINT28 # BB0A BINT98 BINT28 # BB0B BINT14 BINT37 * AEB58
          # BB0C BINT56 BINT37 # BB0D BINT98 BINT37 * AEB94

* ROMPTR 0B4 179
* refs (1): A2437
ROMP_0B4_179:
          :: 'RROMPTR@ ROMPTR 0B4 031 BINT22 BINT8 BINT67 BINT9 BINT21 * AEBBC
            { BINT3 } BINT4 # BB0E # BE1A MINUSONE MINUSONE ROMPTR 0B5 0DD ; * AEBEA

* ROMPTR 0B4 17A
* refs (1): A2437
ROMP_0B4_17A:
          :: 'DROPFALSE BINT115 BINT8 BINT13 BINT9 BINT1 * AEC2C
            { BINT0 } BINT4 # BB0F MINUSONE MINUSONE %1 ROMPTR 0B5 0E0 DROP ; * AEC4F
          'DROPFALSE BINT22 BINT17 BINT61 BINT9 BINT12 MINUSONE BINT17 * AEC91
          # BB10 ROMPTR 0B5 0F2 BINT17 ROMPTR 0B5 0F3 DUP 'DROPFALSE BINT7 * AECB9
          BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BB11 MINUSONE * AECED
          MINUSONE FALSE DUP 'DROPFALSE BINT49 BINT26 BINT6 BINT9 BINT32 * AED1A
          MINUSONE MINUSONE # BB12 MINUSONE MINUSONE FALSE DUP 'DROPFALSE * AED47
          BINT91 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BB13 MINUSONE * AED74
          MINUSONE FALSE DUP 'DROPFALSE BINT7 BINT35 BINT6 BINT9 BINT32 * AEDA6
          MINUSONE MINUSONE # BB14 MINUSONE MINUSONE FALSE DUP 'DROPFALSE * AEDD3
          BINT49 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BB15 MINUSONE * AEE00
          MINUSONE FALSE DUP 'DROPFALSE BINT91 BINT35 BINT6 BINT9 BINT32 * AEE32
          MINUSONE MINUSONE # BB16 MINUSONE MINUSONE FALSE DUP BINT9 DUP * AEE5F
          'DROPFALSE # BB05 DoInputForm NOT?SEMI * AEE91
          ROMPTR 0B4 17B ROMPTR 0B4 17C ;        * AEEAA

* ROMPTR 0B4 17B
* refs (1): A2437
ROMP_0B4_17B:
        :: 8PICK ROMPTR 0B5 0E0 SWAPDROP ROMPTR 0B5 0E1 BINT9 ROLL * AEEC5
          ROMPTR 0B5 0DE 7ROLL ROMPTR 0B0 099 7UNROLL ; * AEEF4

* ROMPTR 0B4 17C
* refs (1): A2437
ROMP_0B4_17C:
        ::                                       * AEF19
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } * AEF1E
          BIND 6GETLAM IT                        * AEF50
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E2 # BB08 msg>TAG ; * AEF5F
          5GETLAM IT                             * AEF8D
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E3 # BB09 msg>TAG ; * AEF97
          4GETLAM IT                             * AEFC5
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E4 # BB0A msg>TAG ; * AEFCF
          3GETLAM IT                             * AEFFD
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E5 # BB0B msg>TAG ; * AF007
          2GETLAM IT                             * AF035
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E6 # BB0C msg>TAG ; * AF03F
          1GETLAM IT                             * AF06D
          :: 8GETLAM 7GETLAM ROMPTR 0B5 0E7 # BB0D msg>TAG ; * AF077
          ABND ;                                 * AF0A5

* ROMPTR 0B4 17D
* refs (1): A2437
ROMP_0B4_17D:
        :: ROMPTR 0B4 177 ROMPTR 0B4 178 # BB1A BINT1 BINT19 # BB1B BINT1 * AF0AF
          BINT28 # BB1C BINT64 BINT28 ROMPTR 0B4 179 ROMPTR 0B4 17A * AF0ED
          'DROPFALSE BINT40 BINT17 BINT49 BINT9 BINT1 * AF11C
          { BINT0 } BINT4 # BB1D MINUSONE MINUSONE % -6.5E0 DUP 'DROPFALSE * AF13A
          BINT40 BINT26 BINT13 BINT9 BINT1       * AF181
          { BINT0 } BINT4 # BB1E MINUSONE MINUSONE %13 DUP 'DROPFALSE # 67 * AF19A
          BINT26 BINT25 BINT9 BINT1              * AF1DB
          { BINT0 } BINT4 # BB1F MINUSONE MINUSONE %1 DUP BINT5 DUP * AF1EF
          'DROPFALSE # BB19 DoInputForm NOT?SEMI * AF22B
          ROMPTR 0B4 17E ROMPTR 0B5 0E8 ;        * AF244

* ROMPTR 0B4 17E
* refs (1): A2437
ROMP_0B4_17E:
        :: 5ROLL ROMPTR 0B5 0DE 4PICK ROMPTR 0B5 0E0 SWAPDROP ROMPTR 0B5 0E1 ; * AF25F

* ROMPTR 0B4 17F
* refs (1): A2437
ROMP_0B4_17F:
        :: ROMPTR 0B4 177                        * AF299

* ROMPTR 0B4 180
* refs (1): A2437
ROMP_0B4_180:
          :: # BB21 BINT1 BINT19 ;               * AF2A9

* ROMPTR 0B4 181
* refs (1): A2437
ROMP_0B4_181:
          :: # BB22 BINT49 BINT19 ;              * AF2C7

* ROMPTR 0B4 182
* refs (1): A2437
ROMP_0B4_182:
          :: # BB23 BINT1 BINT28 ;               * AF2E5

* ROMPTR 0B4 183
* refs (1): A2437
ROMP_0B4_183:
          :: 'RROMPTR@ ROMPTR 0B4 031 BINT28 BINT8 # 67 BINT9 BINT21 * AF303
            { BINT3 } BINT4 # BB0E # BE1A MINUSONE MINUSONE ROMPTR 0B5 0DD ; * AF336

* ROMPTR 0B4 184
* refs (1): A2437
ROMP_0B4_184:
          :: 'DROPFALSE BINT28 BINT17 BINT13 BINT9 BINT1 * AF378
            { BINT0 } BINT4 # BB24 MINUSONE MINUSONE %1 ROMPTR 0B5 0E0 * AF39B
            'DROPFALSE # 49 BINT17 BINT13 BINT9 BINT1 * AF3D3
            { BINT0 } BINT4 # BB25 MINUSONE MINUSONE %2 BINT13 ROLL ; * AF3F6

* ROMPTR 0B4 185
* refs (1): A2437
ROMP_0B4_185:
          :: 'DROPFALSE BINT28 BINT26 BINT91 BINT9 BINT12 MINUSONE BINT17 * AF432
            # BB26 ROMPTR 0B5 0F5 BINT17 ROMPTR 0B5 0F6 ROMPTR 0B5 0DF ; * AF45F
          BINT4 DUP 'RROMPTR@ ROMPTR 0B4 187 # BB20 DoInputForm NOT?SEMI * AF494
          ROMPTR 0B4 186 ROMPTR 0B5 0E9 SWAP # BB27 msg>TAG SWAP # BB28 * AF4C2
          msg>TAG ;                              * AF4FB

* ROMPTR 0B4 186
* refs (1): A2437
ROMP_0B4_186:
        :: 4UNROLL ROMPTR 0B5 0E1 ROMPTR 0B5 0DE ROMPTR 0B0 09C 0LASTOWDOB! ; * AF505

* ROMPTR 0B4 187
* refs (1): A2437
ROMP_0B4_187:
        :: BINT16 #<>case FALSE                  * AF53A
          ROMPTR 0B4 188 TrueTrue ;              * AF54E

* ROMPTR 0B4 188
* refs (1): A2437
ROMP_0B4_188:
        {                                        * AF563
          {                                      * AF568
            :: PTR DirLabel: $ "PRED" ; ROMPTR 0B4 189 } * AF56D
          { $ "(AN(L" ROMPTR 0B0 059 }           * AF59E  DoKeyCancel
          { $ "OK" ROMPTR 0B0 05A } }            * AF5C7  DoKeyOK

* ROMPTR 0B4 189
* refs (1): A2437
ROMP_0B4_189:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 186 ROMPTR 0B4 18B * AF5EF  GetFieldVals
          ROMPTR 0B4 18A ROMPTR 0B0 0D8 ;        * AF61A

* ROMPTR 0B4 18A
* refs (1): A2437
ROMP_0B4_18A:
        :: ROMPTR 0B5 0DD ROMPTR 0B5 0E0 ROMPTR 0B5 0DF ; * AF635

* ROMPTR 0B4 18B
* refs (1): A2437
ROMP_0B4_18B:
        :: ROMPTR 0B4 177 ROMPTR 0B4 180 ROMPTR 0B4 181 ROMPTR 0B4 182 * AF660
          # BF32 BINT1 BINT37 # BB2A BINT67 BINT37 ROMPTR 0B4 183 * AF691
          ROMPTR 0B4 184 ROMPTR 0B4 185 'DROPFALSE BINT10 BINT35 BINT49 * AF6C4
          BINT9 BINT1                            * AF6EE
          { BINT0 } BINT4 # BB2B MINUSONE MINUSONE MINUSONE DUP 'DROPFALSE * AF6F8
          # 4C BINT35 BINT49 BINT9 BINT1         * AF72F
          { BINT0 } BINT4 # BB2C MINUSONE MINUSONE MINUSONE DUP BINT6 DUP * AF74D
          'RROMPTR@ ROMPTR 0B4 18C # BB29 DoInputForm NOT?SEMI * AF789
          2DROP ROMPTR 0B4 186 ;                 * AF7AD

* ROMPTR 0B4 18C
* refs (1): A2437
ROMP_0B4_18C:
        :: BINT16 #<>case FALSE                  * AF7C2
          ROMPTR 0B4 18D TrueTrue ;              * AF7D6

* ROMPTR 0B4 18D
* refs (1): A2437
ROMP_0B4_18D:
        { NullMenuKey NullMenuKey                * AF7EB
          { $ "PRED" ROMPTR 0B4 18E } }          * AF7FA

* ROMPTR 0B4 18E
* refs (1): A2437
ROMP_0B4_18E:
        :: TakeOver 5GETLAM BINT5 #< caseDoBadKey ROMPTR 0B0 0C8 * AF826  GetFieldVals
          2DROP ROMPTR 0B4 186 STATLR 2DROP 5GETLAM * AF84F
          { BINT5                                * AF86E
            :: BINT6 ROMPTR 0B0 0C5 ROMPTR 0B5 0EA BINT5 * AF878  ~gFldVal
              ROMPTR 0B0 0D5 BINT5 ROMPTR 0B0 0A2 ; * AF89D  ~sFldVal
            BINT6                                * AF8BD
            :: BINT5 ROMPTR 0B0 0C5 ROMPTR 0B5 0EB BINT6 * AF8C2  ~gFldVal
              ROMPTR 0B0 0D5 BINT6 ROMPTR 0B0 0A2 ; * AF8E7  ~sFldVal
          }                                      * AF907
          EQLookup DROP EVAL SetDA123NoCh ;      * AF90C

* ROMPTR 0B4 18F
* refs (1): A2437
ROMP_0B4_18F:
        :: ROMPTR 0B4 177 ROMPTR 0B4 180 ROMPTR 0B4 181 # BB2E BINT1 BINT28 * AF925
          # BB2F BINT11 BINT37 # BB30 BINT29 BINT37 # BB31 BINT50 BINT37 * AF95F
          # BB32 # 47 BINT37 # BB33 # 5F BINT37 # BB34 # 77 BINT37 * AF99B
          ROMPTR 0B4 183 ROMPTR 0B4 184 'DROPFALSE BINT4 BINT35 BINT6 BINT9 * AF9E6
          BINT32 MINUSONE MINUSONE # BB35 MINUSONE MINUSONE FALSE DUP * AFA15
          'DROPFALSE BINT22 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFA42
          # BB36 MINUSONE MINUSONE FALSE DUP 'DROPFALSE BINT43 BINT35 BINT6 * AFA6A
          BINT9 BINT32 MINUSONE MINUSONE # BB37 MINUSONE MINUSONE FALSE DUP * AFA9C
          'DROPFALSE BINT64 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFACE
          # BB38 MINUSONE MINUSONE FALSE DUP 'DROPFALSE # 58 BINT35 BINT6 * AFAF6
          BINT9 BINT32 MINUSONE MINUSONE # BB39 MINUSONE MINUSONE FALSE DUP * AFB2D
          'DROPFALSE BINT112 BINT35 BINT6 BINT9 BINT32 MINUSONE MINUSONE * AFB5F
          # BB3A MINUSONE MINUSONE FALSE DUP BINT10 BINT9 'DROPFALSE # BB2D * AFB87
          DoInputForm NOT?SEMI                   * AFBBE
          ROMPTR 0B4 190 ROMPTR 0B4 191 ;        * AFBC8

* ROMPTR 0B4 190
* refs (1): A2437
ROMP_0B4_190:
        :: 8ROLL 8ROLL ROMPTR 0B5 0E1 7ROLL ROMPTR 0B5 0DE ; * AFBE3

* ROMPTR 0B4 191
* refs (1): A2437
ROMP_0B4_191:
        ::                                       * AFC12
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND 6GETLAM * AFC17
          IT                                     * AFC49
          :: ROMPTR 0B5 0EC # BB2F msg>TAG ;     * AFC4E
          5GETLAM IT                             * AFC72
          :: ROMPTR 0B5 0ED # BB30 msg>TAG ;     * AFC7C
          4GETLAM IT                             * AFCA0
          :: ROMPTR 0B5 0EE # BB31 msg>TAG ;     * AFCAA
          3GETLAM IT                             * AFCCE
          :: ROMPTR 0B5 0EF # BB32 msg>TAG ;     * AFCD8
          2GETLAM IT                             * AFCFC
          :: ROMPTR 0B5 0F0 # BB33 msg>TAG ;     * AFD06
          1GETLAM IT                             * AFD2A
          :: ROMPTR 0B5 0F1 # BB34 msg>TAG ;     * AFD34
          ABND ;                                 * AFD58

* ROMPTR 0B4 192
* refs (1): A2437
ROMP_0B4_192:
        :: ROMPTR 0B0 0AB                        * AFD62
          {                                      * AFD72
            { # BA01 ROMPTR 0B4 193 }            * AFD77
            { # BA02 ROMPTR 0B5 0FF }            * AFD96
            { # BA03 DOPRLCD }                   * AFDB5
            { # BA04 ROMPTR 0B4 197 }            * AFDCE
            { # BA05 ROMPTR 0B4 1A8 }            * AFDED
            { # BA06 DOSERVER } }                * AFE0C
          ROMPTR 0B0 0A9 ;                       * AFE2A

* ROMPTR 0B4 193
* refs (1): A2437
ROMP_0B4_193:
        :: # B989 BINT1 BINT19 'DROPFALSE BINT25 BINT17 # 67 BINT9 BINT21 * AFE3A
          { BINT6 BINT5 } BINT4 # BA07           * AFE76
          { # BA08 TRUE MINUSONE FALSE } MINUSONE MINUSONE MINUSONE ONEONE * AFE99
          'RROMPTR@ ROMPTR 0B4 194 # BA09 DoInputForm caseDROP ; * AFED0

* ROMPTR 0B4 194
* refs (1): A2437
ROMP_0B4_194:
        :: BINT16 #<>case FALSE                  * AFEF9
          ROMPTR 0B4 195 TrueTrue ;              * AFF0D

* ROMPTR 0B4 195
* refs (1): A2437
ROMP_0B4_195:
        { NullMenuKey NullMenuKey                * AFF22
          { $ "SEND" ROMPTR 0B4 196 } }          * AFF31

* ROMPTR 0B4 196
* refs (1): A2437
ROMP_0B4_196:
        :: TakeOver BINT1 ROMPTR 0B0 0C5 ROMPTR 0B5 0FB ; * AFF5D  ~gFldVal

* ROMPTR 0B4 197
* refs (1): A2437
ROMP_0B4_197:
        ::                                       * AFF87

* ROMPTR 0B4 198
* refs (1): A2437
ROMP_0B4_198:
          :: # BA0A BINT1 BINT10 ; # B984 BINT1 BINT19 # BA0B BINT8 BINT28 * AFF8C
          # BA0C BINT52 BINT28                   * AFFD2

* ROMPTR 0B4 199
* refs (1): A2437
ROMP_0B4_199:
          :: # BA0D BINT49 BINT28 ; # BA0E # 6E BINT28 * AFFE6

* ROMPTR 0B4 19A
* refs (1): A2437
ROMP_0B4_19A:
          :: # BA0F BINT1 BINT37 ;               * B001D

* ROMPTR 0B4 19B
* refs (1): A2437
ROMP_0B4_19B:
          :: # BA10 BINT49 BINT37 ; # BA11 # 67 BINT37 'RROMPTR@ * B003B
          ROMPTR 0B4 1A3 BINT31 BINT8 BINT49 BINT9 BINT12 MINUSONE BINT17 * B0077
          # BA12 ROMPTR 0B5 11F BINT17 ROMPTR 0B5 120 MINUSONE 'DROPFALSE * B00A5
          BINT31 BINT17 BINT97 BINT9 BINT21 MINUSONE BINT4 # BA13 * B00D4
          { # B986 TRUE } MINUSONE MINUSONE MINUSONE 'DROPFALSE BINT1 BINT26 * B0101
          BINT6 BINT9 BINT32 MINUSONE MINUSONE # BA14 MINUSONE MINUSONE * B0138
          FALSE MINUSONE 'RROMPTR@ ROMPTR 0B4 1A5 # 4C BINT26 BINT19 BINT9 * B0165
          BINT1                                  * B0198
          { BINT0 } BINT4 # BA15 MINUSONE MINUSONE %1.8 MINUSONE 'RROMPTR@ * B019D
          ROMPTR 0B4 1A6 # 49 BINT26 BINT25 BINT9 BINT12 MINUSONE BINT33 * B01D4
          # BA16 ROMPTR 0B5 12F BINT17 ROMPTR 0B5 131 MINUSONE 'DROPFALSE * B0207
          # 67 BINT26 BINT6 BINT9 BINT32 MINUSONE MINUSONE # BA17 MINUSONE * B0236
          MINUSONE TRUE MINUSONE                 * B026D

* ROMPTR 0B4 19C
* refs (1): A2437
ROMP_0B4_19C:
          :: 'RROMPTR@ ROMPTR 0B4 1A6 BINT19 BINT35 BINT25 BINT9 BINT12 * B027C
            MINUSONE BINT4 # BA18 ROMPTR 0B5 125 BINT4 %9600 MINUSONE ; * B02AA
          'RROMPTR@ ROMPTR 0B4 1A6 # 49 BINT35 BINT25 BINT9 BINT12 MINUSONE * B02DD
          BINT33 # BA19 ROMPTR 0B5 126 BINT17 ROMPTR 0B5 127 MINUSONE * B0310
          'RROMPTR@ ROMPTR 0B4 1A6 # 76 BINT35 BINT13 BINT9 BINT1 * B033F
          { BINT0 } BINT4 # BA1A MINUSONE MINUSONE %80 MINUSONE BINT9 DUP * B036D
          'RROMPTR@ ROMPTR 0B4 19F # BA1B ROMPTR 0B4 19D BINT9 * B03A9
          ROMPTR 0B0 0AA DoInputForm NOT?SEMI    * B03D3
          ROMPTR 0B4 19E ;                       * B03E8

* ROMPTR 0B4 19D
* refs (1): A2437
ROMP_0B4_19D:
        :: ROMPTR 0B5 100 MINUSONE BINT37 TestSysFlag ROMPTR 0B5 103 * B03F8
          ROMPTR 0B5 10C ROMPTR 0B5 104 4ROLLDROP 3UNROLL 5ROLL ; * B0422

* ROMPTR 0B4 19E
* refs (1): A2437
ROMP_0B4_19E:
        :: ROMPTR 0B5 106 ROT ROMPTR 0B5 105 MINUSONE 3UNROLL ROMPTR 0B5 10D * B044C
          ROMPTR 0B5 102 BINT37 ROMPTR 0B5 11B DROP ROMPTR 0B5 101 ; * B0481

* ROMPTR 0B4 19F
* refs (1): A2437
ROMP_0B4_19F:
        ::                                       * B04B1
          { BINT14 BINT2 BINT16                  * B04B6
            :: ROMPTR 0B4 1A0 TRUE ; BINT5 ROMPTR 0B4 1A2 } * B04CA
          EQLookup case                          * B04F9
          :: EVAL TRUE ;                         * B0503
          DROPFALSE ;                            * B0517

* ROMPTR 0B4 1A0
* refs (1): A2437
ROMP_0B4_1A0:
        { NullMenuKey NullMenuKey                * B0521
          { $ "PRINT" ROMPTR 0B4 1A1 } }         * B0530

* ROMPTR 0B4 1A1
* refs (1): A2437
ROMP_0B4_1A1:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 19E BINT2 * B055E  GetFieldVals
          ROMPTR 0B0 0C5 ROMPTR 0B5 107 ;        * B0583  ~gFldVal

* ROMPTR 0B4 1A2
* refs (1): A2437
ROMP_0B4_1A2:
        :: BINT39 BINT131 MAKEGROB BINT4 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * B059E
          ROMPTR 0B4 1A7 ITE                     * B05D1
          :: BINT4 ROMPTR 0B0 012 BINT6 ROMPTR 0B0 012 ; * B05E1
          :: BINT10 BINT5 DO INDEX@ ROMPTR 0B0 012 LOOP ; * B060B
          FALSE ;                                * B0639

* ROMPTR 0B4 1A3
* refs (1): A2437
ROMP_0B4_1A3:
        :: BINT47 #<>case FALSE                  * B0643
          ROMPTR 0B4 1A4 TRUE ;                  * B0657

* ROMPTR 0B4 1A4
* refs (1): A2437
ROMP_0B4_1A4:
        :: BINT26 BINT18 BLANKIT HARDBUFF BINT3 ROMPTR 0B0 012 BINT3 * B066C
          ROMPTR 0B0 0A2 ROMPTR 0B4 1A7 ITE      * B069A
          :: BINT4 ROMPTR 0B0 012 BINT4 ROMPTR 0B0 0A2 BINT6 ROMPTR 0B0 012 * B06B5
            BINT6 ROMPTR 0B0 0A2 ;               * B06EA
          :: BINT10 BINT5 DO INDEX@ ROMPTR 0B0 012 INDEX@ ROMPTR 0B0 0A2 * B06FF
            LOOP ;                               * B0733
          DROP ;                                 * B073D

* ROMPTR 0B4 1A5
* refs (1): A2437
ROMP_0B4_1A5:
        :: BINT7 #=casedrop                      * B0747
          :: ROMPTR 0B4 1A7 NOT ;                * B0756
          BINT55 #<>case FALSE                   * B0770
          ROMPTR 0B4 1A7 TRUE ;                  * B077F

* ROMPTR 0B4 1A6
* refs (1): A2437
ROMP_0B4_1A6:
        :: BINT7 #=casedrop ROMPTR 0B4 1A7       * B0794
          BINT55 #<>case FALSE                   * B07AE
          ROMPTR 0B4 1A7 NOT TRUE ;              * B07BD

* ROMPTR 0B4 1A7
* refs (1): A2437
ROMP_0B4_1A7:
        :: BINT1 ROMPTR 0B0 0C5 ROMPTR 0B0 09A ; * B07D7  ~gFldVal

* ROMPTR 0B4 1A8
* refs (1): A2437
ROMP_0B4_1A8:
        :: ROMPTR 0B4 198 # BA1C BINT70 BINT10 # B989 BINT1 BINT19 # BA1D * B07FC
          # 6E BINT37 # BA1E BINT1 BINT28 ROMPTR 0B4 199 # BA1F # 67 BINT28 * B083E
          ROMPTR 0B4 19A ROMPTR 0B4 19B 'RROMPTR@ ROMPTR 0B4 1B1 BINT25 * B0885
          BINT8 BINT25 BINT9 BINT12 MINUSONE BINT33 # BA20 ROMPTR 0B5 11F * B08B0
          BINT17 ROMPTR 0B5 121 MINUSONE 'RROMPTR@ ROMPTR 0B4 1B2 BINT91 * B08E3
          BINT8 BINT37 BINT9 BINT12 MINUSONE BINT17 # BA21 ROMPTR 0B5 122 * B090D
          BINT17 ROMPTR 0B5 123 MINUSONE 'RROMPTR@ ROMPTR 0B4 1B4 BINT25 * B0940
          BINT17 # 67 BINT9 BINT21               * B096A
          { BINT6 BINT5 } BINT4 # BA22           * B0983
          { # BA08 TRUE MINUSONE FALSE } MINUSONE MINUSONE MINUSONE * B09A6
          'RROMPTR@ ROMPTR 0B4 1BF BINT19 BINT26 BINT19 BINT9 BINT12 * B09D8
          MINUSONE BINT33 # BA23 ROMPTR 0B5 12C BINT17 ROMPTR 0B5 12D * B0A01
          MINUSONE 'RROMPTR@ ROMPTR 0B4 1BF # 49 BINT26 BINT25 BINT9 BINT12 * B0A30
          MINUSONE BINT33 # BA16 ROMPTR 0B5 12F BINT17 ROMPTR 0B5 131 * B0A63
          MINUSONE 'RROMPTR@ ROMPTR 0B4 1BF # 79 BINT26 BINT7 BINT9 BINT12 * B0A92
          MINUSONE BINT36 # BA24 ROMPTR 0B5 134 BINT17 ROMPTR 0B5 137 * B0AC5
          MINUSONE ROMPTR 0B4 19C 'RROMPTR@ ROMPTR 0B4 1BE # 49 BINT35 * B0AF4
          BINT25 BINT9 BINT12 MINUSONE BINT33 # BA19 ROMPTR 0B5 126 BINT17 * B0B23
          ROMPTR 0B5 127 MINUSONE 'DROPFALSE # 67 BINT35 BINT6 BINT9 BINT32 * B0B56
          MINUSONE MINUSONE # BA25 MINUSONE MINUSONE FALSE MINUSONE BINT9 * B0B89
          DUP 'RROMPTR@ ROMPTR 0B4 1AB # BA26 ROMPTR 0B4 1A9 BINT9 * B0BB6
          ROMPTR 0B0 0AA DoInputForm NOT?SEMI    * B0BE5
          ROMPTR 0B4 1AA ;                       * B0BFA

* ROMPTR 0B4 1A9
* refs (1): A2437
ROMP_0B4_1A9:
        :: ROMPTR 0B5 108 ROMPTR 0B5 123 MINUSONE ROMPTR 0B5 10A * B0C0A
          ROMPTR 0B5 10C ROMPTR 0B5 10E ;        * B0C35

* ROMPTR 0B4 1AA
* refs (1): A2437
ROMP_0B4_1AA:
        :: ROMPTR 0B5 10F ROMPTR 0B5 10D ROMPTR 0B5 10B 2DROP ROMPTR 0B5 109 ; * B0C50

* ROMPTR 0B4 1AB
* refs (1): A2437
ROMP_0B4_1AB:
        ::                                       * B0C8B
          { BINT14 BINT3 BINT16                  * B0C90
            :: ROMPTR 0B4 1AC TRUE ; BINT5 ROMPTR 0B4 1B0 } * B0CA4
          EQLookup case                          * B0CD3
          :: EVAL TRUE ;                         * B0CDD
          DROPFALSE ;                            * B0CF1

* ROMPTR 0B4 1AC
* refs (1): A2437
ROMP_0B4_1AC:
        {                                        * B0CFB
          {                                      * B0D00
            :: TakeOver ROMPTR 0B4 1C0 ITE $ "RECV" NULL$ * B0D05
            ;                                    * B0D36
            ROMPTR 0B4 1AD }                     * B0D3B
          {                                      * B0D4B
            :: TakeOver ROMPTR 0B4 1C0 ITE $ "KGET" $ "XRECV" * B0D50
            ;                                    * B0D90
            ROMPTR 0B4 1AE }                     * B0D95
          {                                      * B0DA5
            :: TakeOver ROMPTR 0B4 1C0 ITE $ "SEND" $ "XSEN" * B0DAA
            ;                                    * B0DE8
            ROMPTR 0B4 1AF }                     * B0DED
        }                                        * B0DFD

* ROMPTR 0B4 1AD
* refs (1): A2437
ROMP_0B4_1AD:
        :: TakeOver ROMPTR 0B4 1C0 NOTcase DoBadKey * B0E02
          ROMPTR 0B0 0C8 ROMPTR 0B4 1AA ROMPTR 0B5 118 ; * B0E21  GetFieldVals

* ROMPTR 0B4 1AE
* refs (1): A2437
ROMP_0B4_1AE:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 1AA BINT3 * B0E47  GetFieldVals
          ROMPTR 0B0 0C5 ROMPTR 0B4 1C0 ITE ROMPTR 0B5 117 * B0E6C  ~gFldVal
          :: TRUE ROMPTR 0B5 119 ;               * B0E92
        ;                                        * B0EAC

* ROMPTR 0B4 1AF
* refs (1): A2437
ROMP_0B4_1AF:
        :: TakeOver ROMPTR 0B0 0C8 ROMPTR 0B4 1AA BINT3 * B0EB1  GetFieldVals
          ROMPTR 0B0 0C5 ROMPTR 0B4 1C0 ITE ROMPTR 0B5 11A * B0ED6  ~gFldVal
          :: FALSE ROMPTR 0B5 119 ;              * B0EFC
        ;                                        * B0F16

* ROMPTR 0B4 1B0
* refs (1): A2437
ROMP_0B4_1B0:
        :: BINT39 BINT131 MAKEGROB BINT5 ONE_DO INDEX@ ROMPTR 0B0 012 LOOP * B0F1B
          ROMPTR 0B4 1C0 case                    * B0F4E
          :: BINT8 BINT5 DO INDEX@ ROMPTR 0B0 012 LOOP ROMPTR 0B4 1A7 * B0F5E
            caseFALSE BINT10                     * B0F92
            BINT8 DO INDEX@ ROMPTR 0B0 012 LOOP FALSE ; * B0F9C
          ROMPTR 0B4 1A7 caseFALSE BINT8         * B0FC5
          ROMPTR 0B0 012 FALSE ;                 * B0FDA

* ROMPTR 0B4 1B1
* refs (1): A2437
ROMP_0B4_1B1:
        :: BINT47 #<>case FALSE                  * B0FEF
          ROMPTR 0B4 1B3 TRUE ;                  * B1003

* ROMPTR 0B4 1B2
* refs (1): A2437
ROMP_0B4_1B2:
        :: BINT47 #<>case FALSE                  * B1018
          ROMPTR 0B4 1B3 SetDA3Bad TRUE ;        * B102C

* ROMPTR 0B4 1B3
* refs (1): A2437
ROMP_0B4_1B3:
        :: BINT26 BINT18 BLANKIT HARDBUFF BINT4 ROMPTR 0B0 012 BINT9 * B1046
          ROMPTR 0B0 0A2 ROMPTR 0B4 1C0 case     * B1074
          :: BINT8 BINT5 DO INDEX@ ROMPTR 0B0 012 INDEX@ #1- ROMPTR 0B0 0A2 * B108F
            LOOP ROMPTR 0B4 1A7 caseDROP BINT10  * B10C8
            BINT8 DO INDEX@ ROMPTR 0B0 012 INDEX@ #1- ROMPTR 0B0 0A2 LOOP * B10E2
            DROP ;                               * B1116
          ROMPTR 0B4 1A7 caseDROP BINT8          * B1120
          ROMPTR 0B0 012 BINT7 ROMPTR 0B0 0A2 DROP ; * B1135

* ROMPTR 0B4 1B4
* refs (1): A2437
ROMP_0B4_1B4:
        :: BINT37 #<>case FALSE                  * B115A
          ROMPTR 0B4 1C0 NOTcaseFALSE ROMPTR 0B4 1B5 * B116E
          TRUE ;                                 * B1189

* ROMPTR 0B4 1B5
* refs (1): A2437
ROMP_0B4_1B5:
        :: NULL$                                 * B1193
          {                                      * B119D
            { # BA27 ROMPTR 0B4 1B6 }            * B11A2
            { # BA28 ROMPTR 0B4 1B7 } }          * B11C1
          ROMPTR 0B3 066 SetDA123NoCh NOTcaseFALSE EVAL * B11E5  ~ChooseSimple
        ;                                        * B11FF

* ROMPTR 0B4 1B6
* refs (1): A2437
ROMP_0B4_1B6:
        :: 4GETLAM FALSE SWAP ROMPTR 0B0 077 ROMPTR 0B4 1D8 SetDA123NoCh ; * B1204

* ROMPTR 0B4 1B7
* refs (1): A2437
ROMP_0B4_1B7:
        :: ROMPTR 0B0 0C8 ROMPTR 0B4 1AA ROMPTR 0B5 110 * B1238  GetFieldVals
          { LAM 'RD LAM 'RF } BIND 'RROMPTR@ ROMPTR 0B4 1B8 SPACE$ BINT1 * B125E
          LAM 'RF ROMPTR 0B5 111 BINT1 ROMPTR 0B3 000 ABND SetDA123NoCh ; * B12A1  ~Choose

* ROMPTR 0B4 1B8
* refs (1): A2437
ROMP_0B4_1B8:
        ::                                       * B12D8
          { BINT70 ROMPTR 0B4 1B9 BINT61 TRUE BINT83 * B12DD
            :: ' ROMPTR 0B4 1BA ; }              * B1301
          EQLookup case                          * B1320
          :: EVAL TRUE ;                         * B132A
          DROPFALSE ;                            * B133E

* ROMPTR 0B4 1B9
* refs (1): A2437
ROMP_0B4_1B9:
        :: # BA29 JstGetTHEMESG LAM 'RD 8GETLAM ROMPTR 0B3 046 3PICK * B1348
          ROMPTR 0B0 071 #- ROMPTR 0B0 070 DROP &$ ; * B137E

* ROMPTR 0B4 1BA
* refs (1): A2437
ROMP_0B4_1BA:
        :: NoExitAction                          * B13A8
          { NullMenuKey                          * B13B2
            {                                    * B13BC
              :: PTR DirLabel: $ "CHOOS" ; ROMPTR 0B4 1BB } * B13C1
            {                                    * B13F4
              :: TakeOver ROMPTR 0B3 05B ITE NULL$ * B13F9  ~BBEmpty?
                ROMPTR 0B0 086                   * B1418  ~grobCheckKey
              ;                                  * B1423
              ROMPTR 0B3 02A }                   * B1428  DoCKeyCheck
            NullMenuKey                          * B1438
            { $ "(AN(L" ROMPTR 0B3 02D }         * B143D  DoCKeyCancel
            { $ "OK" ROMPTR 0B3 02E } }          * B1466  DoCKeyOK
        ;                                        * B148E

* ROMPTR 0B4 1BB
* refs (1): A2437
ROMP_0B4_1BB:
        :: TakeOver # B989 BINT1 BINT19 'RROMPTR@ ROMPTR 0B4 1BC BINT25 * B1493
          BINT17 # 67 BINT9 BINT5                * B14C6
          { BINT2 } BINT4 # BA2A MINUSONE BINT1 MINUSONE LAM 'RD ONEONE * B14DF
          'DROPFALSE # BA2B HARDBUFF TOTEMPOB 1LAMBIND DoInputForm 1GETABND * B151E
          HARDBUFF ZEROZERO GROB! NOT?SEMI       * B1546
          ROMPTR 0B5 116 ROMPTR 0B5 110 SWAP ' LAM 'RD STOLAM DUP ' LAM 'RF * B155A
          STOLAM ROMPTR 0B5 111 19PUTLAM ROMPTR 0B3 03E * B15A3  ~BBReReadNElems
          ROMPTR 0B3 026 BINT1 12GETLAM #MIN 18PUTLAM FALSE * B15C3  ~BBReReadWidth
          ROMPTR 0B3 019 NULL{} 15PUTLAM OBJ_1A03E ; * B15E7  ~BBRecalOff&Disp
