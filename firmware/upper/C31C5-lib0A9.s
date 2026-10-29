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
MenuMTH~1~1~1:
        CON(5)  DOARRY                           * C3207  DOARRY
        LENGTH                                   * C320C  length, to #C3256
        NIBHEX  29E201000090000200D30200970200A7 * C3211  δ...... .= .y .z
        NIBHEX  02004B02005B02006B08A05008A06008 * C3231   .´ .µ .¶∡..∡..∡
        NIBHEX  A0700                            * C3251  ..
        ENDLENGTH                                * C3256

* ROMPTR 0A9 005
* refs (1): C31C5
ROMP_0A9_005:
        CON(5)  DOARRY                           * C3256  DOARRY
        LENGTH                                   * C325B  length, to #C32B1
        NIBHEX  29E2010000B00008A08008A09008A0A0 * C3260  δ......∡..∡..∡..
        NIBHEX  08A0B008A0C00BA0630200B70BA0730B * C3280  ∡..∡..°.6 .{°.7°
        NIBHEX  A0830BA0540BA0640                * C32A0  .8°.E°.F
        ENDLENGTH                                * C32B1

* ROMPTR 0A9 006
* refs (1): C31C5
ROMP_0A9_006:
        CON(5)  DOARRY                           * C32B1  DOARRY
        LENGTH                                   * C32B6  length, to #C3336
        NIBHEX  29E201000021000200DA0200EA0200FA * C32BB  δ...... .. .® .¯
        NIBHEX  0200CA0BA00402000A02002B02003B02 * C32DB   .¬°.@ .. .² .³ 
        NIBHEX  000B02001B0200C90200D908A00008A0 * C32FB  .° .± .Π .Ω∡..∡.
        NIBHEX  0008A00008A00008A00008A0D00      * C331B  .∡..∡..∡..∡..
        ENDLENGTH                                * C3336

* ROMPTR 0A9 007
* refs (1): C31C5
ROMP_0A9_007:
        CON(5)  DOARRY                           * C3336  DOARRY
        LENGTH                                   * C333B  length, to #C3397
        NIBHEX  29E2010000C0000200D30BA043020067 * C3340  δ...... .=°.4 .v
        NIBHEX  0200770BA0330BA0130BA0530200870B * C3360   .w°.3°.1°.5 .x°
        NIBHEX  A02308A00008A00008A0D00          * C3380  .2∡..∡..∡..
        ENDLENGTH                                * C3397

* ROMPTR 0A9 008
* refs (1): C31C5
ROMP_0A9_008:
        CON(5)  DOARRY                           * C3397  DOARRY
        LENGTH                                   * C339C  length, to #C33F8
        NIBHEX  29E2010000C0000BA0F30BA0B30BA0D3 * C33A1  δ......°.?°.;°.=
        NIBHEX  0BA0C30BA0E30BA0930BA0A308A00008 * C33C1  °.<°.>°.9°.:∡..∡
        NIBHEX  A00008A00008A00008A0D00          * C33E1  ..∡..∡..∡..
        ENDLENGTH                                * C33F8

* ROMPTR 0A9 009
* refs (1): C31C5
ROMP_0A9_009:
        CON(5)  DOARRY                           * C33F8  DOARRY
        LENGTH                                   * C33FD  length, to #C3435
        NIBHEX  29E201000060000BA0340BA0440BA0A4 * C3402  δ......°.C°.D°.J
        NIBHEX  0BA0940BA0C408A0D00              * C3422  °.I°.L∡..
        ENDLENGTH                                * C3435

* ROMPTR 0A9 00A
* refs (1): C31C5
ROMP_0A9_00A:
        CON(5)  DOARRY                           * C3435  DOARRY
        LENGTH                                   * C343A  length, to #C3496
        NIBHEX  29E2010000C0000BA0140BA0240BA084 * C343F  δ......°.A°.B°.H
        NIBHEX  0BA0740BA0D40BA0E40BA0B408A00008 * C345F  °.G°.M°.N°.K∡..∡
        NIBHEX  A00008A00008A00008A0D00          * C347F  ..∡..∡..∡..
        ENDLENGTH                                * C3496

* ROMPTR 0A9 00B
* refs (1): C31C5
MenuMTH~1~1~2:
        CON(5)  DOARRY                           * C3496  DOARRY
        LENGTH                                   * C349B  length, to #C34D3
        NIBHEX  29E201000060000BA0460BA0860BA0A6 * C34A0  δ......°.d°.h°.j
        NIBHEX  0BA0E60BA0D60BA0C60              * C34C0  °.n°.m°.l
        ENDLENGTH                                * C34D3

* ROMPTR 0A9 00C
* refs (1): C31C5
MenuMTH~1~1~3:
        CON(5)  DOARRY                           * C34D3  DOARRY
        LENGTH                                   * C34D8  length, to #C351C
        NIBHEX  29E201000080000200450200A5020055 * C34DD  δ...... .T .Z .U
        NIBHEX  0200B50200650200C50200260200160  * C34FD   .[ .V .\ .b .a
        ENDLENGTH                                * C351C

* ROMPTR 0A9 00D
* refs (1): C31C5
MenuMTH~1~1~4:
        CON(5)  DOARRY                           * C351C  DOARRY
        LENGTH                                   * C3521  length, to #C3577
        NIBHEX  29E2010000B000020018020028020036 * C3526  δ...... .ā .∇ .c
        NIBHEX  0200F702000808A00002004312006312 * C3546   .. .∡∡.. .4!.6!
        NIBHEX  00531200731BA0720                * C3566  .5!.7±.'
        ENDLENGTH                                * C3577

* ROMPTR 0A9 00E
* refs (1): C31C5
MenuMTH~1~1~5:
        CON(5)  DOARRY                           * C3577  DOARRY
        LENGTH                                   * C357C  length, to #C35FC
        NIBHEX  29E201000021000200C70200E70200D7 * C3581  δ...... .| .~ .}
        NIBHEX  0200B60200A60200E60200D30200E402 * C35A1   .k .j .n .= .N 
        NIBHEX  00F60200960200560200660200C60200 * C35C1  .o .i .e .f .l .
        NIBHEX  D60200760200860200070200170      * C35E1  m .g .h .p .q
        ENDLENGTH                                * C35FC

* ROMPTR 0A9 00F
* refs (1): C31C5
ROMP_0A9_00F:
        CON(5)  DOARRY                           * C35FC  DOARRY
        LENGTH                                   * C3601  length, to #C365D
        NIBHEX  29E2010000C00008A0E008A0F008A001 * C3606  δ......∡..∡..∡..
        NIBHEX  08A0110200900200A008A02108A03108 * C3626  ∡.. .. ..∡..∡..∡
        NIBHEX  A04108A0000200490200590          * C3646  ..∡.. .η .θ
        ENDLENGTH                                * C365D

* ROMPTR 0A9 010
* refs (1): C31C5
ROMP_0A9_010:
        CON(5)  DOARRY                           * C365D  DOARRY
        LENGTH                                   * C3662  length, to #C369A
        NIBHEX  29E2010000600002005E02006E02008E * C3667  δ...... .å .æ .è
        NIBHEX  02007E08A00008A0510              * C3687   .ç∡..∡..
        ENDLENGTH                                * C369A

* ROMPTR 0A9 011
* refs (1): C31C5
ROMP_0A9_011:
        CON(5)  DOARRY                           * C369A  DOARRY
        LENGTH                                   * C369F  length, to #C36D7
        NIBHEX  29E20100006000020010020050020000 * C36A4  δ...... .. .. ..
        NIBHEX  02007002003008A0510              * C36C4   .. ..∡..
        ENDLENGTH                                * C36D7

* ROMPTR 0A9 012
* refs (1): C31C5
ROMP_0A9_012:
        CON(5)  DOARRY                           * C36D7  DOARRY
        LENGTH                                   * C36DC  length, to #C3714
        NIBHEX  29E2010000600002002002006008A000 * C36E1  δ...... .. ..∡..
        NIBHEX  02008002004008A0510              * C3701   .. ..∡..
        ENDLENGTH                                * C3714

* ROMPTR 0A9 013
* refs (1): C31C5
MenuMTH~1~1~6:
        CON(5)  DOARRY                           * C3714  DOARRY
        LENGTH                                   * C3719  length, to #C3739
        NIBHEX  29E201000020000BA0520BA0620      * C371E  δ......°.%°.&
        ENDLENGTH                                * C3739

* ROMPTR 0A9 014
* refs (1): C31C5
MenuMTH~1~1~7:
        CON(5)  DOARRY                           * C3739  DOARRY
        LENGTH                                   * C373E  length, to #C3788
        NIBHEX  29E201000090000200A90200B90200F9 * C3743  δ...... .ω .Δ .∞
        NIBHEX  0200990200D30200D40200E40200C302 * C3763   .τ .= .M .N .< 
        NIBHEX  00E30                            * C3783  .>
        ENDLENGTH                                * C3788

* ROMPTR 0A9 015
* refs (1): C31C5
MenuMTH~1~1~8:
        ROMPTR 0A7 003                           * C3788

* ROMPTR 0A9 016
* refs (1): C31C5
MenuPr~1:
        ROMPTR 0A7 004                           * C3793

* ROMPTR 0A9 017
* refs (1): C31C5
ROMP_0A9_017:
        CON(5)  DOARRY                           * C379E  DOARRY
        LENGTH                                   * C37A3  length, to #C37E7
        NIBHEX  29E2010000800008A06108A07108A081 * C37A8  δ......∡..∡..∡..
        NIBHEX  08A09108A0A108A0B10200030200F20  * C37C8  ∡..∡..∡.. .0 ./
        ENDLENGTH                                * C37E7

* ROMPTR 0A9 018
* refs (1): C31C5
ROMP_0A9_018:
        CON(5)  DOARRY                           * C37E7  DOARRY
        LENGTH                                   * C37EC  length, to #C3824
        NIBHEX  29E20100006000000700000710000720 * C37F1  δ.......p..p..p.
        NIBHEX  00073008A00008A0C10              * C3811  .p.∡..∡..
        ENDLENGTH                                * C3824

* ROMPTR 0A9 019
* refs (1): C31C5
ROMP_0A9_019:
        CON(5)  DOARRY                           * C3824  DOARRY
        LENGTH                                   * C3829  length, to #C3861
        NIBHEX  29E201000060000007910007A1000730 * C382E  δ.......p..p..p.
        NIBHEX  08A00008A00008A0C10              * C384E  ∡..∡..∡..
        ENDLENGTH                                * C3861

* ROMPTR 0A9 01A
* refs (1): C31C5
ROMP_0A9_01A:
        CON(5)  DOARRY                           * C3861  DOARRY
        LENGTH                                   * C3866  length, to #C389E
        NIBHEX  29E201000060000007900007B00007C0 * C386B  δ.......p..p..p.
        NIBHEX  08A00008A00008A0C10              * C388B  ∡..∡..∡..
        ENDLENGTH                                * C389E

* ROMPTR 0A9 01B
* refs (1): C31C5
ROMP_0A9_01B:
        CON(5)  DOARRY                           * C389E  DOARRY
        LENGTH                                   * C38A3  length, to #C38DB
        NIBHEX  29E201000060000007A00007B00007C0 * C38A8  δ.......p..p..p.
        NIBHEX  08A00008A00008A0C10              * C38C8  ∡..∡..∡..
        ENDLENGTH                                * C38DB

* ROMPTR 0A9 01C
* refs (1): C31C5
ROMP_0A9_01C:
        :: EditMenu ;                            * C38DB

* ROMPTR 0A9 01D
* refs (1): C31C5
ROMP_0A9_01D:
        CON(5)  DOARRY                           * C38EA  DOARRY
        LENGTH                                   * C38EF  length, to #C3927
        NIBHEX  29E20100006000000770000780000771 * C38F4  δ.......p..p..p.
        NIBHEX  08A00008A00008A0C10              * C3914  ∡..∡..∡..
        ENDLENGTH                                * C3927

* ROMPTR 0A9 01E
* refs (1): C31C5
ROMP_0A9_01E:
        ROMPTR 0A7 006                           * C3927

* ROMPTR 0A9 01F
* refs (1): C31C5
ROMP_0A9_01F:
        CON(5)  DOARRY                           * C3932  DOARRY
        LENGTH                                   * C3937  length, to #C396F
        NIBHEX  29E20100006000000750000760000761 * C393C  δ.......p..p..p.
        NIBHEX  08A00008A00008A0C10              * C395C  ∡..∡..∡..
        ENDLENGTH                                * C396F

* ROMPTR 0A9 020
* refs (1): C31C5
MenuPr~1~1~1:
        CON(5)  DOARRY                           * C396F  DOARRY
        LENGTH                                   * C3974  length, to #C39FA
        NIBHEX  29E2010000310002009E0200AE0200BE * C3979  δ...... .é .ê .ë
        NIBHEX  0200CE0200DE0200EE02005E02006E02 * C3999   .ì .í .î .å .æ 
        NIBHEX  008E02007E02004E02006A0200380200 * C39B9  .è .ç .ä .¦ .√ .
        NIBHEX  480200580200680200E80200F80BA0C1 * C39D9  ∫ .Σ .▶ .← .↓°..
        NIBHEX  0                                * C39F9
        ENDLENGTH                                * C39FA

* ROMPTR 0A9 021
* refs (1): C31C5
MenuPr~1~1~2:
        CON(5)  DOARRY                           * C39FA  DOARRY
        LENGTH                                   * C39FF  length, to #C3A67
        NIBHEX  29E2010000E00002009A0200AA020089 * C3A04  δ...... .© .ª .σ
        NIBHEX  02002A0200F71200D00200F902009902 * C3A24   .¢ ..!.. .∞ .τ 
        NIBHEX  004A02005A02000812008A02006A0200 * C3A44  .¤ .¥ .∡!.¨ .¦ .
        NIBHEX  7A0                              * C3A64  §
        ENDLENGTH                                * C3A67

* ROMPTR 0A9 022
* refs (1): C31C5
ROMP_0A9_022:
        CON(5)  DOARRY                           * C3A67  DOARRY
        LENGTH                                   * C3A6C  length, to #C3AA4
        NIBHEX  29E2010000600008A0D108A0E102009A * C3A71  δ......∡..∡.. .©
        NIBHEX  0200890200C90200D90              * C3A91   .σ .Π .Ω
        ENDLENGTH                                * C3AA4

* ROMPTR 0A9 023
* refs (1): C31C5
ROMP_0A9_023:
        CON(5)  DOARRY                           * C3AA4  DOARRY
        LENGTH                                   * C3AA9  length, to #C3B05
        NIBHEX  29E2010000C00002002B02003B02000B * C3AAE  δ...... .² .³ .°
        NIBHEX  02001B02000A02001A0BA0060BA01608 * C3ACE   .± .. .¡°.`°.a∡
        NIBHEX  A00008A00008A00008A0F10          * C3AEE  ..∡..∡..∡..
        ENDLENGTH                                * C3B05

* ROMPTR 0A9 024
* refs (1): C31C5
ROMP_0A9_024:
        CON(5)  DOARRY                           * C3B05  DOARRY
        LENGTH                                   * C3B0A  length, to #C3B66
        NIBHEX  29E2010000C0000BA0B60BA0360BA056 * C3B0F  δ......°.k°.c°.e
        NIBHEX  0BA0660BA0760BA0D60BA0E60BA02608 * C3B2F  °.f°.g°.m°.n°.b∡
        NIBHEX  A00008A00008A00008A0F10          * C3B4F  ..∡..∡..∡..
        ENDLENGTH                                * C3B66

* ROMPTR 0A9 025
* refs (1): C31C5
MenuPr~1~1~3:
        CON(5)  DOARRY                           * C3B66  DOARRY
        LENGTH                                   * C3B6B  length, to #C3BBB
        NIBHEX  29E2010000A00002007D02001D02003D * C3B70  δ...... .× .Ñ .Ó
        NIBHEX  02004D0200C90200D908A0F602005D02 * C3B90   .Ô .Π .Ω∡.o .Õ 
        NIBHEX  000A0BA0810                      * C3BB0  ..°..
        ENDLENGTH                                * C3BBB

* ROMPTR 0A9 026
* refs (1): C31C5
MenuPr~1~1~4:
        CON(5)  DOARRY                           * C3BBB  DOARRY
        LENGTH                                   * C3BC0  length, to #C3C1C
        NIBHEX  29E2010000C00002002D02003C0200EC * C3BC5  δ...... .Ò .Ã .Î
        NIBHEX  0200FC02000D02008D0200BC0200CC02 * C3BE5   .Ï .Ð .Ø .Ë .Ì 
        NIBHEX  00DC0200AC02006C02007C0          * C3C05  .Í .Ê .Æ .Ç
        ENDLENGTH                                * C3C1C

* ROMPTR 0A9 027
* refs (1): C31C5
MenuPr~1~1~5:
        CON(5)  DOARRY                           * C3C1C  DOARRY
        LENGTH                                   * C3C21  length, to #C3C5F
        NIBHEX  29E201000070000BA0A50BA0B50BA0C5 * C3C26  δ......°.Z°.[°.\
        NIBHEX  0200A71200930200730007C10        * C3C46   .z!.9 .7.p.
        ENDLENGTH                                * C3C5F

* ROMPTR 0A9 028
* refs (1): C31C5
MenuPr~1~1~6:
        CON(5)  DOARRY                           * C3C5F  DOARRY
        LENGTH                                   * C3C64  length, to #C3CA2
        NIBHEX  29E201000070000200AC02009D08A007 * C3C69  δ...... .Ê .Ù∡.p
        NIBHEX  0200230200330BA0D50200430        * C3C89   .2 .3°.] .4
        ENDLENGTH                                * C3CA2

* ROMPTR 0A9 029
* refs (1): C31C5
MenuPr~1~1~7:
        CON(5)  DOARRY                           * C3CA2  DOARRY
        LENGTH                                   * C3CA7  length, to #C3CE5
        NIBHEX  29E2010000700008A00208A01208A022 * C3CAC  δ......∡. ∡.!∡."
        NIBHEX  08A0320007E00200820200920        * C3CCC  ∡.#.p. .( .)
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
        CON(5)  DOARRY                           * C3DA0  DOARRY
        LENGTH                                   * C3DA5  length, to #C3DD7
        NIBHEX  29E201000050000200B00200E00200C0 * C3DAA  δ...... .. .. ..
        NIBHEX  0200F00200D00                    * C3DCA   .. ..
        ENDLENGTH                                * C3DD7

* ROMPTR 0A9 03C
* refs (1): C31C5
ROMP_0A9_03C:
        CON(5)  DOARRY                           * C3DD7  DOARRY
        LENGTH                                   * C3DDC  length, to #C3E14
        NIBHEX  29E201000060000007D0000781000720 * C3DE1  δ.......p..p..p.
        NIBHEX  00073008A00008A0520              * C3E01  .p.∡..∡.%
        ENDLENGTH                                * C3E14

* ROMPTR 0A9 03D
* refs (1): C31C5
ROMP_0A9_03D:
        CON(5)  DOARRY                           * C3E14  DOARRY
        LENGTH                                   * C3E19  length, to #C3E51
        NIBHEX  29E201000060000200A20200C20200D2 * C3E1E  δ...... .* ., .-
        NIBHEX  0200B202006308A0420              * C3E3E   .+ .6∡.$
        ENDLENGTH                                * C3E51

* ROMPTR 0A9 03E
* refs (1): C31C5
ROMP_0A9_03E:
        CON(5)  DOARRY                           * C3E51  DOARRY
        LENGTH                                   * C3E56  length, to #C3EA6
        NIBHEX  29E2010000A0000200C90200D902001A * C3E5B  δ...... .Π .Ω .¡
        NIBHEX  02000A02004A02005A02009A02002A0B * C3E7B   .. .¤ .¥ .© .¢°
        NIBHEX  A0060BA0160                      * C3E9B  .`°.a
        ENDLENGTH                                * C3EA6

* ROMPTR 0A9 03F
* refs (1): C31C5
ROMP_0A9_03F:
        CON(5)  DOARRY                           * C3EA6  DOARRY
        LENGTH                                   * C3EAB  length, to #C3EE3
        NIBHEX  29E2010000600008A06208A07208A082 * C3EB0  δ......∡.&∡.'∡.(
        NIBHEX  08A09208A0A208A0B20              * C3ED0  ∡.)∡.*∡.+
        ENDLENGTH                                * C3EE3

* ROMPTR 0A9 040
* refs (1): C31C5
ROMP_0A9_040:
        CON(5)  DOARRY                           * C3EE3  DOARRY
        LENGTH                                   * C3EE8  length, to #C3F44
        NIBHEX  29E2010000C00008A0D208A0E208A0F2 * C3EED  δ......∡.-∡..∡./
        NIBHEX  08A00308A01308A02308A00008A00008 * C3F0D  ∡.0∡.1∡.2∡..∡..∡
        NIBHEX  A00008A00008A00008A0C20          * C3F2D  ..∡..∡..∡.,
        ENDLENGTH                                * C3F44

* ROMPTR 0A9 041
* refs (1): C31C5
ROMP_0A9_041:
        CON(5)  DOARRY                           * C3F44  DOARRY
        LENGTH                                   * C3F49  length, to #C3FA5
        NIBHEX  29E2010000C00008A03308A04308A053 * C3F4E  δ......∡.3∡.4∡.5
        NIBHEX  08A05008A06008A07008A00008A00008 * C3F6E  ∡..∡..∡..∡..∡..∡
        NIBHEX  A00008A00008A00008A0C20          * C3F8E  ..∡..∡..∡.,
        ENDLENGTH                                * C3FA5

* ROMPTR 0A9 042
* refs (1): C31C5
ROMP_0A9_042:
        CON(5)  DOARRY                           * C3FA5  DOARRY
        LENGTH                                   * C3FAA  length, to #C4006
        NIBHEX  29E2010000C000020038020048020058 * C3FAF  δ...... .√ .∫ .Σ
        NIBHEX  0200680200E80200F802007902006908 * C3FCF   .▶ .← .↓ .ρ .λ∡
        NIBHEX  A06308A00008A00008A0C20          * C3FEF  .6∡..∡..∡.,
        ENDLENGTH                                * C4006

* ROMPTR 0A9 043
* refs (1): C31C5
ROMP_0A9_043:
        CON(5)  DOARRY                           * C4006  DOARRY
        LENGTH                                   * C400B  length, to #C4043
        NIBHEX  29E201000060000200B71200C71200E7 * C4010  δ...... .{!.|!.~
        NIBHEX  1200D718A00008A0C20              * C4030  !.}ā..∡.,
        ENDLENGTH                                * C4043

* ROMPTR 0A9 044
* refs (1): C31C5
ROMP_0A9_044:
        CON(5)  DOARRY                           * C4043  DOARRY
        LENGTH                                   * C4048  length, to #C4080
        NIBHEX  29E201000060000200C518A0730200B5 * C404D  δ...... .\ā.7 .[
        NIBHEX  1200D518A00008A0C20              * C406D  !.]ā..∡.,
        ENDLENGTH                                * C4080

* ROMPTR 0A9 045
* refs (1): C31C5
ROMP_0A9_045:
        CON(5)  DOARRY                           * C4080  DOARRY
        LENGTH                                   * C4085  length, to #C40E1
        NIBHEX  29E2010000C00008A08308A09308A0A3 * C408A  δ......∡.8∡.9∡.:
        NIBHEX  08A0B308A0C308A0D308A0E308A00008 * C40AA  ∡.;∡.<∡.=∡.>∡..∡
        NIBHEX  A00008A00008A00008A0C20          * C40CA  ..∡..∡..∡.,
        ENDLENGTH                                * C40E1

* ROMPTR 0A9 046
* refs (1): C31C5
ROMP_0A9_046:
        CON(5)  DOARRY                           * C40E1  DOARRY
        LENGTH                                   * C40E6  length, to #C412A
        NIBHEX  29E20100008000020085120062020072 * C40EB  δ...... .X!.& .'
        NIBHEX  08A00008A0F308A0040200061200161  * C410B  ∡..∡.?∡.@ .`!.a
        ENDLENGTH                                * C412A

* ROMPTR 0A9 047
* refs (1): C31C5
ROMP_0A9_047:
        CON(5)  DOARRY                           * C412A  DOARRY
        LENGTH                                   * C412F  length, to #C418B
        NIBHEX  29E2010000C0000200120200020200F5 * C4134  δ...... .! .  ._
        NIBHEX  12004202005202009518A00008A00008 * C4154  !.$ .% .Yā..∡..∡
        NIBHEX  A00008A00008A00008A0140          * C4174  ..∡..∡..∡.A
        ENDLENGTH                                * C418B

* ROMPTR 0A9 048
* refs (1): C31C5
ROMP_0A9_048:
        CON(5)  DOARRY                           * C418B  DOARRY
        LENGTH                                   * C4190  length, to #C41EC
        NIBHEX  29E2010000C0000200741200841200A4 * C4195  δ...... .G!.H!.J
        NIBHEX  1200941200B41200C412004412005412 * C41B5  !.I!.K!.L!.D!.E!
        NIBHEX  006418A00008A00008A0140          * C41D5  .Fā..∡..∡.A
        ENDLENGTH                                * C41EC

* ROMPTR 0A9 049
* refs (1): C31C5
ROMP_0A9_049:
        CON(5)  DOARRY                           * C41EC  DOARRY
        LENGTH                                   * C41F1  length, to #C4247
        NIBHEX  29E2010000B000020031120021120081 * C41F6  δ...... ..!..!..
        NIBHEX  1200911200711200411200D01200E012 * C4216  !..!..!..!..!..!
        NIBHEX  006112001118A0240                * C4236  ..!..ā.B
        ENDLENGTH                                * C4247

* ROMPTR 0A9 04A
* refs (1): C31C5
ROMP_0A9_04A:
        ROMPTR 0A7 005                           * C4247

* ROMPTR 0A9 04B
* refs (1): C31C5
ROMP_0A9_04B:
        CON(5)  DOARRY                           * C4252  DOARRY
        LENGTH                                   * C4257  length, to #C428F
        NIBHEX  29E2010000600008A0440200BF08A010 * C425C  δ......∡.D .û∡..
        NIBHEX  08A00008A00008A0340              * C427C  ∡..∡..∡.C
        ENDLENGTH                                * C428F

* ROMPTR 0A9 04C
* refs (1): C31C5
ROMP_0A9_04C:
        CON(5)  DOARRY                           * C428F  DOARRY
        LENGTH                                   * C4294  length, to #C42F0
        NIBHEX  29E2010000C0000BA0B20BA0E20BA0C2 * C4299  δ......°.+°..°.,
        NIBHEX  0BA0F20BA0D20BA00308A00008A00008 * C42B9  °./°.-°.0∡..∡..∡
        NIBHEX  A00008A00008A00008A0340          * C42D9  ..∡..∡..∡.C
        ENDLENGTH                                * C42F0

* ROMPTR 0A9 04D
* refs (1): C31C5
ROMP_0A9_04D:
        CON(5)  DOARRY                           * C42F0  DOARRY
        LENGTH                                   * C42F5  length, to #C432D
        NIBHEX  29E201000060000BA0250BA0350BA045 * C42FA  δ......°.R°.S°.T
        NIBHEX  08A00008A00008A0340              * C431A  ∡..∡..∡.C
        ENDLENGTH                                * C432D

* ROMPTR 0A9 04E
* refs (1): C31C5
ROMP_0A9_04E:
        CON(5)  DOARRY                           * C432D  DOARRY
        LENGTH                                   * C4332  length, to #C436A
        NIBHEX  29E201000060000200840BA0630200B7 * C4337  δ...... .H°.6 .{
        NIBHEX  08A00008A00008A0340              * C4357  ∡..∡..∡.C
        ENDLENGTH                                * C436A

* ROMPTR 0A9 04F
* refs (1): C31C5
ROMP_0A9_04F:
        CON(5)  DOARRY                           * C436A  DOARRY
        LENGTH                                   * C436F  length, to #C43A7
        NIBHEX  29E2010000600008A0540BA0850BA095 * C4374  δ......∡.E°.X°.Y
        NIBHEX  08A08408A00008A0340              * C4394  ∡.H∡..∡.C
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
        CON(5)  DOARRY                           * C43D3  DOARRY
        LENGTH                                   * C43D8  length, to #C4410
        NIBHEX  29E2010000600008A04508A05508A010 * C43DD  δ......∡.T∡.U∡..
        NIBHEX  08A00008A00008A0050              * C43FD  ∡..∡..∡.P
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
        CON(5)  DOARRY                           * C4426  DOARRY
        LENGTH                                   * C442B  length, to #C4463
        NIBHEX  29E2010000600008A09508A0A508A0B5 * C4430  δ......∡.Y∡.Z∡.[
        NIBHEX  08A00008A00008A0050              * C4450  ∡..∡..∡.P
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
        CON(5)  DOARRY                           * C4484  DOARRY
        LENGTH                                   * C4489  length, to #C44C1
        NIBHEX  29E201000060000200E11200F11200C1 * C448E  δ...... ..!..!..
        NIBHEX  18A03008A00008A0D40              * C44AE  ā..∡..∡.M
        ENDLENGTH                                * C44C1

* ROMPTR 0A9 05C
* refs (1): C31C5
ROMP_0A9_05C:
        CON(5)  DOARRY                           * C44C1  DOARRY
        LENGTH                                   * C44C6  length, to #C44FE
        NIBHEX  29E2010000600008A00608A01608A026 * C44CB  δ......∡.`∡.a∡.b
        NIBHEX  08A00008A00008A0F40              * C44EB  ∡..∡..∡.O
        ENDLENGTH                                * C44FE

* ROMPTR 0A9 05D
* refs (1): C31C5
ROMP_0A9_05D:
        CON(5)  DOARRY                           * C44FE  DOARRY
        LENGTH                                   * C4503  length, to #C4565
        NIBHEX  29E2010000D0000200D41200E4120005 * C4508  δ...... .M!.N!.P
        NIBHEX  1200151200251200351200901200A012 * C4528  !.Q!.R!.S!..!..!
        NIBHEX  00701200801200FF0200201200101    * C4548  ..!..!.ÿ ..!..
        ENDLENGTH                                * C4565

* ROMPTR 0A9 05E
* refs (1): C31C5
ROMP_0A9_05E:
        CON(5)  DOARRY                           * C4565  DOARRY
        LENGTH                                   * C456A  length, to #C45D2
        NIBHEX  29E2010000E000020011020061020001 * C456F  δ...... .. .. ..
        NIBHEX  02007102002108A0360200F10200E102 * C458F   .. ..∡.c .. .. 
        NIBHEX  00270200370200470200570200D10200 * C45AF  .r .s .t .u .. .
        NIBHEX  810                              * C45CF  .
        ENDLENGTH                                * C45D2

* ROMPTR 0A9 05F
* refs (1): C31C5
ROMP_0A9_05F:
        CON(5)  DOARRY                           * C45D2  DOARRY
        LENGTH                                   * C45D7  length, to #C4633
        NIBHEX  29E2010000C000020051020041020091 * C45DC  δ...... .. .. ..
        NIBHEX  0200A10200C10200B108A00008A00008 * C45FC   .. .. ..∡..∡..∡
        NIBHEX  A00008A00008A00008A0460          * C461C  ..∡..∡..∡.d
        ENDLENGTH                                * C4633

* ROMPTR 0A9 060
* refs (1): C31C5
ROMP_0A9_060:
        CON(5)  DOARRY                           * C4633  DOARRY
        LENGTH                                   * C4638  length, to #C4670
        NIBHEX  29E2010000600008A05608A06608A076 * C463D  δ......∡.e∡.f∡.g
        NIBHEX  08A08608A09608A0A60              * C465D  ∡.h∡.i∡.j
        ENDLENGTH                                * C4670

* ROMPTR 0A9 061
* refs (1): C31C5
ROMP_0A9_061:
        CON(5)  DOARRY                           * C4670  DOARRY
        LENGTH                                   * C4675  length, to #C46AD
        NIBHEX  29E201000060000200E11200F11200C1 * C467A  δ...... ..!..!..
        NIBHEX  18A03008A00008A0B60              * C469A  ā..∡..∡.k
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
        CON(5)  DOARRY                           * C46C3  DOARRY
        LENGTH                                   * C46C8  length, to #C4724
        NIBHEX  29E2010000C0000200C21200921200B2 * C46CD  δ...... .,!.)!.+
        NIBHEX  1200821200A21200B31200D21BA0820B * C46ED  !.(!.*!.;!.-±.(°
        NIBHEX  A09208A00008A00008A0B60          * C470D  .)∡..∡..∡.k
        ENDLENGTH                                * C4724

* ROMPTR 0A9 065
* refs (1): C31C5
ROMP_0A9_065:
        CON(5)  DOARRY                           * C4724  DOARRY
        LENGTH                                   * C4729  length, to #C4761
        NIBHEX  29E2010000600008A0C608A0D608A0E6 * C472E  δ......∡.l∡.m∡.n
        NIBHEX  08A00008A00008A0B60              * C474E  ∡..∡..∡.k
        ENDLENGTH                                * C4761

* ROMPTR 0A9 066
* refs (1): C31C5
ROMP_0A9_066:
        CON(5)  DOARRY                           * C4761  DOARRY
        LENGTH                                   * C4766  length, to #C47C2
        NIBHEX  29E2010000C0000200A31200E2120013 * C476B  δ...... .:!..!.1
        NIBHEX  1200031200121200221BA0A208A00008 * C478B  !.0!.!!."±.*∡..∡
        NIBHEX  A00008A00008A00008A0B60          * C47AB  ..∡..∡..∡.k
        ENDLENGTH                                * C47C2

* ROMPTR 0A9 067
* refs (1): C31C5
ROMP_0A9_067:
        CON(5)  DOARRY                           * C47C2  DOARRY
        LENGTH                                   * C47C7  length, to #C4823
        NIBHEX  29E2010000C000020032120042120052 * C47CC  δ...... .#!.$!.%
        NIBHEX  12006212007212000218A00008A00008 * C47EC  !.&!.'!. ā..∡..∡
        NIBHEX  A00008A00008A00008A0B60          * C480C  ..∡..∡..∡.k
        ENDLENGTH                                * C4823

* ROMPTR 0A9 068
* refs (1): C31C5
ROMP_0A9_068:
        CON(5)  DOARRY                           * C4823  DOARRY
        LENGTH                                   * C4828  length, to #C4884
        NIBHEX  29E2010000C00008A03708A04708A057 * C482D  δ......∡.s∡.t∡.u
        NIBHEX  02000F0200B61200E618A06702005712 * C484D   .ð .k!.nā.v .u!
        NIBHEX  00D61200A61BA0E50BA0F50          * C486D  .m!.j±.^°._
        ENDLENGTH                                * C4884

* ROMPTR 0A9 069
* refs (1): C31C5
ROMP_0A9_069:
        CON(5)  DOARRY                           * C4884  DOARRY
        LENGTH                                   * C4889  length, to #C48C1
        NIBHEX  29E201000060000200071200971200C6 * C488E  δ...... .p!.y!.l
        NIBHEX  1200F618A00008A0770              * C48AE  !.oā..∡.w
        ENDLENGTH                                * C48C1

* ROMPTR 0A9 06A
* refs (1): C31C5
ROMP_0A9_06A:
        ROMPTR 0A7 023                           * C48C1

* ROMPTR 0A9 06B
* refs (1): C31C5
ROMP_0A9_06B:
        CON(5)  DOARRY                           * C48CC  DOARRY
        LENGTH                                   * C48D1  length, to #C492D
        NIBHEX  29E2010000C00002004F02002F02001F * C48D6  δ...... .ô .ò .ñ
        NIBHEX  02006F02003F08A0D702000F08A00008 * C48F6   .ö .ó∡.} .ð∡..∡
        NIBHEX  A00008A00008A00008A0770          * C4916  ..∡..∡..∡.w
        ENDLENGTH                                * C492D

* ROMPTR 0A9 06C
* refs (1): C31C5
ROMP_0A9_06C:
        ROMPTR 0A7 024                           * C492D

* ROMPTR 0A9 06D
* refs (1): C31C5
ROMP_0A9_06D:
        CON(5)  DOARRY                           * C4938  DOARRY
        LENGTH                                   * C493D  length, to #C4999
        NIBHEX  29E2010000C000020076120086120077 * C4942  δ...... .g!.h!.w
        NIBHEX  12008712006712009618A00008A00008 * C4962  !.x!.v!.iā..∡..∡
        NIBHEX  A00008A00008A00008A0870          * C4982  ..∡..∡..∡.x
        ENDLENGTH                                * C4999

* ROMPTR 0A9 06E
* refs (1): C31C5
ROMP_0A9_06E:
        CON(5)  DOARRY                           * C4999  DOARRY
        LENGTH                                   * C499E  length, to #C49E2
        NIBHEX  29E2010000800008A0080200E5120046 * C49A3  δ......∡.∡ .^!.d
        NIBHEX  1BA0610BA0710200661200561BA0180  * C49C3  ±..°.. .f!.e±.ā
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
        CON(5)  DOARRY                           * C4A03  DOARRY
        LENGTH                                   * C4A08  length, to #C4A40
        NIBHEX  29E201000060000BA0220BA0320BA0F6 * C4A0D  δ......°."°.#°.o
        NIBHEX  08A00008A00008A0180              * C4A2D  ∡..∡..∡.ā
        ENDLENGTH                                * C4A40

* ROMPTR 0A9 073
* refs (1): C31C5
ROMP_0A9_073:
        CON(5)  DOARRY                           * C4A40  DOARRY
        LENGTH                                   * C4A45  length, to #C4A7D
        NIBHEX  29E201000060000BA0020BA01208A000 * C4A4A  δ......°. °.!∡..
        NIBHEX  08A00008A00008A0180              * C4A6A  ∡..∡..∡.ā
        ENDLENGTH                                * C4A7D

* ROMPTR 0A9 074
* refs (1): C31C5
ROMP_0A9_074:
        CON(5)  DOARRY                           * C4A7D  DOARRY
        LENGTH                                   * C4A82  length, to #C4ADE
        NIBHEX  29E2010000C0000BA0F60BA0070BA017 * C4A87  δ......°.o°.p°.q
        NIBHEX  0BA0270BA0370BA04708A00008A00008 * C4AA7  °.r°.s°.t∡..∡..∡
        NIBHEX  A00008A00008A00008A0180          * C4AC7  ..∡..∡..∡.ā
        ENDLENGTH                                * C4ADE

* ROMPTR 0A9 075
* refs (1): C31C5
ROMP_0A9_075:
        CON(5)  DOARRY                           * C4ADE  DOARRY
        LENGTH                                   * C4AE3  length, to #C4B63
        NIBHEX  29E201000021000BA0570BA0670BA077 * C4AE8  δ......°.u°.v°.w
        NIBHEX  0BA0870BA0970BA0A70BA0B70BA0C70B * C4B08  °.x°.y°.z°.{°.|°
        NIBHEX  A0D70BA0E70BA0F70BA00808A00008A0 * C4B28  .}°.~°..°.∡∡..∡.
        NIBHEX  0008A00008A00008A00008A0180      * C4B48  .∡..∡..∡..∡.ā
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
        REL(5)  MenuMTH~1~1~1                    * C4BE5  004 
        REL(5)  ROMP_0A9_005                     * C4BEA  005 
        REL(5)  ROMP_0A9_006                     * C4BEF  006 
        REL(5)  ROMP_0A9_007                     * C4BF4  007 
        REL(5)  ROMP_0A9_008                     * C4BF9  008 
        REL(5)  ROMP_0A9_009                     * C4BFE  009 
        REL(5)  ROMP_0A9_00A                     * C4C03  00A 
        REL(5)  MenuMTH~1~1~2                    * C4C08  00B 
        REL(5)  MenuMTH~1~1~3                    * C4C0D  00C 
        REL(5)  MenuMTH~1~1~4                    * C4C12  00D 
        REL(5)  MenuMTH~1~1~5                    * C4C17  00E 
        REL(5)  ROMP_0A9_00F                     * C4C1C  00F 
        REL(5)  ROMP_0A9_010                     * C4C21  010 
        REL(5)  ROMP_0A9_011                     * C4C26  011 
        REL(5)  ROMP_0A9_012                     * C4C2B  012 
        REL(5)  MenuMTH~1~1~6                    * C4C30  013 
        REL(5)  MenuMTH~1~1~7                    * C4C35  014 
        REL(5)  MenuMTH~1~1~8                    * C4C3A  015 
        REL(5)  MenuPr~1                         * C4C3F  016 
        REL(5)  ROMP_0A9_017                     * C4C44  017 
        REL(5)  ROMP_0A9_018                     * C4C49  018 
        REL(5)  ROMP_0A9_019                     * C4C4E  019 
        REL(5)  ROMP_0A9_01A                     * C4C53  01A 
        REL(5)  ROMP_0A9_01B                     * C4C58  01B 
        REL(5)  ROMP_0A9_01C                     * C4C5D  01C 
        REL(5)  ROMP_0A9_01D                     * C4C62  01D 
        REL(5)  ROMP_0A9_01E                     * C4C67  01E 
        REL(5)  ROMP_0A9_01F                     * C4C6C  01F 
        REL(5)  MenuPr~1~1~1                     * C4C71  020 
        REL(5)  MenuPr~1~1~2                     * C4C76  021 
        REL(5)  ROMP_0A9_022                     * C4C7B  022 
        REL(5)  ROMP_0A9_023                     * C4C80  023 
        REL(5)  ROMP_0A9_024                     * C4C85  024 
        REL(5)  MenuPr~1~1~3                     * C4C8A  025 
        REL(5)  MenuPr~1~1~4                     * C4C8F  026 
        REL(5)  MenuPr~1~1~5                     * C4C94  027 
        REL(5)  MenuPr~1~1~6                     * C4C99  028 
        REL(5)  MenuPr~1~1~7                     * C4C9E  029 
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
        NIBHEX  C050000                          * C4E1F  ...
