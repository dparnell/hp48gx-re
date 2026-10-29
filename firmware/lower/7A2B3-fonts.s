* HP 48GX ROM revision R, #7A2B3-#7C854: System fonts (10-row, 8-row, minifont) and the minifont remap table
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Minifont MiniRemap Font8 Font10
* Follows on from the previous file (at #7A2B3 in the original ROM).

* 10-row font
Font10:
        GLYPHS  "fonts/font10.png" 10 #1F 225    * 7A2B3  10-row font (used when XM=1): code c at #7A047 + 20*c, codes #1F-#FF

* 8-row font
Font8:
        GLYPHS  "fonts/font8.png" 8 #1F 225      * 7B447  8-row font (used when XM=0): code c at #7B257 + 16*c, codes #1F-#FF

* Minifont glyphs
Minifont:
        GLYPHS  "fonts/minifont.png" 5 #1F 121 6424664623344342444444444442344445444444542454654454444464443434434245454644546555665566544545555666546245564644352644444 * 7C257  minifont: index i at #7C102 + 11*i, an advance-width nibble then 5 rows, codes #1F-#97

        CON(1)  6                                * 7C78A  minifont glyph #98 (Ø ø): advance width
        CON(2)  #08                              * 7C78B  row 1
        CON(2)  #0E                              * 7C78D  row 2
        CON(2)  #15                              * 7C78F  row 3
        CON(2)  #0E                              * 7C791  row 4; row 5 is the first byte of MiniRemap

* Minifont index for codes #9F-#FF
MiniRemap:
        CON(2)  #02                              * 7C793  the last row of glyph #98; never read as a remap (codes above #9F are)
        CON(2)  #20                              * 7C795  code #A0 
        CON(2)  #86                              * 7C797  code #A1 ¡
        CON(2)  #87                              * 7C799  code #A2 ¢
        CON(2)  #88                              * 7C79B  code #A3 £
        CON(2)  #89                              * 7C79D  code #A4 ¤
        CON(2)  #8A                              * 7C79F  code #A5 ¥
        CON(2)  #62                              * 7C7A1  code #A6 ¦
        CON(2)  #84                              * 7C7A3  code #A7 §
        CON(2)  #8B                              * 7C7A5  code #A8 ¨
        CON(2)  #43                              * 7C7A7  code #A9 ©
        CON(2)  #84                              * 7C7A9  code #AA ª
        CON(2)  #8C                              * 7C7AB  code #AB «
        CON(2)  #2D                              * 7C7AD  code #AC ¬
        CON(2)  #2D                              * 7C7AF  code #AD 
        CON(2)  #52                              * 7C7B1  code #AE ®
        CON(2)  #2D                              * 7C7B3  code #AF ¯
        CON(2)  #8D                              * 7C7B5  code #B0 °
        CON(2)  #8E                              * 7C7B7  code #B1 ±
        CON(2)  #32                              * 7C7B9  code #B2 ²
        CON(2)  #33                              * 7C7BB  code #B3 ³
        CON(2)  #8F                              * 7C7BD  code #B4 ´
        CON(2)  #90                              * 7C7BF  code #B5 µ
        CON(2)  #84                              * 7C7C1  code #B6 ¶
        CON(2)  #91                              * 7C7C3  code #B7 ·
        CON(2)  #2C                              * 7C7C5  code #B8 ¸
        CON(2)  #31                              * 7C7C7  code #B9 ¹
        CON(2)  #84                              * 7C7C9  code #BA º
        CON(2)  #92                              * 7C7CB  code #BB »
        CON(2)  #84                              * 7C7CD  code #BC ¼
        CON(2)  #84                              * 7C7CF  code #BD ½
        CON(2)  #84                              * 7C7D1  code #BE ¾
        CON(2)  #93                              * 7C7D3  code #BF ¿
        CON(2)  #41                              * 7C7D5  code #C0 À
        CON(2)  #41                              * 7C7D7  code #C1 Á
        CON(2)  #41                              * 7C7D9  code #C2 Â
        CON(2)  #41                              * 7C7DB  code #C3 Ã
        CON(2)  #41                              * 7C7DD  code #C4 Ä
        CON(2)  #41                              * 7C7DF  code #C5 Å
        CON(2)  #45                              * 7C7E1  code #C6 Æ
        CON(2)  #43                              * 7C7E3  code #C7 Ç
        CON(2)  #45                              * 7C7E5  code #C8 È
        CON(2)  #45                              * 7C7E7  code #C9 É
        CON(2)  #45                              * 7C7E9  code #CA Ê
        CON(2)  #45                              * 7C7EB  code #CB Ë
        CON(2)  #49                              * 7C7ED  code #CC Ì
        CON(2)  #49                              * 7C7EF  code #CD Í
        CON(2)  #49                              * 7C7F1  code #CE Î
        CON(2)  #49                              * 7C7F3  code #CF Ï
        CON(2)  #44                              * 7C7F5  code #D0 Ð
        CON(2)  #4E                              * 7C7F7  code #D1 Ñ
        CON(2)  #4F                              * 7C7F9  code #D2 Ò
        CON(2)  #4F                              * 7C7FB  code #D3 Ó
        CON(2)  #4F                              * 7C7FD  code #D4 Ô
        CON(2)  #4F                              * 7C7FF  code #D5 Õ
        CON(2)  #4F                              * 7C801  code #D6 Ö
        CON(2)  #94                              * 7C803  code #D7 ×
        CON(2)  #98                              * 7C805  code #D8 Ø
        CON(2)  #55                              * 7C807  code #D9 Ù
        CON(2)  #55                              * 7C809  code #DA Ú
        CON(2)  #55                              * 7C80B  code #DB Û
        CON(2)  #55                              * 7C80D  code #DC Ü
        CON(2)  #59                              * 7C80F  code #DD Ý
        CON(2)  #95                              * 7C811  code #DE Þ
        CON(2)  #96                              * 7C813  code #DF ß
        CON(2)  #41                              * 7C815  code #E0 à
        CON(2)  #41                              * 7C817  code #E1 á
        CON(2)  #41                              * 7C819  code #E2 â
        CON(2)  #41                              * 7C81B  code #E3 ã
        CON(2)  #41                              * 7C81D  code #E4 ä
        CON(2)  #41                              * 7C81F  code #E5 å
        CON(2)  #45                              * 7C821  code #E6 æ
        CON(2)  #43                              * 7C823  code #E7 ç
        CON(2)  #45                              * 7C825  code #E8 è
        CON(2)  #45                              * 7C827  code #E9 é
        CON(2)  #45                              * 7C829  code #EA ê
        CON(2)  #45                              * 7C82B  code #EB ë
        CON(2)  #49                              * 7C82D  code #EC ì
        CON(2)  #49                              * 7C82F  code #ED í
        CON(2)  #49                              * 7C831  code #EE î
        CON(2)  #49                              * 7C833  code #EF ï
        CON(2)  #78                              * 7C835  code #F0 ð
        CON(2)  #4E                              * 7C837  code #F1 ñ
        CON(2)  #4F                              * 7C839  code #F2 ò
        CON(2)  #4F                              * 7C83B  code #F3 ó
        CON(2)  #4F                              * 7C83D  code #F4 ô
        CON(2)  #4F                              * 7C83F  code #F5 õ
        CON(2)  #4F                              * 7C841  code #F6 ö
        CON(2)  #97                              * 7C843  code #F7 ÷
        CON(2)  #98                              * 7C845  code #F8 ø
        CON(2)  #55                              * 7C847  code #F9 ù
        CON(2)  #55                              * 7C849  code #FA ú
        CON(2)  #55                              * 7C84B  code #FB û
        CON(2)  #55                              * 7C84D  code #FC ü
        CON(2)  #59                              * 7C84F  code #FD ý
        CON(2)  #95                              * 7C851  code #FE þ
        CON(2)  #59                              * 7C853  code #FF ÿ
