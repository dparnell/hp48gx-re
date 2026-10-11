* HP 48GX ROM revision R, #C4E26-#C5331: Library part 0AA
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #C4E26 in the original ROM).

LIB0AA:
        CON(3)  #0AA                             * C4E26  library number
        REL(5)  LIB0AA.hash                      * C4E29  hash table
        CON(5)  0                                * C4E2E  message table
        REL(5)  LIB0AA.link                      * C4E33  link table
        CON(5)  0                                * C4E38  config

* ROMPTR 0AA 000
* refs (1): C4E26
ROMP_0AA_000:
        CON(5)  DOARRY                           * C4E3D  DOARRY
        LENGTH                                   * C4E42  length, to #C4E9E
        NIBHEX  29E2010000C00008A09408A0A408A010 * C4E47  δ......∡.I∡.J∡..
        NIBHEX  02005C02001C08A0B408A0C408A0D408 * C4E67   .Å .Á∡.K∡.L∡.M∡
        NIBHEX  A0E402009C02000C08A0400          * C4E87  .N .É .À∡..
        ENDLENGTH                                * C4E9E

* ROMPTR 0AA 001
* refs (1): C4E26
ROMP_0AA_001:
        CON(5)  DOARRY                           * C4E9E  DOARRY
        LENGTH                                   * C4EA3  length, to #C4EFF
        NIBHEX  29E2010000C0000200CD0200DD0200ED * C4EA8  δ...... .Ü .Ý .Þ
        NIBHEX  0200FD02000E0BA0E008A00008A00008 * C4EC8   .ß .à°..∡..∡..∡
        NIBHEX  A00008A00008A00008A0150          * C4EE8  ..∡..∡..∡.Q
        ENDLENGTH                                * C4EFF

* ROMPTR 0AA 002
* refs (1): C4E26
ROMP_0AA_002:
        CON(5)  DOARRY                           * C4EFF  DOARRY
        LENGTH                                   * C4F04  length, to #C4F84
        NIBHEX  29E2010000210002007B02004C0200AD * C4F09  δ...... .· .Ä .Ú
        NIBHEX  0200BD0200CB08A0250200BB02002C02 * C4F29   .Û .¼∡.R .» .Â 
        NIBHEX  00EB0200DB0200AB0BA00108A03508A0 * C4F49  .¾ .½ .º°..∡.S∡.
        NIBHEX  4008A00008A00008A00008A0F40      * C4F69  .∡..∡..∡..∡.O
        ENDLENGTH                                * C4F84

* ROMPTR 0AA 003
* refs (1): C4E26
ROMP_0AA_003:
        CON(5)  DOARRY                           * C4F84  DOARRY
        LENGTH                                   * C4F89  length, to #C4FE5
        NIBHEX  29E2010000C0000BA0C00BA0800BA0B0 * C4F8E  δ......°..°..°..
        NIBHEX  0BA0D00BA0A00BA09008A00008A00008 * C4FAE  °..°..°..∡..∡..∡
        NIBHEX  A00008A00008A00008A0650          * C4FCE  ..∡..∡..∡.V
        ENDLENGTH                                * C4FE5

* ROMPTR 0AA 004
* refs (1): C4E26
ROMP_0AA_004:
        CON(5)  DOARRY                           * C4FE5  DOARRY
        LENGTH                                   * C4FEA  length, to #C506A
        NIBHEX  29E201000021000BA0000BA0100BA020 * C4FEF  δ......°..°..°..
        NIBHEX  0BA0300BA04008A0400BA0500BA0600B * C500F  °..°..∡..°..°..°
        NIBHEX  A07008A07508A08508A04008A00008A0 * C502F  ..∡.W∡.X∡..∡..∡.
        NIBHEX  0008A00008A00008A00008A0C40      * C504F  .∡..∡..∡..∡.L
        ENDLENGTH                                * C506A

* ROMPTR 0AA 005
* refs (1): C4E26
ROMP_0AA_005:
        CON(5)  DOARRY                           * C506A  DOARRY
        LENGTH                                   * C506F  length, to #C50A7
        NIBHEX  29E2010000600002003E02002E02001E * C5074  δ...... .ã .â .á
        NIBHEX  08A00008A00008A0C50              * C5094  ∡..∡..∡.\
        ENDLENGTH                                * C50A7

* ROMPTR 0AA 006
* refs (1): C4E26
ROMP_0AA_006:
        CON(5)  DOARRY                           * C50A7  DOARRY
        LENGTH                                   * C50AC  length, to #C5108
        NIBHEX  29E2010000C00002002312003318A0D5 * C50B1  δ...... .2!.3ā.]
        NIBHEX  08A02008A0E508A04008A00008A00008 * C50D1  ∡..∡.^∡..∡..∡..∡
        NIBHEX  A00008A00008A00008A0D40          * C50F1  ..∡..∡..∡.M
        ENDLENGTH                                * C5108

* ROMPTR 0AA 007
* refs (1): C4E26
ROMP_0AA_007:
        CON(5)  DOARRY                           * C5108  DOARRY
        LENGTH                                   * C510D  length, to #C5145
        NIBHEX  29E201000060000200F3120004120014 * C5112  δ...... .?!.@!.A
        NIBHEX  12002412003418A0F50              * C5132  !.B!.Cā._
        ENDLENGTH                                * C5145

* ROMPTR 0AA 008
* refs (1): C4E26
ROMP_0AA_008:
        CON(5)  DOARRY                           * C5145  DOARRY
        LENGTH                                   * C514A  length, to #C51A6
        NIBHEX  29E2010000C00002002312003318A017 * C514F  δ...... .2!.3ā.q
        NIBHEX  08A02008A0E508A04008A00008A00008 * C516F  ∡..∡.^∡..∡..∡..∡
        NIBHEX  A00008A00008A00008A0B60          * C518F  ..∡..∡..∡.k
        ENDLENGTH                                * C51A6

* ROMPTR 0AA 009
* refs (1): C4E26
ROMP_0AA_009:
        CON(5)  DOARRY                           * C51A6  DOARRY
        LENGTH                                   * C51AB  length, to #C51E3
        NIBHEX  29E201000060000200F3120004120014 * C51B0  δ...... .?!.@!.A
        NIBHEX  12002412003418A0270              * C51D0  !.B!.Cā.r
        ENDLENGTH                                * C51E3

* ROMPTR 0AA 00A
* refs (1): C4E26
ROMP_0AA_00A:
        CON(5)  DOARRY                           * C51E3  DOARRY
        LENGTH                                   * C51E8  length, to #C5244
        NIBHEX  29E2010000C00008A09708A0A7020027 * C51ED  δ......∡.y∡.z .r
        NIBHEX  12003712001712004718A0B708A0C708 * C520D  !.s!.q!.tā.{∡.|∡
        NIBHEX  A04008A00008A00008A0770          * C522D  ..∡..∡..∡.w
        ENDLENGTH                                * C5244

* ROMPTR 0AA 00B
* refs (1): C4E26
ROMP_0AA_00B:
        CON(5)  DOARRY                           * C5244  DOARRY
        LENGTH                                   * C5249  length, to #C5281
        NIBHEX  29E2010000600002005F0200FE08A0E7 * C524E  δ...... .õ .ï∡.~
        NIBHEX  08A0F708A04008A0570              * C526E  ∡..∡..∡.u
        ENDLENGTH                                * C5281

LIB0AA.hash:
        CON(5)  DOHSTR                           * C5281  hash table of library 0AA
        LENGTH                                   * C5286  length, to #C52E5
        CON(5)  0                                * C528B  names of length 1
        CON(5)  0                                * C5290  names of length 2
        CON(5)  0                                * C5295  names of length 3
        CON(5)  0                                * C529A  names of length 4
        CON(5)  0                                * C529F  names of length 5
        CON(5)  0                                * C52A4  names of length 6
        CON(5)  0                                * C52A9  names of length 7
        CON(5)  0                                * C52AE  names of length 8
        CON(5)  0                                * C52B3  names of length 9
        CON(5)  0                                * C52B8  names of length 10
        CON(5)  0                                * C52BD  names of length 11
        CON(5)  0                                * C52C2  names of length 12
        CON(5)  0                                * C52C7  names of length 13
        CON(5)  0                                * C52CC  names of length 14
        CON(5)  0                                * C52D1  names of length 15
        CON(5)  0                                * C52D6  names of length 16
        REL(5)  L_C52E0                          * C52DB  end of the names
L_C52E0:
        CON(5)  0                                * C52E0  command 000 has no name
        ENDLENGTH                                * C52E5

LIB0AA.link:
        CON(5)  DOHSTR                           * C52E5  link table of library 0AA
        LENGTH                                   * C52EA  length, to #C532B
        REL(5)  ROMP_0AA_000                     * C52EF  000 
        REL(5)  ROMP_0AA_001                     * C52F4  001 
        REL(5)  ROMP_0AA_002                     * C52F9  002 
        REL(5)  ROMP_0AA_003                     * C52FE  003 
        REL(5)  ROMP_0AA_004                     * C5303  004 
        REL(5)  ROMP_0AA_005                     * C5308  005 
        REL(5)  ROMP_0AA_006                     * C530D  006 
        REL(5)  ROMP_0AA_007                     * C5312  007 
        REL(5)  ROMP_0AA_008                     * C5317  008 
        REL(5)  ROMP_0AA_009                     * C531C  009 
        REL(5)  ROMP_0AA_00A                     * C5321  00A 
        REL(5)  ROMP_0AA_00B                     * C5326  00B 
        ENDLENGTH                                * C532B
        NIBHEX  9A52000                          * C532B  ©%.
