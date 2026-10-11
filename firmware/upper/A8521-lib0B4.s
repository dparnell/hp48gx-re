* HP 48GX ROM revision R, #A8521-#AB533: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #A8521 in the original ROM).
        RPL

* ROMPTR 0B4 0AB
* refs (1): A2437
ROMP_0B4_0AB:
        ::                                       * A8521
          {                                      * A8526
            BINT41                               * A852B
            ROMPTR  0B4 0AC                      * A8530
            BINT47                               * A853B
            ROMPTR  0B4 0AD                      * A8540
          }                                      * A854B
          EQLookup                               * A8550
          case                                   * A8555
          ::                                     * A855A
            EVAL                                 * A855F
            TRUE                                 * A8564
          ;                                      * A8569
          ROMPTR  0B4 0B0                        * A856E
        ;                                        * A8579

* ROMPTR 0B4 0AC
* refs (1): A2437
ROMP_0B4_0AC:
        ::                                       * A857E
          4GETLAM                                * A8583
          ROMPTR  0B0 0C5                        * A8588  ~gFldVal
          DUPTYPEBINT?                           * A8593
          NOTcase                                * A8598
          TRUE                                   * A859D
          DROP                                   * A85A2
          ROMPTR  0B5 036                        * A85A7
          SWAPDROP                               * A85B2
          TRUE                                   * A85B7
        ;                                        * A85BC

* ROMPTR 0B4 0AD
* refs (1): A2437
ROMP_0B4_0AD:
        ::                                       * A85C1
          4GETLAM                                * A85C6
          DUP                                    * A85CB
          ROMPTR  0B0 0C5                        * A85D0  ~gFldVal
          TYPEBINT?                              * A85DB
          case                                   * A85E0
          ::                                     * A85E5
            #1-                                  * A85EA
            BINT0                                * A85EF
            OVER                                 * A85F4
            ROMPTR  0B0 0D5                      * A85F9  ~sFldVal
            ROMPTR  0B0 0A2                      * A8604
          ;                                      * A860F
          #1-                                    * A8614
          DUP                                    * A8619
          ROMPTR  0B0 0C5                        * A861E  ~gFldVal
          TYPEBINT?                              * A8629
          NOTcaseDROP                            * A862E
          ROMPTR  0B5 036                        * A8633
          DROP                                   * A863E
          OVER                                   * A8643
          ROMPTR  0B0 0D5                        * A8648  ~sFldVal
          ROMPTR  0B0 0A2                        * A8653
        ;                                        * A865E

* ROMPTR 0B4 0AE
* refs (1): A2437
ROMP_0B4_0AE:
        ::                                       * A8663
          BINT41                                 * A8668
          OVER                                   * A866D
          #<>case                                * A8672
          ROMPTR  0B4 0B0                        * A8677
          DROP                                   * A8682
          ROMPTR  0B4 0AF                        * A8687
          TRUE                                   * A8692
        ;                                        * A8697

* ROMPTR 0B4 0AF
* refs (1): A2437
ROMP_0B4_0AF:
        ::                                       * A869C
          4GETLAM                                * A86A1
          ROMPTR  0B0 0C5                        * A86A6  ~gFldVal
          DUPTYPEBINT?                           * A86B1
          NOTcase                                * A86B6
          TRUE                                   * A86BB
          DROP                                   * A86C0
          ROMPTR  0B5 036                        * A86C5
          4GETLAM                                * A86D0
          #1+                                    * A86D5
          ROMPTR  0B0 0C5                        * A86DA  ~gFldVal
          ROMPTR  0B5 040                        * A86E5
          TRUE                                   * A86F0
        ;                                        * A86F5

* ROMPTR 0B4 0B0
* refs (1): A2437
ROMP_0B4_0B0:
        ::                                       * A86FA
          BINT32                                 * A86FF
          #<>case                                * A8704
          FALSE                                  * A8709
          ROMPTR  0B4 0DE                        * A870E
          TRUE                                   * A8719
        ;                                        * A871E

* ROMPTR 0B4 0B1
* refs (1): A2437
ROMP_0B4_0B1:
        ::                                       * A8723
          ROMPTR  0B4 08F                        * A8728
          ROMPTR  0B4 09B                        * A8733
          OBJ_38345                              * A873E
          ROMPTR  0B4 0B0                        * A8743
          BINT55                                 * A874E
          BINT8                                  * A8753
          BINT31                                 * A8758
          BINT9                                  * A875D
          BINT1                                  * A8762
          {                                      * A8767
            BINT0                                * A876C
          }                                      * A8771
          BINT4                                  * A8776
          #       BE2C                           * A877B  48684
          MINUSONE                               * A8785
          MINUSONE                               * A878A
          %0_2A2B4                               * A878F
          MINUSONE                               * A8794
          OBJ_38345                              * A8799
          ROMPTR  0B4 0B4                        * A879E
          BINT100                                * A87A9
          BINT8                                  * A87AE
          BINT31                                 * A87B3
          BINT9                                  * A87B8
          BINT1                                  * A87BD
          {                                      * A87C2
            BINT0                                * A87C7
          }                                      * A87CC
          BINT4                                  * A87D1
          #       BE2D                           * A87D6  48685
          MINUSONE                               * A87E0
          MINUSONE                               * A87E5
          %0_2A2B4                               * A87EA
          MINUSONE                               * A87EF
          ROMPTR  0B4 09E                        * A87F4
          ROMPTR  0B4 09F                        * A87FF
          ROMPTR  0B4 0A0                        * A880A
          OBJ_38345                              * A8815
          ROMPTR  0B4 0B5                        * A881A
          BINT25                                 * A8825
          BINT26                                 * A882A
          BINT25                                 * A882F
          BINT9                                  * A8834
          BINT1                                  * A8839
          {                                      * A883E
            BINT0                                * A8843
          }                                      * A8848
          OBJ_38345                              * A884D
          ROMPTR  0B4 0E0                        * A8852
          #       BE31                           * A885D  48689
          MINUSONE                               * A8867
          MINUSONE                               * A886C
          BINT0                                  * A8871
          MINUSONE                               * A8876
          ROMPTR  0B4 0A2                        * A887B
          ROMPTR  0B4 0A3                        * A8886
          ROMPTR  0B4 0A4                        * A8891
          ROMPTR  0B4 0A5                        * A889C
          BINT11                                 * A88A7
          DUP                                    * A88AC
          'DROPFALSE                             * A88B1
          #       BE23                           * A88B6  48675

* ROMPTR 0B4 0B2
* refs (1): A2437
ROMP_0B4_0B2:
          ::                                     * A88C0
            ROMPTR  0B5 070                      * A88C5
            ROMPTR  0B5 060                      * A88D0
            ROMPTR  0B5 062                      * A88DB
            CHECKPVARS                           * A88E6
            INCOMPDROP                           * A88EB
            2DROP                                * A88F0
            5UNROLL                              * A88F5
            OBJ_37B03                            * A88FA
            SWAPDUP                              * A88FF
            1get(li)?                            * A8904
            7UNROLL                              * A8909
            ROMPTR  0B5 031                      * A890E
            7UNROLL                              * A8919
            7UNROLL                              * A891E
            ROMPTR  0B5 03E                      * A8923
            ROT                                  * A892E
            ROMPTR  0B5 06A                      * A8933
          ;                                      * A893E
          BINT11                                 * A8943
          ROMPTR  0B0 0AA                        * A8948
        ;                                        * A8953

* ROMPTR 0B4 0B3
* refs (1): A2437
ROMP_0B4_0B3:
        ::                                       * A8958
          ROMPTR  0B5 06B                        * A895D
          ROMPTR  0B5 03F                        * A8968
          ROMPTR  0B5 063                        * A8973
          ROMPTR  0B5 061                        * A897E
          ROMPTR  0B5 071                        * A8989
          ROMPTR  0B5 034                        * A8994
          ROMPTR  0B5 02F                        * A899F
        ;                                        * A89AA

* ROMPTR 0B4 0B4
* refs (1): A2437
ROMP_0B4_0B4:
        ::                                       * A89AF
          BINT33                                 * A89B4
          OVER                                   * A89B9
          #<>case                                * A89BE
          ROMPTR  0B4 0B0                        * A89C3
          DROP                                   * A89CE
          1REV                                   * A89D3
          4GETLAM                                * A89D8
          DUPUNROT                               * A89DD
          ROMPTR  0B0 0D5                        * A89E2  ~sFldVal
          ROMPTR  0B0 041                        * A89ED
          TRUE                                   * A89F8
        ;                                        * A89FD

* ROMPTR 0B4 0B5
* refs (1): A2437
ROMP_0B4_0B5:
        ::                                       * A8A02
          BINT41                                 * A8A07
          OVER                                   * A8A0C
          #<>case                                * A8A11
          ROMPTR  0B4 0B0                        * A8A16
          DROP                                   * A8A21
          ROMPTR  0B4 0B6                        * A8A26
          TRUE                                   * A8A31
        ;                                        * A8A36

* ROMPTR 0B4 0B6
* refs (1): A2437
ROMP_0B4_0B6:
        ::                                       * A8A3B
          4GETLAM                                * A8A40
          ROMPTR  0B0 0C5                        * A8A45  ~gFldVal
          DUPTYPEBINT?                           * A8A50
          NOTcase                                * A8A55
          TRUE                                   * A8A5A
          DROP                                   * A8A5F
          BINT2                                  * A8A64
          ROMPTR  0B0 0C5                        * A8A69  ~gFldVal
          BINT3                                  * A8A74
          ROMPTR  0B0 0C5                        * A8A79  ~gFldVal
          4GETLAM                                * A8A84
          #1+                                    * A8A89
          ROMPTR  0B0 0C5                        * A8A8E  ~gFldVal
          ROMPTR  0B5 043                        * A8A99
          TRUE                                   * A8AA4
        ;                                        * A8AA9

* ROMPTR 0B4 0B7
* refs (1): A2437
ROMP_0B4_0B7:
        ::                                       * A8AAE
          ROMPTR  0B4 08F                        * A8AB3
          ROMPTR  0B4 09B                        * A8ABE
          ROMPTR  0B4 09C                        * A8AC9
          ROMPTR  0B4 09D                        * A8AD4
          ROMPTR  0B4 09E                        * A8ADF
          ROMPTR  0B4 09F                        * A8AEA
          ROMPTR  0B4 0A0                        * A8AF5
          OBJ_38345                              * A8B00
          ROMPTR  0B4 0B8                        * A8B05
          BINT25                                 * A8B10
          BINT26                                 * A8B15
          BINT25                                 * A8B1A
          BINT9                                  * A8B1F
          BINT1                                  * A8B24
          {                                      * A8B29
            BINT0                                * A8B2E
          }                                      * A8B33
          OBJ_38345                              * A8B38
          ROMPTR  0B4 0E0                        * A8B3D
          #       BE31                           * A8B48  48689
          MINUSONE                               * A8B52
          MINUSONE                               * A8B57
          BINT0                                  * A8B5C
          MINUSONE                               * A8B61
          ROMPTR  0B4 0A2                        * A8B66
          ROMPTR  0B4 0A3                        * A8B71
          ROMPTR  0B4 0A4                        * A8B7C
          ROMPTR  0B4 0A5                        * A8B87
          BINT11                                 * A8B92
          DUP                                    * A8B97
          'DROPFALSE                             * A8B9C
          #       BE23                           * A8BA1  48675
          ROMPTR  0B4 0A6                        * A8BAB
          BINT11                                 * A8BB6
          ROMPTR  0B0 0AA                        * A8BBB
        ;                                        * A8BC6

* ROMPTR 0B4 0B8
* refs (1): A2437
ROMP_0B4_0B8:
        ::                                       * A8BCB
          BINT41                                 * A8BD0
          OVER                                   * A8BD5
          #<>case                                * A8BDA
          ROMPTR  0B4 0B0                        * A8BDF
          DROP                                   * A8BEA
          ROMPTR  0B4 0B9                        * A8BEF
          TRUE                                   * A8BFA
        ;                                        * A8BFF

* ROMPTR 0B4 0B9
* refs (1): A2437
ROMP_0B4_0B9:
        ::                                       * A8C04
          4GETLAM                                * A8C09
          ROMPTR  0B0 0C5                        * A8C0E  ~gFldVal
          DUPTYPEBINT?                           * A8C19
          NOTcase                                * A8C1E
          TRUE                                   * A8C23
          DROP                                   * A8C28
          BINT2                                  * A8C2D
          ROMPTR  0B0 0C5                        * A8C32  ~gFldVal
          BINT3                                  * A8C3D
          ROMPTR  0B0 0C5                        * A8C42  ~gFldVal
          4GETLAM                                * A8C4D
          #1+                                    * A8C52
          ROMPTR  0B0 0C5                        * A8C57  ~gFldVal
          ROMPTR  0B5 042                        * A8C62
          TRUE                                   * A8C6D
        ;                                        * A8C72

* ROMPTR 0B4 0BA
* refs (1): A2437
ROMP_0B4_0BA:
        ::                                       * A8C77
          ROMPTR  0B4 090                        * A8C7C
          ROMPTR  0B4 091                        * A8C87
          ROMPTR  0B4 092                        * A8C92
          ROMPTR  0B4 093                        * A8C9D
          ROMPTR  0B4 095                        * A8CA8
          #       BE36                           * A8CB3  48694
          BINT91                                 * A8CBD
          BINT19                                 * A8CC2
          ROMPTR  0B4 096                        * A8CC7
          ROMPTR  0B4 097                        * A8CD2
          ROMPTR  0B4 098                        * A8CDD
          ROMPTR  0B4 099                        * A8CE8
          ROMPTR  0B4 09A                        * A8CF3
          ROMPTR  0B4 09B                        * A8CFE
          ROMPTR  0B4 09C                        * A8D09
          ROMPTR  0B4 09D                        * A8D14
          ROMPTR  0B4 09E                        * A8D1F
          ROMPTR  0B4 09F                        * A8D2A
          OBJ_38345                              * A8D35
          ROMPTR  0B4 0B0                        * A8D3A
          BINT115                                * A8D45
          BINT17                                 * A8D4A
          BINT13                                 * A8D4F
          BINT9                                  * A8D54
          BINT1                                  * A8D59
          {                                      * A8D5E
            BINT6                                * A8D63
          }                                      * A8D68
          BINT4                                  * A8D6D
          #       BE37                           * A8D72  48695
          MINUSONE                               * A8D7C
          MINUSONE                               * A8D81
          '                                      * A8D86
          ID      Y                              * A8D8B
          MINUSONE                               * A8D94
          OBJ_38345                              * A8D99
          ROMPTR  0B4 0B8                        * A8D9E
          BINT25                                 * A8DA9
          BINT26                                 * A8DAE
          BINT25                                 * A8DB3
          BINT9                                  * A8DB8
          BINT1                                  * A8DBD
          {                                      * A8DC2
            BINT0                                * A8DC7
          }                                      * A8DCC
          OBJ_38345                              * A8DD1
          ROMPTR  0B4 0E0                        * A8DD6
          #       BE31                           * A8DE1  48689
          MINUSONE                               * A8DEB
          MINUSONE                               * A8DF0
          BINT0                                  * A8DF5
          MINUSONE                               * A8DFA
          ROMPTR  0B4 0A2                        * A8DFF
          ROMPTR  0B4 0A3                        * A8E0A
          ROMPTR  0B4 0A4                        * A8E15
          ROMPTR  0B4 0A5                        * A8E20
          BINT11                                 * A8E2B
          DUP                                    * A8E30
          'DROPFALSE                             * A8E35
          #       BE23                           * A8E3A  48675

* ROMPTR 0B4 0BB
* refs (1): A2437
ROMP_0B4_0BB:
          ::                                     * A8E44
            CHECKPVARS                           * A8E49
            INCOMPDROP                           * A8E4E
            1get(li)?                            * A8E53
            SWAPDROP                             * A8E58
            5ROLLDROP                            * A8E5D
            5ROLLDROP                            * A8E62
            4ROLL                                * A8E67
            DUP                                  * A8E6C
            1get(li)?                            * A8E71
            5UNROLL                              * A8E76
            ROMPTR  0B5 030                      * A8E7B
            5UNROLL                              * A8E86
            5UNROLL                              * A8E8B
            ROMPTR  0B5 070                      * A8E90
            4UNROLL                              * A8E9B
            ROMPTR  0B5 060                      * A8EA0
            4UNROLL                              * A8EAB
            SWAPROT                              * A8EB0
            ROMPTR  0B5 03E                      * A8EB5
            ROT                                  * A8EC0
            ROMPTR  0B5 06A                      * A8EC5
          ;                                      * A8ED0
          BINT11                                 * A8ED5
          ROMPTR  0B0 0AA                        * A8EDA
        ;                                        * A8EE5

* ROMPTR 0B4 0BC
* refs (1): A2437
ROMP_0B4_0BC:
        ::                                       * A8EEA
          ROMPTR  0B5 06B                        * A8EEF
          ROMPTR  0B5 03F                        * A8EFA
          ROMPTR  0B5 039                        * A8F05
          ROMPTR  0B5 061                        * A8F10
          ROMPTR  0B5 071                        * A8F1B
          ROMPTR  0B5 033                        * A8F26
          ROMPTR  0B5 02F                        * A8F31
        ;                                        * A8F3C

* ROMPTR 0B4 0BD
* refs (1): A2437
ROMP_0B4_0BD:
        ::                                       * A8F41
          ROMPTR  0B4 090                        * A8F46
          ROMPTR  0B4 091                        * A8F51
          ROMPTR  0B4 092                        * A8F5C
          #       BE36                           * A8F67  48694
          BINT1                                  * A8F71
          BINT19                                 * A8F76
          #       BE24                           * A8F7B  48676
          BINT43                                 * A8F85
          BINT19                                 * A8F8A
          #       BE25                           * A8F8F  48677
          BINT91                                 * A8F99
          BINT19                                 * A8F9E
          ROMPTR  0B4 096                        * A8FA3
          ROMPTR  0B4 097                        * A8FAE
          #       BE26                           * A8FB9  48678
          BINT98                                 * A8FC3
          BINT28                                 * A8FC8
          ROMPTR  0B4 098                        * A8FCD
          ROMPTR  0B4 099                        * A8FD8
          ROMPTR  0B4 09A                        * A8FE3
          ROMPTR  0B4 09B                        * A8FEE
          ROMPTR  0B4 09C                        * A8FF9
          ROMPTR  0B4 09D                        * A9004
          OBJ_38345                              * A900F
          ROMPTR  0B4 0B0                        * A9014
          BINT25                                 * A901F
          BINT17                                 * A9024
          BINT13                                 * A9029
          BINT9                                  * A902E
          BINT1                                  * A9033
          {                                      * A9038
            BINT6                                * A903D
          }                                      * A9042
          BINT4                                  * A9047
          #       BE37                           * A904C  48695
          MINUSONE                               * A9056
          MINUSONE                               * A905B
          '                                      * A9060
          ID      Y                              * A9065
          MINUSONE                               * A906E
          OBJ_38345                              * A9073
          ROMPTR  0B4 0C0                        * A9078
          BINT55                                 * A9083
          BINT17                                 * A9088
          BINT31                                 * A908D
          BINT9                                  * A9092
          BINT1                                  * A9097
          {                                      * A909C
            BINT0                                * A90A1
          }                                      * A90A6
          OBJ_38345                              * A90AB
          ROMPTR  0B4 0E0                        * A90B0
          #       BE38                           * A90BB  48696
          MINUSONE                               * A90C5
          MINUSONE                               * A90CA
          BINT0                                  * A90CF
          MINUSONE                               * A90D4
          OBJ_38345                              * A90D9
          ROMPTR  0B4 0C3                        * A90DE
          BINT100                                * A90E9
          BINT17                                 * A90EE
          BINT31                                 * A90F3
          BINT9                                  * A90F8
          BINT1                                  * A90FD
          {                                      * A9102
            BINT0                                * A9107
          }                                      * A910C
          OBJ_38345                              * A9111
          ROMPTR  0B4 0E0                        * A9116
          #       BE39                           * A9121  48697
          MINUSONE                               * A912B
          MINUSONE                               * A9130
          BINT0                                  * A9135
          MINUSONE                               * A913A
          ROMPTR  0B4 0A1                        * A913F
          ROMPTR  0B4 0A2                        * A914A
          OBJ_38345                              * A9155
          ROMPTR  0B4 0B0                        * A915A
          BINT91                                 * A9165
          BINT26                                 * A916A
          BINT6                                  * A916F
          BINT9                                  * A9174
          BINT32                                 * A9179
          MINUSONE                               * A917E
          MINUSONE                               * A9183
          #       BE2E                           * A9188  48686
          MINUSONE                               * A9192
          MINUSONE                               * A9197
          TRUE                                   * A919C
          MINUSONE                               * A91A1
          ROMPTR  0B4 0A3                        * A91A6
          ROMPTR  0B4 0A4                        * A91B1
          ROMPTR  0B4 0A5                        * A91BC
          BINT12                                 * A91C7
          DUP                                    * A91CC
          'DROPFALSE                             * A91D1
          #       BE23                           * A91D6  48675

* ROMPTR 0B4 0BE
* refs (1): A2437
ROMP_0B4_0BE:
          ::                                     * A91E0
            CHECKPVARS                           * A91E5
            INCOMPDROP                           * A91EA
            SWAPDROP                             * A91EF
            5ROLLDROP                            * A91F4
            5ROLLDROP                            * A91F9
            4ROLL                                * A91FE
            DUP                                  * A9203
            1get(li)?                            * A9208
            4UNROLL                              * A920D
            ROMPTR  0B5 030                      * A9212
            2SWAP                                * A921D
            DUP                                  * A9222
            1get(li)?                            * A9227
            3UNROLL                              * A922C
            ROMPTR  0B5 03A                      * A9231
            8ROLL                                * A923C
            ROMPTR  0B5 03E                      * A9241
            5ROLL                                * A924C
            ROMPTR  0B5 06A                      * A9251
            ROMPTR  0B5 070                      * A925C
            4UNROLL                              * A9267
          ;                                      * A926C
          BINT12                                 * A9271
          ROMPTR  0B0 0AA                        * A9276
        ;                                        * A9281

* ROMPTR 0B4 0BF
* refs (1): A2437
ROMP_0B4_0BF:
        ::                                       * A9286
          ROMPTR  0B5 06B                        * A928B
          ROMPTR  0B5 071                        * A9296
          ROMPTR  0B5 03F                        * A92A1
          ROMPTR  0B5 03B                        * A92AC
          ROMPTR  0B5 039                        * A92B7
          ROMPTR  0B5 033                        * A92C2
          ROMPTR  0B5 02F                        * A92CD
        ;                                        * A92D8

* ROMPTR 0B4 0C0
* refs (1): A2437
ROMP_0B4_0C0:
        ::                                       * A92DD
          {                                      * A92E2
            BINT41                               * A92E7
            ROMPTR  0B4 0C1                      * A92EC
            BINT47                               * A92F7
            ROMPTR  0B4 0C2                      * A92FC
          }                                      * A9307
          EQLookup                               * A930C
          case                                   * A9311
          ::                                     * A9316
            EVAL                                 * A931B
            TRUE                                 * A9320
          ;                                      * A9325
          ROMPTR  0B4 0B0                        * A932A
        ;                                        * A9335

* ROMPTR 0B4 0C1
* refs (1): A2437
ROMP_0B4_0C1:
        ::                                       * A933A
          4GETLAM                                * A933F
          ROMPTR  0B0 0C5                        * A9344  ~gFldVal
          DUPTYPEBINT?                           * A934F
          NOTcase                                * A9354
          TRUE                                   * A9359
          DROP                                   * A935E
          ROMPTR  0B5 03C                        * A9363
          DROP                                   * A936E
          TRUE                                   * A9373
        ;                                        * A9378

* ROMPTR 0B4 0C2
* refs (1): A2437
ROMP_0B4_0C2:
        ::                                       * A937D
          4GETLAM                                * A9382
          DUP                                    * A9387
          ROMPTR  0B0 0C5                        * A938C  ~gFldVal
          TYPEBINT?                              * A9397
          case                                   * A939C
          ::                                     * A93A1
            #1+                                  * A93A6
            BINT0                                * A93AB
            OVER                                 * A93B0
            ROMPTR  0B0 0D5                      * A93B5  ~sFldVal
            ROMPTR  0B0 0A2                      * A93C0
          ;                                      * A93CB
          #1+                                    * A93D0
          DUP                                    * A93D5
          ROMPTR  0B0 0C5                        * A93DA  ~gFldVal
          TYPEBINT?                              * A93E5
          NOTcaseDROP                            * A93EA
          ROMPTR  0B5 03C                        * A93EF
          SWAPDROP                               * A93FA
          OVER                                   * A93FF
          ROMPTR  0B0 0D5                        * A9404  ~sFldVal
          ROMPTR  0B0 0A2                        * A940F
        ;                                        * A941A

* ROMPTR 0B4 0C3
* refs (1): A2437
ROMP_0B4_0C3:
        ::                                       * A941F
          {                                      * A9424
            BINT41                               * A9429
            ROMPTR  0B4 0C4                      * A942E
            BINT47                               * A9439
            ROMPTR  0B4 0C5                      * A943E
          }                                      * A9449
          EQLookup                               * A944E
          case                                   * A9453
          ::                                     * A9458
            EVAL                                 * A945D
            TRUE                                 * A9462
          ;                                      * A9467
          ROMPTR  0B4 0B0                        * A946C
        ;                                        * A9477

* ROMPTR 0B4 0C4
* refs (1): A2437
ROMP_0B4_0C4:
        ::                                       * A947C
          4GETLAM                                * A9481
          ROMPTR  0B0 0C5                        * A9486  ~gFldVal
          DUPTYPEBINT?                           * A9491
          NOTcase                                * A9496
          TRUE                                   * A949B
          DROP                                   * A94A0
          ROMPTR  0B5 03C                        * A94A5
          SWAPDROP                               * A94B0
          TRUE                                   * A94B5
        ;                                        * A94BA

* ROMPTR 0B4 0C5
* refs (1): A2437
ROMP_0B4_0C5:
        ::                                       * A94BF
          4GETLAM                                * A94C4
          DUP                                    * A94C9
          ROMPTR  0B0 0C5                        * A94CE  ~gFldVal
          TYPEBINT?                              * A94D9
          case                                   * A94DE
          ::                                     * A94E3
            #1-                                  * A94E8
            BINT0                                * A94ED
            OVER                                 * A94F2
            ROMPTR  0B0 0D5                      * A94F7  ~sFldVal
            ROMPTR  0B0 0A2                      * A9502
          ;                                      * A950D
          #1-                                    * A9512
          DUP                                    * A9517
          ROMPTR  0B0 0C5                        * A951C  ~gFldVal
          TYPEBINT?                              * A9527
          NOTcaseDROP                            * A952C
          ROMPTR  0B5 03C                        * A9531
          DROP                                   * A953C
          OVER                                   * A9541
          ROMPTR  0B0 0D5                        * A9546  ~sFldVal
          ROMPTR  0B0 0A2                        * A9551
        ;                                        * A955C

* ROMPTR 0B4 0C6
* refs (1): A2437
ROMP_0B4_0C6:
        ::                                       * A9561
          #       BF16                           * A9566  48918
          BINT1                                  * A9570
          BINT10                                 * A9575
          #       BF17                           * A957A  48919
          BINT49                                 * A9584
          BINT10                                 * A9589
          #       BE26                           * A958E  48678
          BINT113                                * A9598
          BINT10                                 * A959D
          #       BE3A                           * A95A2  48698
          BINT1                                  * A95AC
          BINT19                                 * A95B1
          #       BE04                           * A95B6  48644
          BINT49                                 * A95C0
          BINT19                                 * A95C5
          #       BE3B                           * A95CA  48699
          BINT1                                  * A95D4
          BINT28                                 * A95D9
          #       BE06                           * A95DE  48646
          BINT49                                 * A95E8
          BINT28                                 * A95ED
          ROMPTR  0B4 098                        * A95F2
          ROMPTR  0B4 099                        * A95FD
          ROMPTR  0B4 09A                        * A9608
          OBJ_38345                              * A9613
          ROMPTR  0B4 0B0                        * A9618
          BINT16                                 * A9623
          BINT8                                  * A9628
          BINT31                                 * A962D
          BINT9                                  * A9632
          BINT1                                  * A9637
          {                                      * A963C
            BINT0                                * A9641
          }                                      * A9646
          BINT4                                  * A964B
          #       BF22                           * A9650  48930
          MINUSONE                               * A965A
          MINUSONE                               * A965F
          %       1E-4                           * A9664
          MINUSONE                               * A9679
          OBJ_38345                              * A967E
          ROMPTR  0B4 0C9                        * A9683
          BINT70                                 * A968E
          BINT8                                  * A9693
          BINT25                                 * A9698
          BINT9                                  * A969D
          BINT1                                  * A96A2
          {                                      * A96A7
            BINT0                                * A96AC
          }                                      * A96B1
          OBJ_38345                              * A96B6
          ROMPTR  0B4 0E0                        * A96BB
          #       BE3C                           * A96C6  48700
          MINUSONE                               * A96D0
          MINUSONE                               * A96D5
          BINT0                                  * A96DA
          MINUSONE                               * A96DF
          OBJ_38345                              * A96E4
          ROMPTR  0B4 0B0                        * A96E9
          #       6A                             * A96F4  106
          BINT8                                  * A96FE
          BINT6                                  * A9703
          BINT9                                  * A9708
          BINT32                                 * A970D
          MINUSONE                               * A9712
          MINUSONE                               * A9717
          #       BE2E                           * A971C  48686
          MINUSONE                               * A9726
          MINUSONE                               * A972B
          TRUE                                   * A9730
          MINUSONE                               * A9735
          OBJ_38345                              * A973A
          ROMPTR  0B4 0CB                        * A973F
          BINT28                                 * A974A
          BINT17                                 * A974F
          BINT13                                 * A9754
          BINT9                                  * A9759
          BINT12                                 * A975E
          MINUSONE                               * A9763
          BINT4                                  * A9768
          #       BE3D                           * A976D  48701
          MINUSONE                               * A9777
          OBJ_38345                              * A977C
          ROMPTR  0B4 0CD                        * A9781
          %0_2A2B4                               * A978C
          MINUSONE                               * A9791
          OBJ_38345                              * A9796
          ROMPTR  0B4 0B0                        * A979B
          #       4C                             * A97A6  76
          BINT17                                 * A97B0
          BINT25                                 * A97B5
          BINT9                                  * A97BA
          BINT1                                  * A97BF
          {                                      * A97C4
            BINT0                                * A97C9
          }                                      * A97CE
          BINT4                                  * A97D3
          #       BE0A                           * A97D8  48650
          MINUSONE                               * A97E2
          MINUSONE                               * A97E7
          %       -6.5E0                         * A97EC
          MINUSONE                               * A9801
          OBJ_38345                              * A9806
          ROMPTR  0B4 0B0                        * A980B
          #       6A                             * A9816  106
          BINT17                                 * A9820
          BINT25                                 * A9825
          BINT9                                  * A982A
          BINT1                                  * A982F
          {                                      * A9834
            BINT0                                * A9839
          }                                      * A983E
          BINT4                                  * A9843
          #       BE0B                           * A9848  48651
          MINUSONE                               * A9852
          MINUSONE                               * A9857
          %       6.5E0                          * A985C
          MINUSONE                               * A9871
          OBJ_38345                              * A9876
          ROMPTR  0B4 0CB                        * A987B
          BINT28                                 * A9886
          BINT26                                 * A988B
          BINT13                                 * A9890
          BINT9                                  * A9895
          BINT12                                 * A989A
          MINUSONE                               * A989F
          BINT4                                  * A98A4
          #       BE3E                           * A98A9  48702
          MINUSONE                               * A98B3
          OBJ_38345                              * A98B8
          ROMPTR  0B4 0CD                        * A98BD
          %1                                     * A98C8
          MINUSONE                               * A98CD
          OBJ_38345                              * A98D2
          ROMPTR  0B4 0B0                        * A98D7
          #       4C                             * A98E2  76
          BINT26                                 * A98EC
          BINT25                                 * A98F1
          BINT9                                  * A98F6
          BINT1                                  * A98FB
          {                                      * A9900
            BINT0                                * A9905
          }                                      * A990A
          BINT4                                  * A990F
          #       BE0D                           * A9914  48653
          MINUSONE                               * A991E
          MINUSONE                               * A9923
          %       -3.1E0                         * A9928
          MINUSONE                               * A993D
          OBJ_38345                              * A9942
          ROMPTR  0B4 0B0                        * A9947
          #       6A                             * A9952  106
          BINT26                                 * A995C
          BINT25                                 * A9961
          BINT9                                  * A9966
          BINT1                                  * A996B
          {                                      * A9970
            BINT0                                * A9975
          }                                      * A997A
          BINT4                                  * A997F
          #       BE0E                           * A9984  48654
          MINUSONE                               * A998E
          MINUSONE                               * A9993
          %       3.2E0                          * A9998
          MINUSONE                               * A99AD
          ROMPTR  0B4 0A3                        * A99B2
          ROMPTR  0B4 0A4                        * A99BD
          ROMPTR  0B4 0A5                        * A99C8
          BINT10                                 * A99D3
          BINT12                                 * A99D8
          'DROPFALSE                             * A99DD
          #       BE23                           * A99E2  48675

* ROMPTR 0B4 0C7
* refs (1): A2437
ROMP_0B4_0C7:
          ::                                     * A99EC
            ROMPTR  0B5 072                      * A99F1
            CHECKPVARS                           * A99FC
            INCOMPDROP                           * A9A01
            ROMPTR  0B5 068                      * A9A06
            9rolld                               * A9A11
            DROPSWAP                             * A9A16
            ROTDROP                              * A9A1B
            ROMPTR  0B5 03E                      * A9A20
            DROP                                 * A9A2B
            6UNROLL                              * A9A30
            ROMPTR  0B5 070                      * A9A35
            6UNROLL                              * A9A40
            ROT                                  * A9A45
            C%>%                                 * A9A4A
            4ROLL                                * A9A4F
            C%>%                                 * A9A54
            ROTSWAP                              * A9A59
            6ROLL                                * A9A5E
            3UNROLL                              * A9A63
            6ROLL                                * A9A68
            ROMPTR  0B5 06A                      * A9A6D
          ;                                      * A9A78
          BINT12                                 * A9A7D
          ROMPTR  0B0 0AA                        * A9A82
        ;                                        * A9A8D

* ROMPTR 0B4 0C8
* refs (1): A2437
ROMP_0B4_0C8:
        ::                                       * A9A92
          ROMPTR  0B5 06B                        * A9A97
          yrng(2r)                               * A9AA2
          4ROLL                                  * A9AA7
          SWAP                                   * A9AAC
          ROMPTR  0B5 074                        * A9AB1
          xrng(2r)                               * A9ABC
          ROMPTR  0B5 071                        * A9AC1
          ROMPTR  0B5 045                        * A9ACC
          ROMPTR  0B5 069                        * A9AD7
        ;                                        * A9AE2

* ROMPTR 0B4 0C9
* refs (1): A2437
ROMP_0B4_0C9:
        ::                                       * A9AE7
          BINT41                                 * A9AEC
          OVER                                   * A9AF1
          #<>case                                * A9AF6
          ROMPTR  0B4 0B0                        * A9AFB
          DROP                                   * A9B06
          ROMPTR  0B4 0CA                        * A9B0B
          TRUE                                   * A9B16
        ;                                        * A9B1B

* ROMPTR 0B4 0CA
* refs (1): A2437
ROMP_0B4_0CA:
        ::                                       * A9B20
          4GETLAM                                * A9B25
          ROMPTR  0B0 0C5                        * A9B2A  ~gFldVal
          DUPTYPEBINT?                           * A9B35
          NOTcase                                * A9B3A
          TRUE                                   * A9B3F
          OBJ_56B87                              * A9B44
          TRUE                                   * A9B49
        ;                                        * A9B4E

* ROMPTR 0B4 0CB
* refs (1): A2437
ROMP_0B4_0CB:
        ::                                       * A9B53
          BINT40                                 * A9B58
          OVER                                   * A9B5D
          #<>case                                * A9B62
          ROMPTR  0B4 0B0                        * A9B67
          DROP                                   * A9B72
          ROMPTR  0B4 0CC                        * A9B77
          TRUE                                   * A9B82
        ;                                        * A9B87

* ROMPTR 0B4 0CC
* refs (1): A2437
ROMP_0B4_0CC:
        ::                                       * A9B8C
          RclDepnd                               * A9B91
          ROMPTR  0B5 064                        * A9B96
          DUPTYPEREAL?                           * A9BA1
          ITE                                    * A9BA6
          ::                                     * A9BAB
            DROP                                 * A9BB0
            {                                    * A9BB5
              %0_2A2B4                           * A9BBA
              %1                                 * A9BBF
            }                                    * A9BC4
          ;                                      * A9BC9
          ::                                     * A9BCE
            MDIMS                                * A9BD3
            IT                                   * A9BD8
            DROP                                 * A9BDD
            DUP                                  * A9BE2
            1LAMBIND                             * A9BE7
            #1+                                  * A9BEC
            ZERO_DO                              * A9BF1
            INDEX@                               * A9BF6
            UNCOERCE                             * A9BFB
            LOOP                                 * A9C00
            1GETABND                             * A9C05
            #1+                                  * A9C0A
            {}N                                  * A9C0F
          ;                                      * A9C14
          4GETLAM                                * A9C19
          ROMPTR  0B0 0C5                        * A9C1E  ~gFldVal
          COERCE                                 * A9C29
          #1+                                    * A9C2E
        ;                                        * A9C33

* ROMPTR 0B4 0CD
* refs (1): A2437
ROMP_0B4_0CD:
        ::                                       * A9C38
          DUP%0=                                 * A9C3D
          casedrop                               * A9C42
          ::                                     * A9C47
            #       BE3F                         * A9C4C  48703
            JstGetTHEMESG                        * A9C56
          ;                                      * A9C5B
          RclDepnd                               * A9C60
          ROMPTR  0B5 064                        * A9C65
          TYPEREAL?                              * A9C70
          casedrop                               * A9C75
          ::                                     * A9C7A
            #       BE40                         * A9C7F  48704
            JstGetTHEMESG                        * A9C89
          ;                                      * A9C8E
          BINT4                                  * A9C93
          ROMPTR  0B0 074                        * A9C98
          DUP                                    * A9CA3
          #       BE41                           * A9CA8  48705
          JstGetTHEMESG                          * A9CB2
          &$                                     * A9CB7
          SWAP&$                                 * A9CBC
          CHR_RightPar                           * A9CC1
          >T$                                    * A9CC6
        ;                                        * A9CCB

* ROMPTR 0B4 0CE
* refs (1): A2437
ROMP_0B4_0CE:
        ::                                       * A9CD0
          ROMPTR  0B4 093                        * A9CD5
          #       BE2A                           * A9CE0  48682
          BINT1                                  * A9CEA
          BINT28                                 * A9CEF
          #       BE2B                           * A9CF4  48683
          BINT49                                 * A9CFE
          BINT28                                 * A9D03
          #       BE29                           * A9D08  48681
          #       6B                             * A9D12  107
          BINT28                                 * A9D1C
          ROMPTR  0B4 09E                        * A9D21
          OBJ_38345                              * A9D2C
          ROMPTR  0B4 0B0                        * A9D31
          BINT28                                 * A9D3C
          BINT26                                 * A9D41
          BINT13                                 * A9D46
          BINT9                                  * A9D4B
          BINT1                                  * A9D50
          {                                      * A9D55
            BINT0                                * A9D5A
          }                                      * A9D5F
          BINT4                                  * A9D64
          #       BE33                           * A9D69  48691
          MINUSONE                               * A9D73
          MINUSONE                               * A9D78
          %10                                    * A9D7D
          MINUSONE                               * A9D82
          OBJ_38345                              * A9D87
          ROMPTR  0B4 0B0                        * A9D8C
          #       4C                             * A9D97  76
          BINT26                                 * A9DA1
          BINT13                                 * A9DA6
          BINT9                                  * A9DAB
          BINT1                                  * A9DB0
          {                                      * A9DB5
            BINT0                                * A9DBA
          }                                      * A9DBF
          BINT4                                  * A9DC4
          #       BE34                           * A9DC9  48692
          MINUSONE                               * A9DD3
          MINUSONE                               * A9DD8
          %10                                    * A9DDD
          MINUSONE                               * A9DE2
          OBJ_38345                              * A9DE7
          ROMPTR  0B4 0B0                        * A9DEC
          BINT100                                * A9DF7
          BINT26                                 * A9DFC
          BINT6                                  * A9E01
          BINT9                                  * A9E06
          BINT32                                 * A9E0B
          MINUSONE                               * A9E10
          MINUSONE                               * A9E15
          #       BE35                           * A9E1A  48693
          MINUSONE                               * A9E24
          MINUSONE                               * A9E29
          TRUE                                   * A9E2E
          MINUSONE                               * A9E33
          BINT4                                  * A9E38
          DUP                                    * A9E3D
          'DROPFALSE                             * A9E42
          #       BE23                           * A9E47  48675

* ROMPTR 0B4 0CF
* refs (1): A2437
ROMP_0B4_0CF:
          ::                                     * A9E51
            ROMPTR  0B5 070                      * A9E56
            RclAx*s                              * A9E61
            ROMPTR  0B5 06A                      * A9E66
          ;                                      * A9E71
          BINT4                                  * A9E76
          ROMPTR  0B0 0AA                        * A9E7B
        ;                                        * A9E86

* ROMPTR 0B4 0D0
* refs (1): A2437
ROMP_0B4_0D0:
        ::                                       * A9E8B
          ROMPTR  0B5 06B                        * A9E90
          ROMPTR  0B5 071                        * A9E9B
        ;                                        * A9EA6

* ROMPTR 0B4 0D1
* refs (1): A2437
ROMP_0B4_0D1:
        ::                                       * A9EAB
          #       BE60                           * A9EB0  48736
          BINT1                                  * A9EBA
          BINT10                                 * A9EBF
          #       BE61                           * A9EC4  48737
          BINT1                                  * A9ECE
          BINT19                                 * A9ED3
          #       BE62                           * A9ED8  48738
          BINT8                                  * A9EE2
          BINT28                                 * A9EE7
          'DROPFALSE                             * A9EEC
          BINT37                                 * A9EF1
          BINT8                                  * A9EF6
          BINT25                                 * A9EFB
          BINT9                                  * A9F00
          BINT1                                  * A9F05
          {                                      * A9F0A
            BINT0                                * A9F0F
          }                                      * A9F14
          BINT4                                  * A9F19
          #       BE63                           * A9F1E  48739
          MINUSONE                               * A9F28
          MINUSONE                               * A9F2D
          %4                                     * A9F32
          MINUSONE                               * A9F37
          'DROPFALSE                             * A9F3C
          BINT37                                 * A9F41
          BINT17                                 * A9F46
          BINT25                                 * A9F4B
          BINT9                                  * A9F50
          BINT1                                  * A9F55
          {                                      * A9F5A
            BINT0                                * A9F5F
          }                                      * A9F64
          BINT4                                  * A9F69
          #       BE64                           * A9F6E  48740
          MINUSONE                               * A9F78
          MINUSONE                               * A9F7D
          %4                                     * A9F82
          MINUSONE                               * A9F87
          'DROPFALSE                             * A9F8C
          BINT1                                  * A9F91
          BINT26                                 * A9F96
          BINT6                                  * A9F9B
          BINT9                                  * A9FA0
          BINT32                                 * A9FA5
          MINUSONE                               * A9FAA
          MINUSONE                               * A9FAF
          #       BE65                           * A9FB4  48741
          MINUSONE                               * A9FBE
          MINUSONE                               * A9FC3
          TRUE                                   * A9FC8
          MINUSONE                               * A9FCD
          BINT3                                  * A9FD2
          DUP                                    * A9FD7
          'DROPFALSE                             * A9FDC
          #       BE5F                           * A9FE1  48735
          ROMPTR  0B5 075                        * A9FEB
          BINT3                                  * A9FF6
          ROMPTR  0B0 0AA                        * A9FFB
          DoInputForm                            * AA006
          NOT?SEMI                               * AA00B
          ROMPTR  0B5 076                        * AA010
        ;                                        * AA01B

* ROMPTR 0B4 0D2
* refs (1): A2437
ROMP_0B4_0D2:
        ::                                       * AA020
          4GETLAM                                * AA025
          ROMPTR  0B0 030                        * AA02A
          NOT?SEMI                               * AA035
          OBJ_72AFA                              * AA03A
          DUP                                    * AA03F
          4GETLAM                                * AA044
          ROMPTR  0B0 0C5                        * AA049  ~gFldVal
          OBJ_72AFA                              * AA054
          EQUAL                                  * AA059
          caseDROP                               * AA05E
          ROMPTR  0B0 0C8                        * AA063  GetFieldVals
          14GETLAM                               * AA06E
          ROMPTR  0B4 048                        * AA073
          2DROP                                  * AA07E
          DUP                                    * AA083
          ROMPTR  0B0 09C                        * AA088
          BINT1                                  * AA093
          ROMPTR  0B0 0D5                        * AA098  ~sFldVal
          BINT1                                  * AA0A3
          ROMPTR  0B0 013                        * AA0A8  IFEDispField
          BINT0                                  * AA0B3
          '                                      * AA0B8
          LAM     'PX                            * AA0BD
          STOLAM                                 * AA0CA
          TRUE                                   * AA0CF
          11PUTLAM                               * AA0D4
        ;                                        * AA0D9

* ROMPTR 0B4 0D3
* refs (1): A2437
ROMP_0B4_0D3:
        ::                                       * AA0DE
          4GETLAM                                * AA0E3
          ROMPTR  0B0 02B                        * AA0E8
          OVER                                   * AA0F3
          NULL{}                                 * AA0F8
          EQUAL                                  * AA0FD
          case2DROP                              * AA102
          #1+                                    * AA107
          2DUP                                   * AA10C
          SWAP                                   * AA111
          LENCOMP                                * AA116
          #>                                     * AA11B
          IT                                     * AA120
          DROPONE                                * AA125
          NTHCOMPDROP                            * AA12A
          ROMPTR  0B0 0C8                        * AA12F  GetFieldVals
          14GETLAM                               * AA13A
          ROMPTR  0B4 048                        * AA13F
          2DROP                                  * AA14A
          DUP                                    * AA14F
          ROMPTR  0B0 09C                        * AA154
          BINT1                                  * AA15F
          ROMPTR  0B0 0D5                        * AA164  ~sFldVal
          BINT1                                  * AA16F
          ROMPTR  0B0 013                        * AA174  IFEDispField
          BINT0                                  * AA17F
          '                                      * AA184
          LAM     'PX                            * AA189
          STOLAM                                 * AA196
          TRUE                                   * AA19B
          11PUTLAM                               * AA1A0
        ;                                        * AA1A5

* ROMPTR 0B4 0D4
* refs (1): A2437
ROMP_0B4_0D4:
        ::                                       * AA1AA
          4GETLAM                                * AA1AF
          ROMPTR  0B0 02B                        * AA1B4
          OVER                                   * AA1BF
          LENCOMP                                * AA1C4
          '                                      * AA1C9
          ::                                     * AA1CE
            SWAP                                 * AA1D3
            OBJ_1A01B                            * AA1D8
          ;                                      * AA1DD
          4ROLL                                  * AA1E2
          >HCOMP                                 * AA1E7
          DUP                                    * AA1EC
          4UNROLL                                * AA1F1
          SWAP                                   * AA1F6
          ROT                                    * AA1FB
          #1+                                    * AA200
          4GETLAM                                * AA205
          ROMPTR  0B0 0C0                        * AA20A
          SWAP                                   * AA215
          6ROLL                                  * AA21A
          ROMPTR  0B0 09E                        * AA21F
          NOTcasedrop                            * AA22A
          DoBadKey                               * AA22F
          SWAP                                   * AA234
          EVAL                                   * AA239
          ROMPTR  0B0 0C8                        * AA23E  GetFieldVals
          14GETLAM                               * AA249
          ROMPTR  0B4 048                        * AA24E
          2DROP                                  * AA259
          DUP                                    * AA25E
          ROMPTR  0B0 09C                        * AA263
          BINT1                                  * AA26E
          ROMPTR  0B0 0D5                        * AA273  ~sFldVal
          BINT1                                  * AA27E
          ROMPTR  0B0 013                        * AA283  IFEDispField
          BINT0                                  * AA28E
          '                                      * AA293
          LAM     'PX                            * AA298
          STOLAM                                 * AA2A5
          TRUE                                   * AA2AA
          11PUTLAM                               * AA2AF
        ;                                        * AA2B4

* ROMPTR 0B4 0D5
* refs (1): A2437
ROMP_0B4_0D5:
        ::                                       * AA2B9
          ROMPTR  0B0 0C8                        * AA2BE  GetFieldVals
          14GETLAM                               * AA2C9
          ROMPTR  0B4 048                        * AA2CE
          2DROP                                  * AA2D9
          BINT1                                  * AA2DE
          ROMPTR  0B0 0C4                        * AA2E3
          DUP                                    * AA2EE
          ROMPTR  0B0 09C                        * AA2F3
          BINT1                                  * AA2FE
          ROMPTR  0B0 0D5                        * AA303  ~sFldVal
          BINT1                                  * AA30E
          ROMPTR  0B0 013                        * AA313  IFEDispField
          BINT0                                  * AA31E
          '                                      * AA323
          LAM     'PX                            * AA328
          STOLAM                                 * AA335
          TRUE                                   * AA33A
          11PUTLAM                               * AA33F
        ;                                        * AA344

* ROMPTR 0B4 0D6
* refs (1): A2437
ROMP_0B4_0D6:
        ::                                       * AA349
          4GETLAM                                * AA34E
          #1+                                    * AA353
          DUP                                    * AA358
          ROMPTR  0B0 0A2                        * AA35D
          #1+                                    * AA368
          ROMPTR  0B0 0A2                        * AA36D
        ;                                        * AA378

* ROMPTR 0B4 0D7
* refs (1): A2437
ROMP_0B4_0D7:
        ::                                       * AA37D
          EditExstCase                           * AA382
          FALSE                                  * AA387
          2DUP                                   * AA38C
          Key>U/SKeyOb                           * AA391
          {                                      * AA396
            ROMP_0A2_006                         * AA39B
            ROMPTR  0B4 1FA                      * AA3A0
            ROMPTR  002 0C8                      * AA3AB  PICTURE
            ROMPTR  0B4 0D8                      * AA3B6
            ROMPTR  0B4 000                      * AA3C1
            ROMPTR  0B4 0D9                      * AA3CC
          }                                      * AA3D7
          '                                      * AA3DC
          EQUAL                                  * AA3E1
          SWAP                                   * AA3E6
          Lookup                                 * AA3EB
          NOTcase                                * AA3F0
          DROPFALSE                              * AA3F5
          ROTROT2DROP                            * AA3FA
          TrueTrue                               * AA3FF
        ;                                        * AA404

* ROMPTR 0B4 0D8
* refs (1): A2437
ROMP_0B4_0D8:
        ::                                       * AA409
          TakeOver                               * AA40E
          ROMPTR  0B0 0C8                        * AA413  GetFieldVals
          14GETLAM                               * AA41E
          ROMPTR  0B4 048                        * AA423
          2DROP                                  * AA42E
          GETPTYPE                               * AA433
          1LAMBIND                               * AA438
          OBJ_4DA3F                              * AA43D
          1GETABND                               * AA442
          PUTPTYPE                               * AA447
          MINUSONE                               * AA44C
          '                                      * AA451
          LAM     'PX                            * AA456
          STOLAM                                 * AA463
          ROMPTR  0B0 020                        * AA468
          ROMPTR  0B0 06B                        * AA473
          ROMPTR  0B4 047                        * AA47E
          ROMPTR  0B0 0D8                        * AA489
        ;                                        * AA494

* ROMPTR 0B4 0D9
* refs (1): A2437
ROMP_0B4_0D9:
        ::                                       * AA499
          TakeOver                               * AA49E
          {                                      * AA4A3
            {                                    * AA4A8
              #       BF01                       * AA4AD  48897
              ROMPTR  0B4 0DA                    * AA4B7
            }                                    * AA4C2
            {                                    * AA4C7
              #       BF02                       * AA4CC  48898
              ROMPTR  0B4 0DB                    * AA4D6
            }                                    * AA4E1
          }                                      * AA4E6
          ROMPTR  0B0 0A9                        * AA4EB
        ;                                        * AA4F6

* ROMPTR 0B4 0DA
* refs (1): A2437
ROMP_0B4_0DA:
        ::                                       * AA4FB
          '                                      * AA500
          ROMPTR  0B4 001                        * AA505
          '                                      * AA510
          LAM     'PE2                           * AA515
          STOLAM                                 * AA524
          ROMPTR  0B0 0C8                        * AA529  GetFieldVals
          14GETLAM                               * AA534
          ROMPTR  0B4 048                        * AA539
          2DROP                                  * AA544
          TRUE                                   * AA549
          11PUTLAM                               * AA54E
          FALSE                                  * AA553
        ;                                        * AA558

* ROMPTR 0B4 0DB
* refs (1): A2437
ROMP_0B4_0DB:
        ::                                       * AA55D
          '                                      * AA562
          ROMPTR  0B4 017                        * AA567
          '                                      * AA572
          LAM     'PE2                           * AA577
          STOLAM                                 * AA586
          ROMPTR  0B0 0C8                        * AA58B  GetFieldVals
          14GETLAM                               * AA596
          ROMPTR  0B4 048                        * AA59B
          2DROP                                  * AA5A6
          TRUE                                   * AA5AB
          11PUTLAM                               * AA5B0
          FALSE                                  * AA5B5
        ;                                        * AA5BA

* ROMPTR 0B4 0DC
* refs (1): A2437
ROMP_0B4_0DC:
        ::                                       * AA5BF
          4GETLAM                                * AA5C4
          ROMPTR  0B0 07D                        * AA5C9
          ITE                                    * AA5D4
          ::                                     * AA5D9
            DROP                                 * AA5DE
            {                                    * AA5E3
              #       B903                       * AA5E8  47363
              ROMPTR  0B0 01C                    * AA5F2
            }                                    * AA5FD
          ;                                      * AA602
          {                                      * AA607
            #       B904                         * AA60C  47364
            ROMPTR  0B0 01C                      * AA616
          }                                      * AA621
          {                                      * AA626
            #       BE66                         * AA62B  48742
            ROMPTR  0B4 0DD                      * AA635
          }                                      * AA640
          BINT2                                  * AA645
          {}N                                    * AA64A
        ;                                        * AA64F

* ROMPTR 0B4 0DD
* refs (1): A2437
ROMP_0B4_0DD:
        ::                                       * AA654
          ROMPTR  0B0 0C8                        * AA659  GetFieldVals
          14GETLAM                               * AA664
          ROMPTR  0B4 048                        * AA669
          2DROP                                  * AA674
          ROMPTR  0B5 077                        * AA679
          ROMPTR  0B4 047                        * AA684
          ROMPTR  0B0 0D8                        * AA68F
          SetDA123NoCh                           * AA69A
          ROMPTR  0B0 0A4                        * AA69F
        ;                                        * AA6AA

* ROMPTR 0B4 0DE
* refs (1): A2437
ROMP_0B4_0DE:
        ::                                       * AA6AF
          4GETLAM                                * AA6B4
          ROMPTR  0B0 07D                        * AA6B9
          ITE                                    * AA6C4
          ::                                     * AA6C9
            DROP                                 * AA6CE
            {                                    * AA6D3
              #       B903                       * AA6D8  47363
              ROMPTR  0B0 01C                    * AA6E2
            }                                    * AA6ED
          ;                                      * AA6F2
          {                                      * AA6F7
            #       B904                         * AA6FC  47364
            ROMPTR  0B0 01C                      * AA706
          }                                      * AA711
          {                                      * AA716
            #       BE66                         * AA71B  48742
            ROMPTR  0B4 0DF                      * AA725
          }                                      * AA730
          BINT2                                  * AA735
          {}N                                    * AA73A
        ;                                        * AA73F

* ROMPTR 0B4 0DF
* refs (1): A2437
ROMP_0B4_0DF:
        ::                                       * AA744
          ROMPTR  0B0 0C8                        * AA749  GetFieldVals
          ROMPTR  0B4 062                        * AA754
          ROMPTR  0B5 077                        * AA75F
          ROMPTR  0B4 061                        * AA76A
          ROMPTR  0B0 0D8                        * AA775
          SetDA123NoCh                           * AA780
          ROMPTR  0B0 0A4                        * AA785
        ;                                        * AA790

* ROMPTR 0B4 0E0
* refs (1): A2437
ROMP_0B4_0E0:
        ::                                       * AA795
          DUPTYPEBINT?                           * AA79A
          casedrop                               * AA79F
          ::                                     * AA7A4
            #       BE67                         * AA7A9  48743
            JstGetTHEMESG                        * AA7B3
          ;                                      * AA7B8
          BINT4                                  * AA7BD
          ROMPTR  0B0 074                        * AA7C2
        ;                                        * AA7CD

* ROMPTR 0B4 0E1
* refs (1): A2437
ROMP_0B4_0E1:
        ::                                       * AA7D2
          4GETLAM                                * AA7D7
          #1-                                    * AA7DC
          ROMPTR  0B0 0C5                        * AA7E1  ~gFldVal
          casedrop                               * AA7EC
          ::                                     * AA7F1
            #       BE68                         * AA7F6  48744
            JstGetTHEMESG                        * AA800
          ;                                      * AA805
          BINT4                                  * AA80A
          ROMPTR  0B0 074                        * AA80F
        ;                                        * AA81A

* ROMPTR 0B4 0E2
* refs (1): A2437
ROMP_0B4_0E2:
        ::                                       * AA81F
          4GETLAM                                * AA824
          #2-                                    * AA829
          ROMPTR  0B0 0C5                        * AA82E  ~gFldVal
          casedrop                               * AA839
          NULL$                                  * AA83E
          BINT4                                  * AA843
          ROMPTR  0B0 074                        * AA848
        ;                                        * AA853

* ROMPTR 0B4 0E3
* refs (1): A2437
ROMP_0B4_0E3:
        ::                                       * AA858
          {                                      * AA85D
            NullMenuKey                          * AA862
            NullMenuKey                          * AA867
            NullMenuKey                          * AA86C
          }                                      * AA871
          SWAP                                   * AA876
          ROMPTR  0B0 0C5                        * AA87B  ~gFldVal
          >HCOMP                                 * AA886
        ;                                        * AA88B

* ROMPTR 0B4 0E4
* refs (1): A2437
ROMP_0B4_0E4:
        ::                                       * AA890
          {                                      * AA895
            NullMenuKey                          * AA89A
            NullMenuKey                          * AA89F
          }                                      * AA8A4
          LAM     'PE1                           * AA8A9
          >HCOMP                                 * AA8B8
          SWAP                                   * AA8BD
          ROMPTR  0B0 0C5                        * AA8C2  ~gFldVal
          >HCOMP                                 * AA8CD
        ;                                        * AA8D2

* ROMPTR 0B4 0E5
* refs (1): A2437
ROMP_0B4_0E5:
        ::                                       * AA8D7
          LAM     'PX                            * AA8DC
          DUP                                    * AA8E9
          MINUSONE                               * AA8EE
          #=                                     * AA8F3
          ITE                                    * AA8F8
          DROP                                   * AA8FD
          SWAPDROP                               * AA902
        ;                                        * AA907

* ROMPTR 0B4 0E6
* refs (1): A2437
ROMP_0B4_0E6:
        ::                                       * AA90C
          ROMPTR  0B4 04A                        * AA911
          ROMPTR  0B4 04B                        * AA91C
          ROMPTR  0B4 04C                        * AA927
          ROMPTR  0B4 04D                        * AA932
          #       BE20                           * AA93D  48672
          BINT67                                 * AA947
          BINT28                                 * AA94C
          #       BE36                           * AA951  48694
          BINT1                                  * AA95B
          BINT37                                 * AA960
          #       BE20                           * AA965  48672
          BINT67                                 * AA96F
          BINT37                                 * AA974
          ROMPTR  0B4 051                        * AA979
          ROMPTR  0B4 052                        * AA984
          OBJ_38345                              * AA98F
          ROMPTR  0B4 0EA                        * AA994
          BINT25                                 * AA99F
          BINT17                                 * AA9A4
          #       67                             * AA9A9  103
          BINT9                                  * AA9B3
          BINT23                                 * AA9B8
          {                                      * AA9BD
            BINT9                                * AA9C2
            BINT8                                * AA9C7
            BINT6                                * AA9CC
            BINT0                                * AA9D1
            BINT5                                * AA9D6
          }                                      * AA9DB
          BINT4                                  * AA9E0
          #       BE09                           * AA9E5  48649
          {                                      * AA9EF
            #       BF0A                         * AA9F4  48906
            TRUE                                 * AA9FE
          }                                      * AAA03
          MINUSONE                               * AAA08
          MINUSONE                               * AAA0D
          MINUSONE                               * AAA12
          OBJ_38345                              * AAA17
          ROMPTR  0B4 067                        * AAA1C
          BINT25                                 * AAA27
          BINT26                                 * AAA2C
          BINT37                                 * AAA31
          BINT9                                  * AAA36
          BINT1                                  * AAA3B
          {                                      * AAA40
            BINT6                                * AAA45
          }                                      * AAA4A
          BINT4                                  * AAA4F
          #       BF1C                           * AAA54  48924
          MINUSONE                               * AAA5E
          MINUSONE                               * AAA63
          '                                      * AAA68
          ID      X                              * AAA6D
          MINUSONE                               * AAA76
          OBJ_38345                              * AAA7B
          ROMPTR  0B4 067                        * AAA80
          BINT91                                 * AAA8B
          BINT26                                 * AAA90
          BINT37                                 * AAA95
          BINT9                                  * AAA9A
          BINT1                                  * AAA9F
          {                                      * AAAA4
            BINT0                                * AAAA9
          }                                      * AAAAE
          BINT4                                  * AAAB3
          #       BE21                           * AAAB8  48673
          MINUSONE                               * AAAC2
          MINUSONE                               * AAAC7
          %10                                    * AAACC
          MINUSONE                               * AAAD1
          OBJ_38345                              * AAAD6
          ROMPTR  0B4 067                        * AAADB
          BINT25                                 * AAAE6
          BINT35                                 * AAAEB
          BINT37                                 * AAAF0
          BINT9                                  * AAAF5
          BINT1                                  * AAAFA
          {                                      * AAAFF
            BINT6                                * AAB04
          }                                      * AAB09
          BINT4                                  * AAB0E
          #       BE37                           * AAB13  48695
          MINUSONE                               * AAB1D
          MINUSONE                               * AAB22
          '                                      * AAB27
          ID      Y                              * AAB2C
          MINUSONE                               * AAB35
          OBJ_38345                              * AAB3A
          ROMPTR  0B4 067                        * AAB3F
          BINT91                                 * AAB4A
          BINT35                                 * AAB4F
          BINT37                                 * AAB54
          BINT9                                  * AAB59
          BINT1                                  * AAB5E
          {                                      * AAB63
            BINT0                                * AAB68
          }                                      * AAB6D
          BINT4                                  * AAB72
          #       BE22                           * AAB77  48674
          MINUSONE                               * AAB81
          MINUSONE                               * AAB86
          %8                                     * AAB8B
          MINUSONE                               * AAB90
          BINT7                                  * AAB95
          DUP                                    * AAB9A
          OBJ_38345                              * AAB9F
          ROMPTR  0B4 0E9                        * AABA4
          #       BE01                           * AABAF  48641

* ROMPTR 0B4 0E7
* refs (1): A2437
ROMP_0B4_0E7:
          ::                                     * AABB9
            ROMPTR  0B5 13A                      * AABBE
            ROMPTR  0B5 028                      * AABC9
            CHECKPVARS                           * AABD4
            INCOMPDROP                           * AABD9
            OBJ_37B03                            * AABDE
            1get(li)?                            * AABE3
            5UNROLL                              * AABE8
            ROMPTR  0B5 04F                      * AABED
            7UNROLL                              * AABF8
            1get(li)?                            * AABFD
            4UNROLL                              * AAC02
            2DROP                                * AAC07
            ROMPTR  0B5 07C                      * AAC0C
            SWAP                                 * AAC17
            ROMPTR  0B5 07E                      * AAC1C
          ;                                      * AAC27
          BINT7                                  * AAC2C
          ROMPTR  0B0 0AA                        * AAC31
        ;                                        * AAC3C

* ROMPTR 0B4 0E8
* refs (1): A2437
ROMP_0B4_0E8:
        ::                                       * AAC41
          ROMPTR  0B5 07F                        * AAC46
          ROMPTR  0B5 039                        * AAC51
          ROMPTR  0B5 07D                        * AAC5C
          ROMPTR  0B5 02F                        * AAC67
          ROMPTR  0B5 029                        * AAC72
          ROMPTR  0B0 09D                        * AAC7D
          ROMPTR  0B0 09C                        * AAC88
          LAM     'PE3                           * AAC93
          FALSE                                  * AACA2
        ;                                        * AACA7

* ROMPTR 0B4 0E9
* refs (1): A2437
ROMP_0B4_0E9:
        ::                                       * AACAC
          {                                      * AACB1
            BINT16                               * AACB6
            ::                                   * AACBB
              ROMPTR  0B4 05D                    * AACC0
              TRUE                               * AACCB
            ;                                    * AACD0
            BINT14                               * AACD5
            ::                                   * AACDA
              BINT3                              * AACDF
              ROMPTR  0B4 0E5                    * AACE4
            ;                                    * AACEF
            BINT56                               * AACF4
            ::                                   * AACF9
              14GETLAM                           * AACFE
              SWAP                               * AAD03
            ;                                    * AAD08
          }                                      * AAD0D
          EQLookup                               * AAD12
          case                                   * AAD17
          ::                                     * AAD1C
            EVAL                                 * AAD21
            TRUE                                 * AAD26
          ;                                      * AAD2B
          DROPFALSE                              * AAD30
        ;                                        * AAD35

* ROMPTR 0B4 0EA
* refs (1): A2437
ROMP_0B4_0EA:
        ::                                       * AAD3A
          DUP                                    * AAD3F
          BINT43                                 * AAD44
          #<>case                                * AAD49
          ROMPTR  0B4 067                        * AAD4E
          DROP                                   * AAD59
          BINT4                                  * AAD5E
          BINT6                                  * AAD63
          ROMPTR  0B4 0EB                        * AAD68
          TrueTrue                               * AAD73
        ;                                        * AAD78

* ROMPTR 0B4 0EB
* refs (1): A2437
ROMP_0B4_0EB:
        ::                                       * AAD7D
          {                                      * AAD82
            NullMenuKey                          * AAD87
            NullMenuKey                          * AAD8C
          }                                      * AAD91
          SWAP                                   * AAD96
          ROMPTR  0B0 0C5                        * AAD9B  ~gFldVal
          >HCOMP                                 * AADA6
          SWAP                                   * AADAB
          ROMPTR  0B0 0C5                        * AADB0  ~gFldVal
          >HCOMP                                 * AADBB
        ;                                        * AADC0

* ROMPTR 0B4 0EC
* refs (1): A2437
ROMP_0B4_0EC:
        ::                                       * AADC5

* ROMPTR 0B4 0ED
* refs (1): A2437
ROMP_0B4_0ED:
          ::                                     * AADCA
            #       BE42                         * AADCF  48706
            BINT1                                * AADD9
            BINT10                               * AADDE
          ;                                      * AADE3

* ROMPTR 0B4 0EE
* refs (1): A2437
ROMP_0B4_0EE:
          ::                                     * AADE8
            #       BE43                         * AADED  48707
            BINT67                               * AADF7
            BINT10                               * AADFC
          ;                                      * AAE01

* ROMPTR 0B4 0EF
* refs (1): A2437
ROMP_0B4_0EF:
          ::                                     * AAE06
            #       BE44                         * AAE0B  48708
            BINT1                                * AAE15
            BINT19                               * AAE1A
          ;                                      * AAE1F

* ROMPTR 0B4 0F0
* refs (1): A2437
ROMP_0B4_0F0:
          ::                                     * AAE24
            #       BE45                         * AAE29  48709
            BINT67                               * AAE33
            BINT19                               * AAE38
          ;                                      * AAE3D

* ROMPTR 0B4 0F1
* refs (1): A2437
ROMP_0B4_0F1:
          ::                                     * AAE42
            OBJ_38345                            * AAE47
            ROMPTR  0B4 0B0                      * AAE4C
            BINT31                               * AAE57
            BINT8                                * AAE5C
            BINT31                               * AAE61
            BINT9                                * AAE66
            BINT1                                * AAE6B
            {                                    * AAE70
              BINT0                              * AAE75
            }                                    * AAE7A
            BINT4                                * AAE7F
            #       BE48                         * AAE84  48712
            MINUSONE                             * AAE8E
            MINUSONE                             * AAE93
            %-1                                  * AAE98
            MINUSONE                             * AAE9D
          ;                                      * AAEA2

* ROMPTR 0B4 0F2
* refs (1): A2437
ROMP_0B4_0F2:
          ::                                     * AAEA7
            OBJ_38345                            * AAEAC
            ROMPTR  0B4 0B0                      * AAEB1
            BINT97                               * AAEBC
            BINT8                                * AAEC1
            BINT31                               * AAEC6
            BINT9                                * AAECB
            BINT1                                * AAED0
            {                                    * AAED5
              BINT0                              * AAEDA
            }                                    * AAEDF
            BINT4                                * AAEE4
            #       BE49                         * AAEE9  48713
            MINUSONE                             * AAEF3
            MINUSONE                             * AAEF8
            %1                                   * AAEFD
            MINUSONE                             * AAF02
          ;                                      * AAF07

* ROMPTR 0B4 0F3
* refs (1): A2437
ROMP_0B4_0F3:
          ::                                     * AAF0C
            OBJ_38345                            * AAF11
            ROMPTR  0B4 0B0                      * AAF16
            BINT31                               * AAF21
            BINT17                               * AAF26
            BINT31                               * AAF2B
            BINT9                                * AAF30
            BINT1                                * AAF35
            {                                    * AAF3A
              BINT0                              * AAF3F
            }                                    * AAF44
            BINT4                                * AAF49
            #       BE4A                         * AAF4E  48714
            MINUSONE                             * AAF58
            MINUSONE                             * AAF5D
            %-1                                  * AAF62
            MINUSONE                             * AAF67
          ;                                      * AAF6C

* ROMPTR 0B4 0F4
* refs (1): A2437
ROMP_0B4_0F4:
          ::                                     * AAF71
            OBJ_38345                            * AAF76
            ROMPTR  0B4 0B0                      * AAF7B
            BINT97                               * AAF86
            BINT17                               * AAF8B
            BINT31                               * AAF90
            BINT9                                * AAF95
            BINT1                                * AAF9A
            {                                    * AAF9F
              BINT0                              * AAFA4
            }                                    * AAFA9
            BINT4                                * AAFAE
            #       BE4B                         * AAFB3  48715
            MINUSONE                             * AAFBD
            MINUSONE                             * AAFC2
            %1                                   * AAFC7
            MINUSONE                             * AAFCC
          ;                                      * AAFD1
          BINT4                                  * AAFD6
          DUP                                    * AAFDB
          'DROPFALSE                             * AAFE0
          #       BE23                           * AAFE5  48675

* ROMPTR 0B4 0F5
* refs (1): A2437
ROMP_0B4_0F5:
          ::                                     * AAFEF
            ROMPTR  0B5 080                      * AAFF4
            ROMPTR  0B5 082                      * AAFFF
          ;                                      * AB00A
          BINT4                                  * AB00F
          ROMPTR  0B0 0AA                        * AB014
        ;                                        * AB01F

* ROMPTR 0B4 0F6
* refs (1): A2437
ROMP_0B4_0F6:
        ::                                       * AB024
          ROMPTR  0B5 083                        * AB029
          ROMPTR  0B5 081                        * AB034
        ;                                        * AB03F

* ROMPTR 0B4 0F7
* refs (1): A2437
ROMP_0B4_0F7:
        ::                                       * AB044

* ROMPTR 0B4 0F8
* refs (1): A2437
ROMP_0B4_0F8:
          ::                                     * AB049
            ROMPTR  0B4 0ED                      * AB04E
            ROMPTR  0B4 0EE                      * AB059
            ROMPTR  0B4 0EF                      * AB064
            ROMPTR  0B4 0F0                      * AB06F

* ROMPTR 0B4 0F9
* refs (1): A2437
ROMP_0B4_0F9:
            ::                                   * AB07A
              #       BE46                       * AB07F  48710
              BINT1                              * AB089
              BINT28                             * AB08E
            ;                                    * AB093

* ROMPTR 0B4 0FA
* refs (1): A2437
ROMP_0B4_0FA:
            ::                                   * AB098
              #       BE47                       * AB09D  48711
              BINT67                             * AB0A7
              BINT28                             * AB0AC
            ;                                    * AB0B1

* ROMPTR 0B4 0FB
* refs (1): A2437
ROMP_0B4_0FB:
            ::                                   * AB0B6
              #       BE4E                       * AB0BB  48718
              BINT1                              * AB0C5
              BINT37                             * AB0CA
            ;                                    * AB0CF

* ROMPTR 0B4 0FC
* refs (1): A2437
ROMP_0B4_0FC:
            ::                                   * AB0D4
              #       BE4F                       * AB0D9  48719
              BINT43                             * AB0E3
              BINT37                             * AB0E8
            ;                                    * AB0ED

* ROMPTR 0B4 0FD
* refs (1): A2437
ROMP_0B4_0FD:
            ::                                   * AB0F2
              #       BE50                       * AB0F7  48720
              BINT85                             * AB101
              BINT37                             * AB106
            ;                                    * AB10B
          ;                                      * AB110

* ROMPTR 0B4 0FE
* refs (1): A2437
ROMP_0B4_0FE:
          ::                                     * AB115
            ROMPTR  0B4 0F1                      * AB11A
            ROMPTR  0B4 0F2                      * AB125
            ROMPTR  0B4 0F3                      * AB130
            ROMPTR  0B4 0F4                      * AB13B

* ROMPTR 0B4 0FF
* refs (1): A2437
ROMP_0B4_0FF:
            ::                                   * AB146
              OBJ_38345                          * AB14B
              ROMPTR  0B4 0B0                    * AB150
              BINT31                             * AB15B
              BINT26                             * AB160
              BINT31                             * AB165
              BINT9                              * AB16A
              BINT1                              * AB16F
              {                                  * AB174
                BINT0                            * AB179
              }                                  * AB17E
              BINT4                              * AB183
              #       BE4C                       * AB188  48716
              MINUSONE                           * AB192
              MINUSONE                           * AB197
              %-1                                * AB19C
              MINUSONE                           * AB1A1
            ;                                    * AB1A6

* ROMPTR 0B4 100
* refs (1): A2437
ROMP_0B4_100:
            ::                                   * AB1AB
              OBJ_38345                          * AB1B0
              ROMPTR  0B4 0B0                    * AB1B5
              BINT97                             * AB1C0
              BINT26                             * AB1C5
              BINT31                             * AB1CA
              BINT9                              * AB1CF
              BINT1                              * AB1D4
              {                                  * AB1D9
                BINT0                            * AB1DE
              }                                  * AB1E3
              BINT4                              * AB1E8
              #       BE4D                       * AB1ED  48717
              MINUSONE                           * AB1F7
              MINUSONE                           * AB1FC
              %1                                 * AB201
              MINUSONE                           * AB206
            ;                                    * AB20B

* ROMPTR 0B4 101
* refs (1): A2437
ROMP_0B4_101:
            ::                                   * AB210
              OBJ_38345                          * AB215
              ROMPTR  0B4 0B0                    * AB21A
              BINT13                             * AB225
              BINT35                             * AB22A
              BINT25                             * AB22F
              BINT9                              * AB234
              BINT1                              * AB239
              {                                  * AB23E
                BINT0                            * AB243
              }                                  * AB248
              BINT4                              * AB24D
              #       BE51                       * AB252  48721
              MINUSONE                           * AB25C
              MINUSONE                           * AB261
              %0_2A2B4                           * AB266
              MINUSONE                           * AB26B
            ;                                    * AB270

* ROMPTR 0B4 102
* refs (1): A2437
ROMP_0B4_102:
            ::                                   * AB275
              OBJ_38345                          * AB27A
              ROMPTR  0B4 0B0                    * AB27F
              BINT55                             * AB28A
              BINT35                             * AB28F
              BINT25                             * AB294
              BINT9                              * AB299
              BINT1                              * AB29E
              {                                  * AB2A3
                BINT0                            * AB2A8
              }                                  * AB2AD
              BINT4                              * AB2B2
              #       BE52                       * AB2B7  48722
              MINUSONE                           * AB2C1
              MINUSONE                           * AB2C6
              %-3                                * AB2CB
              MINUSONE                           * AB2D0
            ;                                    * AB2D5

* ROMPTR 0B4 103
* refs (1): A2437
ROMP_0B4_103:
            ::                                   * AB2DA
              OBJ_38345                          * AB2DF
              ROMPTR  0B4 0B0                    * AB2E4
              BINT97                             * AB2EF
              BINT35                             * AB2F4
              BINT25                             * AB2F9
              BINT9                              * AB2FE
              BINT1                              * AB303
              {                                  * AB308
                BINT0                            * AB30D
              }                                  * AB312
              BINT4                              * AB317
              #       BE53                       * AB31C  48723
              MINUSONE                           * AB326
              MINUSONE                           * AB32B
              %0_2A2B4                           * AB330
              MINUSONE                           * AB335
            ;                                    * AB33A
          ;                                      * AB33F
          BINT9                                  * AB344
          DUP                                    * AB349
          'DROPFALSE                             * AB34E
          #       BE23                           * AB353  48675

* ROMPTR 0B4 104
* refs (1): A2437
ROMP_0B4_104:
          ::                                     * AB35D
            ROMPTR  0B5 080                      * AB362
            ROMPTR  0B5 082                      * AB36D
            ROMPTR  0B5 084                      * AB378
            ROMPTR  0B5 086                      * AB383
          ;                                      * AB38E
          BINT9                                  * AB393
          ROMPTR  0B0 0AA                        * AB398
        ;                                        * AB3A3

* ROMPTR 0B4 105
* refs (1): A2437
ROMP_0B4_105:
        ::                                       * AB3A8
          ROMPTR  0B5 087                        * AB3AD
          ROMPTR  0B5 085                        * AB3B8
          ROMPTR  0B5 083                        * AB3C3
          ROMPTR  0B5 081                        * AB3CE
        ;                                        * AB3D9

* ROMPTR 0B4 106
* refs (1): A2437
ROMP_0B4_106:
        ::                                       * AB3DE
          ROMPTR  0B4 0ED                        * AB3E3
          ROMPTR  0B4 0EE                        * AB3EE
          ROMPTR  0B4 0EF                        * AB3F9
          ROMPTR  0B4 0F0                        * AB404
          ROMPTR  0B4 0F9                        * AB40F
          ROMPTR  0B4 0FA                        * AB41A
          #       BE54                           * AB425  48724
          BINT8                                  * AB42F
          BINT37                                 * AB434
          ROMPTR  0B4 0F1                        * AB439
          ROMPTR  0B4 0F2                        * AB444
          ROMPTR  0B4 0F3                        * AB44F
          ROMPTR  0B4 0F4                        * AB45A
          ROMPTR  0B4 0FF                        * AB465
          ROMPTR  0B4 100                        * AB470
          OBJ_38345                              * AB47B
          ROMPTR  0B4 0B0                        * AB480
          BINT1                                  * AB48B
          BINT35                                 * AB490
          BINT6                                  * AB495
          BINT9                                  * AB49A
          BINT32                                 * AB49F
          MINUSONE                               * AB4A4
          MINUSONE                               * AB4A9
          #       BE55                           * AB4AE  48725
          MINUSONE                               * AB4B8
          MINUSONE                               * AB4BD
          FALSE                                  * AB4C2
          MINUSONE                               * AB4C7
          BINT7                                  * AB4CC
          DUP                                    * AB4D1
          'DROPFALSE                             * AB4D6
          #       BE23                           * AB4DB  48675

* ROMPTR 0B4 107
* refs (1): A2437
ROMP_0B4_107:
          ::                                     * AB4E5
            ROMPTR  0B5 080                      * AB4EA
            ROMPTR  0B5 082                      * AB4F5
            ROMPTR  0B5 084                      * AB500
            LAM     'PE3                         * AB50B
          ;                                      * AB51A
          BINT7                                  * AB51F
          ROMPTR  0B0 0AA                        * AB524
        ;                                        * AB52F
