.data
array_matrix_: .space 400
array_src_: .space 2040
array_buf_: .space 2040
array_reflect1_: .space 200
array_reflect2_: .space 400
str0: .asciiz "ooo"
str1: .asciiz "ooo"
str2: .asciiz "ooo"
str3: .asciiz "ooo"
str4: .asciiz "\n"
str5: .asciiz "ppp"
str6: .asciiz "ppp"
str7: .asciiz "ppp"
str8: .asciiz "ppp"
str9: .asciiz "ppp"
str10: .asciiz "ppp"
str11: .asciiz "ppp"
str12: .asciiz "ppp"
str13: .asciiz "ppp"
str14: .asciiz "ppp"
str15: .asciiz "ppp"
str16: .asciiz "ppp"
str17: .asciiz "\n"
str18: .asciiz "qqq"
str19: .asciiz "qqq"
str20: .asciiz "qqq"
str21: .asciiz "qqq"
str22: .asciiz "qqq"
str23: .asciiz "qqq"
str24: .asciiz "qqq"
str25: .asciiz "qqq"
str26: .asciiz "qqq"
str27: .asciiz "qqq"
str28: .asciiz "qqq"
str29: .asciiz "qqq"
str30: .asciiz "qqq"
str31: .asciiz "qqq"
str32: .asciiz "qqq"
str33: .asciiz "qqq"
str34: .asciiz "qqq"
str35: .asciiz "qqq"
str36: .asciiz "qqq"
str37: .asciiz "qqq"
str38: .asciiz "qqq"
str39: .asciiz "qqq"
str40: .asciiz "qqq"
str41: .asciiz "qqq"
str42: .asciiz "qqq"
str43: .asciiz "qqq"
str44: .asciiz "qqq"
str45: .asciiz "qqq"
str46: .asciiz "qqq"
str47: .asciiz "qqq"
str48: .asciiz "qqq"
str49: .asciiz "qqq"
str50: .asciiz "\n"
str51: .asciiz "19373354\n"
str52: .asciiz "\n"
str53: .asciiz "\n"
.text
addi $gp, $gp, 5092
#<------- var matrix@<0,0> ------->
#<------- var src@<0,0> ------->
#<------- var buf@<0,0> ------->
#<------- var seed@<0,0> = 0 ------->
#<------- var mul@<0,0> = 19260817 ------->
li $t0, 19260817
sw $t0, -608($gp)
#<------- var add@<0,0> = 23333 ------->
li $t0, 23333
sw $t0, -604($gp)
#<------- var reflect1@<0,0>[0] = -711942876 ------->
li $t0, -711942876
sw $t0, array_reflect1_
#<------- var reflect1@<0,0>[1] = -1060809599 ------->
li $t0, -1060809599
sw $t0, array_reflect1_+4
#<------- var reflect1@<0,0>[2] = 1758839997 ------->
li $t0, 1758839997
sw $t0, array_reflect1_+8
#<------- var reflect1@<0,0>[3] = 423174272 ------->
li $t0, 423174272
sw $t0, array_reflect1_+12
#<------- var reflect1@<0,0>[4] = 1412407466 ------->
li $t0, 1412407466
sw $t0, array_reflect1_+16
#<------- var reflect1@<0,0>[5] = 375872692 ------->
li $t0, 375872692
sw $t0, array_reflect1_+20
#<------- var reflect1@<0,0>[6] = 1543568839 ------->
li $t0, 1543568839
sw $t0, array_reflect1_+24
#<------- var reflect1@<0,0>[7] = 915987033 ------->
li $t0, 915987033
sw $t0, array_reflect1_+28
#<------- var reflect1@<0,0>[8] = 698198080 ------->
li $t0, 698198080
sw $t0, array_reflect1_+32
#<------- var reflect1@<0,0>[9] = -2143283456 ------->
li $t0, -2143283456
sw $t0, array_reflect1_+36
#<------- var reflect1@<0,0>[10] = 2059223660 ------->
li $t0, 2059223660
sw $t0, array_reflect1_+40
#<------- var reflect1@<0,0>[11] = -34179219 ------->
li $t0, -34179219
sw $t0, array_reflect1_+44
#<------- var reflect1@<0,0>[12] = 378910912 ------->
li $t0, 378910912
sw $t0, array_reflect1_+48
#<------- var reflect1@<0,0>[13] = 1498631475 ------->
li $t0, 1498631475
sw $t0, array_reflect1_+52
#<------- var reflect1@<0,0>[14] = -1853883889 ------->
li $t0, -1853883889
sw $t0, array_reflect1_+56
#<------- var reflect1@<0,0>[15] = 1640319187 ------->
li $t0, 1640319187
sw $t0, array_reflect1_+60
#<------- var reflect1@<0,0>[16] = 1163758804 ------->
li $t0, 1163758804
sw $t0, array_reflect1_+64
#<------- var reflect1@<0,0>[17] = -931895085 ------->
li $t0, -931895085
sw $t0, array_reflect1_+68
#<------- var reflect1@<0,0>[18] = -2061833199 ------->
li $t0, -2061833199
sw $t0, array_reflect1_+72
#<------- var reflect1@<0,0>[19] = -1556924115 ------->
li $t0, -1556924115
sw $t0, array_reflect1_+76
#<------- var reflect1@<0,0>[20] = -845977183 ------->
li $t0, -845977183
sw $t0, array_reflect1_+80
#<------- var reflect1@<0,0>[21] = 1847164385 ------->
li $t0, 1847164385
sw $t0, array_reflect1_+84
#<------- var reflect1@<0,0>[22] = 1665603629 ------->
li $t0, 1665603629
sw $t0, array_reflect1_+88
#<------- var reflect1@<0,0>[23] = -1703548726 ------->
li $t0, -1703548726
sw $t0, array_reflect1_+92
#<------- var reflect1@<0,0>[24] = -344459473 ------->
li $t0, -344459473
sw $t0, array_reflect1_+96
#<------- var reflect1@<0,0>[25] = -1589712906 ------->
li $t0, -1589712906
sw $t0, array_reflect1_+100
#<------- var reflect1@<0,0>[26] = 149613887 ------->
li $t0, 149613887
sw $t0, array_reflect1_+104
#<------- var reflect1@<0,0>[27] = -396337451 ------->
li $t0, -396337451
sw $t0, array_reflect1_+108
#<------- var reflect1@<0,0>[28] = 1064449581 ------->
li $t0, 1064449581
sw $t0, array_reflect1_+112
#<------- var reflect1@<0,0>[29] = -307889588 ------->
li $t0, -307889588
sw $t0, array_reflect1_+116
#<------- var reflect1@<0,0>[30] = 1661525227 ------->
li $t0, 1661525227
sw $t0, array_reflect1_+120
#<------- var reflect1@<0,0>[31] = -1284472061 ------->
li $t0, -1284472061
sw $t0, array_reflect1_+124
#<------- var reflect1@<0,0>[32] = -499795837 ------->
li $t0, -499795837
sw $t0, array_reflect1_+128
#<------- var reflect1@<0,0>[33] = 255615189 ------->
li $t0, 255615189
sw $t0, array_reflect1_+132
#<------- var reflect1@<0,0>[34] = -729577785 ------->
li $t0, -729577785
sw $t0, array_reflect1_+136
#<------- var reflect1@<0,0>[35] = -1032749994 ------->
li $t0, -1032749994
sw $t0, array_reflect1_+140
#<------- var reflect1@<0,0>[36] = -768262768 ------->
li $t0, -768262768
sw $t0, array_reflect1_+144
#<------- var reflect1@<0,0>[37] = -597607786 ------->
li $t0, -597607786
sw $t0, array_reflect1_+148
#<------- var reflect1@<0,0>[38] = 851269079 ------->
li $t0, 851269079
sw $t0, array_reflect1_+152
#<------- var reflect1@<0,0>[39] = 1196148301 ------->
li $t0, 1196148301
sw $t0, array_reflect1_+156
#<------- var reflect1@<0,0>[40] = -429326133 ------->
li $t0, -429326133
sw $t0, array_reflect1_+160
#<------- var reflect1@<0,0>[41] = 882810866 ------->
li $t0, 882810866
sw $t0, array_reflect1_+164
#<------- var reflect1@<0,0>[42] = 115460578 ------->
li $t0, 115460578
sw $t0, array_reflect1_+168
#<------- var reflect1@<0,0>[43] = 1991442912 ------->
li $t0, 1991442912
sw $t0, array_reflect1_+172
#<------- var reflect1@<0,0>[44] = 623829448 ------->
li $t0, 623829448
sw $t0, array_reflect1_+176
#<------- var reflect1@<0,0>[45] = -1012146871 ------->
li $t0, -1012146871
sw $t0, array_reflect1_+180
#<------- var reflect1@<0,0>[46] = -1954608496 ------->
li $t0, -1954608496
sw $t0, array_reflect1_+184
#<------- var reflect1@<0,0>[47] = 884135322 ------->
li $t0, 884135322
sw $t0, array_reflect1_+188
#<------- var reflect1@<0,0>[48] = -1105545598 ------->
li $t0, -1105545598
sw $t0, array_reflect1_+192
#<------- var reflect1@<0,0>[49] = 1517757891 ------->
li $t0, 1517757891
sw $t0, array_reflect1_+196
#<------- var reflect2@<0,0>[0] = -1152785601 ------->
li $t0, -1152785601
sw $t0, array_reflect2_
#<------- var reflect2@<0,0>[1] = 1891446969 ------->
li $t0, 1891446969
sw $t0, array_reflect2_+4
#<------- var reflect2@<0,0>[2] = 938484211 ------->
li $t0, 938484211
sw $t0, array_reflect2_+8
#<------- var reflect2@<0,0>[3] = -1596516698 ------->
li $t0, -1596516698
sw $t0, array_reflect2_+12
#<------- var reflect2@<0,0>[4] = 1681072330 ------->
li $t0, 1681072330
sw $t0, array_reflect2_+16
#<------- var reflect2@<0,0>[5] = 1317584163 ------->
li $t0, 1317584163
sw $t0, array_reflect2_+20
#<------- var reflect2@<0,0>[6] = -484821643 ------->
li $t0, -484821643
sw $t0, array_reflect2_+24
#<------- var reflect2@<0,0>[7] = 489138378 ------->
li $t0, 489138378
sw $t0, array_reflect2_+28
#<------- var reflect2@<0,0>[8] = -1535659242 ------->
li $t0, -1535659242
sw $t0, array_reflect2_+32
#<------- var reflect2@<0,0>[9] = 2041004366 ------->
li $t0, 2041004366
sw $t0, array_reflect2_+36
#<------- var reflect2@<0,0>[10] = 128222498 ------->
li $t0, 128222498
sw $t0, array_reflect2_+40
#<------- var reflect2@<0,0>[11] = 1090169129 ------->
li $t0, 1090169129
sw $t0, array_reflect2_+44
#<------- var reflect2@<0,0>[12] = -347746822 ------->
li $t0, -347746822
sw $t0, array_reflect2_+48
#<------- var reflect2@<0,0>[13] = -326257601 ------->
li $t0, -326257601
sw $t0, array_reflect2_+52
#<------- var reflect2@<0,0>[14] = -1366930863 ------->
li $t0, -1366930863
sw $t0, array_reflect2_+56
#<------- var reflect2@<0,0>[15] = -1094012930 ------->
li $t0, -1094012930
sw $t0, array_reflect2_+60
#<------- var reflect2@<0,0>[16] = -582270185 ------->
li $t0, -582270185
sw $t0, array_reflect2_+64
#<------- var reflect2@<0,0>[17] = -1129905221 ------->
li $t0, -1129905221
sw $t0, array_reflect2_+68
#<------- var reflect2@<0,0>[18] = -700344045 ------->
li $t0, -700344045
sw $t0, array_reflect2_+72
#<------- var reflect2@<0,0>[19] = 851179157 ------->
li $t0, 851179157
sw $t0, array_reflect2_+76
#<------- var reflect2@<0,0>[20] = -823961496 ------->
li $t0, -823961496
sw $t0, array_reflect2_+80
#<------- var reflect2@<0,0>[21] = 2103453081 ------->
li $t0, 2103453081
sw $t0, array_reflect2_+84
#<------- var reflect2@<0,0>[22] = -402114823 ------->
li $t0, -402114823
sw $t0, array_reflect2_+88
#<------- var reflect2@<0,0>[23] = 2139806715 ------->
li $t0, 2139806715
sw $t0, array_reflect2_+92
#<------- var reflect2@<0,0>[24] = -732814375 ------->
li $t0, -732814375
sw $t0, array_reflect2_+96
#<------- var reflect2@<0,0>[25] = -923421957 ------->
li $t0, -923421957
sw $t0, array_reflect2_+100
#<------- var reflect2@<0,0>[26] = -335456832 ------->
li $t0, -335456832
sw $t0, array_reflect2_+104
#<------- var reflect2@<0,0>[27] = 1792163742 ------->
li $t0, 1792163742
sw $t0, array_reflect2_+108
#<------- var reflect2@<0,0>[28] = 303341687 ------->
li $t0, 303341687
sw $t0, array_reflect2_+112
#<------- var reflect2@<0,0>[29] = 2135186416 ------->
li $t0, 2135186416
sw $t0, array_reflect2_+116
#<------- var reflect2@<0,0>[30] = 1302967469 ------->
li $t0, 1302967469
sw $t0, array_reflect2_+120
#<------- var reflect2@<0,0>[31] = 1623817872 ------->
li $t0, 1623817872
sw $t0, array_reflect2_+124
#<------- var reflect2@<0,0>[32] = 898372270 ------->
li $t0, 898372270
sw $t0, array_reflect2_+128
#<------- var reflect2@<0,0>[33] = -812618050 ------->
li $t0, -812618050
sw $t0, array_reflect2_+132
#<------- var reflect2@<0,0>[34] = -1403178881 ------->
li $t0, -1403178881
sw $t0, array_reflect2_+136
#<------- var reflect2@<0,0>[35] = -1394347584 ------->
li $t0, -1394347584
sw $t0, array_reflect2_+140
#<------- var reflect2@<0,0>[36] = -164180074 ------->
li $t0, -164180074
sw $t0, array_reflect2_+144
#<------- var reflect2@<0,0>[37] = -121807758 ------->
li $t0, -121807758
sw $t0, array_reflect2_+148
#<------- var reflect2@<0,0>[38] = -1732202680 ------->
li $t0, -1732202680
sw $t0, array_reflect2_+152
#<------- var reflect2@<0,0>[39] = 1205353033 ------->
li $t0, 1205353033
sw $t0, array_reflect2_+156
#<------- var reflect2@<0,0>[40] = -1776328495 ------->
li $t0, -1776328495
sw $t0, array_reflect2_+160
#<------- var reflect2@<0,0>[41] = 958769364 ------->
li $t0, 958769364
sw $t0, array_reflect2_+164
#<------- var reflect2@<0,0>[42] = 47496017 ------->
li $t0, 47496017
sw $t0, array_reflect2_+168
#<------- var reflect2@<0,0>[43] = -1384738865 ------->
li $t0, -1384738865
sw $t0, array_reflect2_+172
#<------- var reflect2@<0,0>[44] = 1751940200 ------->
li $t0, 1751940200
sw $t0, array_reflect2_+176
#<------- var reflect2@<0,0>[45] = -97172568 ------->
li $t0, -97172568
sw $t0, array_reflect2_+180
#<------- var reflect2@<0,0>[46] = 502251849 ------->
li $t0, 502251849
sw $t0, array_reflect2_+184
#<------- var reflect2@<0,0>[47] = -1749005702 ------->
li $t0, -1749005702
sw $t0, array_reflect2_+188
#<------- var reflect2@<0,0>[48] = -921534697 ------->
li $t0, -921534697
sw $t0, array_reflect2_+192
#<------- var reflect2@<0,0>[49] = -1202408560 ------->
li $t0, -1202408560
sw $t0, array_reflect2_+196
#<------- var reflect2@<0,0>[50] = 307728049 ------->
li $t0, 307728049
sw $t0, array_reflect2_+200
#<------- var reflect2@<0,0>[51] = -1625382311 ------->
li $t0, -1625382311
sw $t0, array_reflect2_+204
#<------- var reflect2@<0,0>[52] = 1271106322 ------->
li $t0, 1271106322
sw $t0, array_reflect2_+208
#<------- var reflect2@<0,0>[53] = 309930583 ------->
li $t0, 309930583
sw $t0, array_reflect2_+212
#<------- var reflect2@<0,0>[54] = 2007032850 ------->
li $t0, 2007032850
sw $t0, array_reflect2_+216
#<------- var reflect2@<0,0>[55] = 1074055550 ------->
li $t0, 1074055550
sw $t0, array_reflect2_+220
#<------- var reflect2@<0,0>[56] = 2036831205 ------->
li $t0, 2036831205
sw $t0, array_reflect2_+224
#<------- var reflect2@<0,0>[57] = -492323543 ------->
li $t0, -492323543
sw $t0, array_reflect2_+228
#<------- var reflect2@<0,0>[58] = -252604752 ------->
li $t0, -252604752
sw $t0, array_reflect2_+232
#<------- var reflect2@<0,0>[59] = 1295820596 ------->
li $t0, 1295820596
sw $t0, array_reflect2_+236
#<------- var reflect2@<0,0>[60] = 728458994 ------->
li $t0, 728458994
sw $t0, array_reflect2_+240
#<------- var reflect2@<0,0>[61] = 1673642498 ------->
li $t0, 1673642498
sw $t0, array_reflect2_+244
#<------- var reflect2@<0,0>[62] = -51943305 ------->
li $t0, -51943305
sw $t0, array_reflect2_+248
#<------- var reflect2@<0,0>[63] = -1854253096 ------->
li $t0, -1854253096
sw $t0, array_reflect2_+252
#<------- var reflect2@<0,0>[64] = -1024571774 ------->
li $t0, -1024571774
sw $t0, array_reflect2_+256
#<------- var reflect2@<0,0>[65] = 1430035460 ------->
li $t0, 1430035460
sw $t0, array_reflect2_+260
#<------- var reflect2@<0,0>[66] = 1705232663 ------->
li $t0, 1705232663
sw $t0, array_reflect2_+264
#<------- var reflect2@<0,0>[67] = -1803769826 ------->
li $t0, -1803769826
sw $t0, array_reflect2_+268
#<------- var reflect2@<0,0>[68] = -1485716863 ------->
li $t0, -1485716863
sw $t0, array_reflect2_+272
#<------- var reflect2@<0,0>[69] = -1192520056 ------->
li $t0, -1192520056
sw $t0, array_reflect2_+276
#<------- var reflect2@<0,0>[70] = -1503793409 ------->
li $t0, -1503793409
sw $t0, array_reflect2_+280
#<------- var reflect2@<0,0>[71] = 2027983592 ------->
li $t0, 2027983592
sw $t0, array_reflect2_+284
#<------- var reflect2@<0,0>[72] = -1911831470 ------->
li $t0, -1911831470
sw $t0, array_reflect2_+288
#<------- var reflect2@<0,0>[73] = -1387735054 ------->
li $t0, -1387735054
sw $t0, array_reflect2_+292
#<------- var reflect2@<0,0>[74] = -274170342 ------->
li $t0, -274170342
sw $t0, array_reflect2_+296
#<------- var reflect2@<0,0>[75] = -39878981 ------->
li $t0, -39878981
sw $t0, array_reflect2_+300
#<------- var reflect2@<0,0>[76] = 1475936537 ------->
li $t0, 1475936537
sw $t0, array_reflect2_+304
#<------- var reflect2@<0,0>[77] = 1944942266 ------->
li $t0, 1944942266
sw $t0, array_reflect2_+308
#<------- var reflect2@<0,0>[78] = 1579815806 ------->
li $t0, 1579815806
sw $t0, array_reflect2_+312
#<------- var reflect2@<0,0>[79] = 1734290467 ------->
li $t0, 1734290467
sw $t0, array_reflect2_+316
#<------- var reflect2@<0,0>[80] = 1606724733 ------->
li $t0, 1606724733
sw $t0, array_reflect2_+320
#<------- var reflect2@<0,0>[81] = -1839064934 ------->
li $t0, -1839064934
sw $t0, array_reflect2_+324
#<------- var reflect2@<0,0>[82] = 1749681186 ------->
li $t0, 1749681186
sw $t0, array_reflect2_+328
#<------- var reflect2@<0,0>[83] = 1409364573 ------->
li $t0, 1409364573
sw $t0, array_reflect2_+332
#<------- var reflect2@<0,0>[84] = -68127266 ------->
li $t0, -68127266
sw $t0, array_reflect2_+336
#<------- var reflect2@<0,0>[85] = 1869282840 ------->
li $t0, 1869282840
sw $t0, array_reflect2_+340
#<------- var reflect2@<0,0>[86] = 1574753938 ------->
li $t0, 1574753938
sw $t0, array_reflect2_+344
#<------- var reflect2@<0,0>[87] = 1959861217 ------->
li $t0, 1959861217
sw $t0, array_reflect2_+348
#<------- var reflect2@<0,0>[88] = -425501077 ------->
li $t0, -425501077
sw $t0, array_reflect2_+352
#<------- var reflect2@<0,0>[89] = -1281736928 ------->
li $t0, -1281736928
sw $t0, array_reflect2_+356
#<------- var reflect2@<0,0>[90] = -1304579021 ------->
li $t0, -1304579021
sw $t0, array_reflect2_+360
#<------- var reflect2@<0,0>[91] = -1777897472 ------->
li $t0, -1777897472
sw $t0, array_reflect2_+364
#<------- var reflect2@<0,0>[92] = -1921297034 ------->
li $t0, -1921297034
sw $t0, array_reflect2_+368
#<------- var reflect2@<0,0>[93] = 1623258471 ------->
li $t0, 1623258471
sw $t0, array_reflect2_+372
#<------- var reflect2@<0,0>[94] = -226241316 ------->
li $t0, -226241316
sw $t0, array_reflect2_+376
#<------- var reflect2@<0,0>[95] = 824482268 ------->
li $t0, 824482268
sw $t0, array_reflect2_+380
#<------- var reflect2@<0,0>[96] = -1840038765 ------->
li $t0, -1840038765
sw $t0, array_reflect2_+384
#<------- var reflect2@<0,0>[97] = -1238621050 ------->
li $t0, -1238621050
sw $t0, array_reflect2_+388
#<------- var reflect2@<0,0>[98] = 1453319654 ------->
li $t0, 1453319654
sw $t0, array_reflect2_+392
#<------- var reflect2@<0,0>[99] = -1338682930 ------->
li $t0, -1338682930
sw $t0, array_reflect2_+396
addiu $sp, $sp, -580
j func_label_main
#<--------------- FUNC rand--------------->
func_label_rand:
#<---- #T0@<1,0> = 19260817 MUL seed@<0,0> ---->
#<---- Alloc $a2 for seed ---->
lw $a2, -612($gp)
#<---- Alloc $a3 for #T0 ---->
li $v1, 19260817
mult $v1, $a2
mflo $a3
#<---- #T1@<1,0> = #T0@<1,0> ADD 23333 ---->
#<---- Alloc $t0 for #T1 ---->
addiu $t0, $a3, 23333
#<---- ASSIGN seed@<0,0> = #T1@<1,0> ---->
addiu $a2, $t0, 0
#<---- Cancel $a2 for seed ---->
sw $a2, -612($gp)
#<---- return seed@<0,0> ---->
#<---- Alloc $a2 for seed ---->
lw $a2, -612($gp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,0> ---->
jr $ra
#<--------------- FUNC printOne--------------->
func_label_printOne:
#<------- FORM_VAR_DEF num@<1,1> printOne ------->
#<---- Alloc $a2 for num ---->
lw $a2, 4($sp)
#<---- #T2@<1,1> = num@<1,1> MOD 50 ---->
#<---- Alloc $a3 for #T2 ---->
addiu $v1, $zero, 50
div $a2, $v1
mfhi $a3
#<---- #T3@<1,1> = #T2@<1,1> ADD 50 ---->
#<---- Alloc $t0 for #T3 ---->
addiu $t0, $a3, 50
#<---- #T4@<1,1> = #T3@<1,1> MOD 50 ---->
#<---- Alloc $t1 for #T4 ---->
addiu $v1, $zero, 50
div $t0, $v1
mfhi $t1
#<---- LOAD #T5@<1,1> = reflect1@<0,0>[#T4@<1,1>] ---->
#<---- Alloc $t2 for #T5 ---->
sll $a1, $t1, 2
lw $t2, array_reflect1_($a1)
#<---- #T6@<1,1> = num@<1,1> MUL #T5@<1,1> ---->
#<---- Alloc $t3 for #T6 ---->
mult $a2, $t2
mflo $t3
#<---- ASSIGN num@<1,1> = #T6@<1,1> ---->
addiu $a2, $t3, 0
#<---- PRE_CALL rand@0 ---->
#<---- FUNC_CALL rand@0 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for num ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T2 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T3 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T4 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T5 ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for #T6 ---->
sw $t3, 24($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T7@<1,1> = %RTX ---->
#<---- Alloc $a2 for #T7 ---->
move $a2, $v0
#<---- #T8@<1,1> = #T7@<1,1> MOD 4 ---->
#<---- Alloc $a3 for #T8 ---->
addiu $v1, $zero, 4
div $a2, $v1
mfhi $a3
#<---- #T9@<1,1> = #T8@<1,1> ADD 4 ---->
#<---- Alloc $t0 for #T9 ---->
addiu $t0, $a3, 4
#<---- #T10@<1,1> = #T9@<1,1> MOD 4 ---->
#<---- Alloc $t1 for #T10 ---->
addiu $v1, $zero, 4
div $t0, $v1
mfhi $t1
#<---- var select@<1,1> = #T10@<1,1> ---->
#<---- Alloc $t2 for select ---->
addiu $t2, $t1, 0
#<---- SET #T11@<1,1> := select@<1,1> == 0 ---->
#<---- Alloc $t3 for #T11 ---->
seq $t3, $t2, 0
#<---- JUMP_IF #T11@<1,1> == 0 Else_start_label_0 ---->
#<---- Cancel $a2 for #T7 ---->
sw $a2, 28($sp)
#<---- Cancel $a3 for #T8 ---->
sw $a3, 32($sp)
#<---- Cancel $t0 for #T9 ---->
sw $t0, 36($sp)
#<---- Cancel $t1 for #T10 ---->
sw $t1, 40($sp)
#<---- Cancel $t2 for select ---->
sw $t2, 44($sp)
#<---- Cancel $t3 for #T11 ---->
sw $t3, 48($sp)
#<---- Alloc $a2 for #T11 ---->
lw $a2, 48($sp)
beq $a2, 0, Else_start_label_0
#<---- print num@<1,1> ---->
#<---- Alloc $a3 for num ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_0 ---->
#<---- Cancel $a2 for #T11 ---->
sw $a2, 48($sp)
#<---- Cancel $a3 for num ---->
sw $a3, 4($sp)
j ifElse_end_label_0
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- SET #T12@<1,1> := select@<1,1> == 1 ---->
#<---- Alloc $a2 for #T12 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 44($sp)
seq $a2, $a3, 1
#<---- JUMP_IF #T12@<1,1> == 0 Else_start_label_1 ---->
#<---- Cancel $a2 for #T12 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 44($sp)
#<---- Alloc $a2 for #T12 ---->
lw $a2, 52($sp)
beq $a2, 0, Else_start_label_1
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- print num@<1,1> ---->
#<---- Alloc $a3 for num ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_1 ---->
#<---- Cancel $a2 for #T12 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for num ---->
sw $a3, 4($sp)
j ifElse_end_label_1
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- SET #T13@<1,1> := select@<1,1> == 2 ---->
#<---- Alloc $a2 for #T13 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 44($sp)
seq $a2, $a3, 2
#<---- JUMP_IF #T13@<1,1> == 0 Else_start_label_2 ---->
#<---- Cancel $a2 for #T13 ---->
sw $a2, 56($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 44($sp)
#<---- Alloc $a2 for #T13 ---->
lw $a2, 56($sp)
beq $a2, 0, Else_start_label_2
#<---- print num@<1,1> ---->
#<---- Alloc $a3 for num ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_2 ---->
#<---- Cancel $a2 for #T13 ---->
sw $a2, 56($sp)
#<---- Cancel $a3 for num ---->
sw $a3, 4($sp)
j ifElse_end_label_2
#<---- GEN_LABEL Else_start_label_2: ---->
Else_start_label_2:
#<---- SET #T14@<1,1> := select@<1,1> == 3 ---->
#<---- Alloc $a2 for #T14 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 44($sp)
seq $a2, $a3, 3
#<---- JUMP_IF #T14@<1,1> == 0 ifElse_end_label_3 ---->
#<---- Cancel $a2 for #T14 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 44($sp)
#<---- Alloc $a2 for #T14 ---->
lw $a2, 60($sp)
beq $a2, 0, ifElse_end_label_3
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- print num@<1,1> ---->
#<---- Alloc $a3 for num ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_end_label_3: ---->
#<---- Cancel $a2 for #T14 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for num ---->
sw $a3, 4($sp)
ifElse_end_label_3:
#<---- GEN_LABEL ifElse_end_label_2: ---->
ifElse_end_label_2:
#<---- GEN_LABEL ifElse_end_label_1: ---->
ifElse_end_label_1:
#<---- GEN_LABEL ifElse_end_label_0: ---->
ifElse_end_label_0:
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,1> ---->
jr $ra
#<--------------- FUNC printTwo--------------->
func_label_printTwo:
#<------- FORM_VAR_DEF num1@<1,2> printTwo ------->
#<---- Alloc $a2 for num1 ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF num2@<1,2> printTwo ------->
#<---- Alloc $a3 for num2 ---->
lw $a3, 8($sp)
#<---- #T15@<1,2> = num1@<1,2> MOD 10 ---->
#<---- Alloc $t0 for #T15 ---->
addiu $v1, $zero, 10
div $a2, $v1
mfhi $t0
#<---- #T16@<1,2> = #T15@<1,2> ADD 10 ---->
#<---- Alloc $t1 for #T16 ---->
addiu $t1, $t0, 10
#<---- #T17@<1,2> = #T16@<1,2> MOD 10 ---->
#<---- Alloc $t2 for #T17 ---->
addiu $v1, $zero, 10
div $t1, $v1
mfhi $t2
#<---- #T18@<1,2> = num2@<1,2> MOD 10 ---->
#<---- Alloc $t3 for #T18 ---->
addiu $v1, $zero, 10
div $a3, $v1
mfhi $t3
#<---- #T19@<1,2> = #T18@<1,2> ADD 10 ---->
#<---- Alloc $t4 for #T19 ---->
addiu $t4, $t3, 10
#<---- #T20@<1,2> = #T19@<1,2> MOD 10 ---->
#<---- Alloc $t5 for #T20 ---->
addiu $v1, $zero, 10
div $t4, $v1
mfhi $t5
#<---- #T21@<1,2> = #T17@<1,2> MUL 10 ---->
#<---- Alloc $t6 for #T21 ---->
li $v1, 10
mult $t2, $v1
mflo $t6
#<---- #T22@<1,2> = #T21@<1,2> ADD #T20@<1,2> ---->
#<---- Alloc $t7 for #T22 ---->
addu $t7, $t6, $t5
#<---- LOAD #T23@<1,2> = reflect2@<0,0>[#T22@<1,2>] ---->
#<---- Alloc $t8 for #T23 ---->
sll $a1, $t7, 2
lw $t8, array_reflect2_($a1)
#<---- #T24@<1,2> = num1@<1,2> MUL #T23@<1,2> ---->
#<---- Alloc $t9 for #T24 ---->
mult $a2, $t8
mflo $t9
#<---- ASSIGN num1@<1,2> = #T24@<1,2> ---->
addiu $a2, $t9, 0
#<---- #T25@<1,2> = num2@<1,2> MOD 10 ---->
#<---- Alloc $s0 for #T25 ---->
addiu $v1, $zero, 10
div $a3, $v1
mfhi $s0
#<---- #T26@<1,2> = #T25@<1,2> ADD 10 ---->
#<---- Alloc $s1 for #T26 ---->
addiu $s1, $s0, 10
#<---- #T27@<1,2> = #T26@<1,2> MOD 10 ---->
#<---- Alloc $s2 for #T27 ---->
addiu $v1, $zero, 10
div $s1, $v1
mfhi $s2
#<---- #T28@<1,2> = num1@<1,2> MOD 10 ---->
#<---- Alloc $s3 for #T28 ---->
addiu $v1, $zero, 10
div $a2, $v1
mfhi $s3
#<---- #T29@<1,2> = #T28@<1,2> ADD 10 ---->
#<---- Alloc $s4 for #T29 ---->
addiu $s4, $s3, 10
#<---- #T30@<1,2> = #T29@<1,2> MOD 10 ---->
#<---- Alloc $s5 for #T30 ---->
addiu $v1, $zero, 10
div $s4, $v1
mfhi $s5
#<---- #T31@<1,2> = #T27@<1,2> MUL 10 ---->
#<---- Alloc $s6 for #T31 ---->
li $v1, 10
mult $s2, $v1
mflo $s6
#<---- #T32@<1,2> = #T31@<1,2> ADD #T30@<1,2> ---->
#<---- Alloc $s7 for #T32 ---->
addu $s7, $s6, $s5
#<---- LOAD #T33@<1,2> = reflect2@<0,0>[#T32@<1,2>] ---->
#<---- Alloc $fp for #T33 ---->
sll $a1, $s7, 2
lw $fp, array_reflect2_($a1)
#<---- #T34@<1,2> = num2@<1,2> MUL #T33@<1,2> ---->
#<---- Cancel $a2 for num1 ---->
sw $a2, 4($sp)
#<---- Alloc $a2 for #T34 ---->
mult $a3, $fp
mflo $a2
#<---- ASSIGN num2@<1,2> = #T34@<1,2> ---->
addiu $a3, $a2, 0
#<---- PRE_CALL rand@1 ---->
#<---- FUNC_CALL rand@1 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T34 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for num2 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T15 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T16 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T17 ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for #T18 ---->
sw $t3, 24($sp)
#<---- Cancel $t4 for #T19 ---->
sw $t4, 28($sp)
#<---- Cancel $t5 for #T20 ---->
sw $t5, 32($sp)
#<---- Cancel $t6 for #T21 ---->
sw $t6, 36($sp)
#<---- Cancel $t7 for #T22 ---->
sw $t7, 40($sp)
#<---- Cancel $t8 for #T23 ---->
sw $t8, 44($sp)
#<---- Cancel $t9 for #T24 ---->
sw $t9, 48($sp)
#<---- Cancel $s0 for #T25 ---->
sw $s0, 52($sp)
#<---- Cancel $s1 for #T26 ---->
sw $s1, 56($sp)
#<---- Cancel $s2 for #T27 ---->
sw $s2, 60($sp)
#<---- Cancel $s3 for #T28 ---->
sw $s3, 64($sp)
#<---- Cancel $s4 for #T29 ---->
sw $s4, 68($sp)
#<---- Cancel $s5 for #T30 ---->
sw $s5, 72($sp)
#<---- Cancel $s6 for #T31 ---->
sw $s6, 76($sp)
#<---- Cancel $s7 for #T32 ---->
sw $s7, 80($sp)
#<---- Cancel $fp for #T33 ---->
sw $fp, 84($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T35@<1,2> = %RTX ---->
#<---- Alloc $a2 for #T35 ---->
move $a2, $v0
#<---- #T36@<1,2> = #T35@<1,2> MOD 8 ---->
#<---- Alloc $a3 for #T36 ---->
addiu $v1, $zero, 8
div $a2, $v1
mfhi $a3
#<---- #T37@<1,2> = #T36@<1,2> ADD 8 ---->
#<---- Alloc $t0 for #T37 ---->
addiu $t0, $a3, 8
#<---- #T38@<1,2> = #T37@<1,2> MOD 8 ---->
#<---- Alloc $t1 for #T38 ---->
addiu $v1, $zero, 8
div $t0, $v1
mfhi $t1
#<---- var select@<1,2> = #T38@<1,2> ---->
#<---- Alloc $t2 for select ---->
addiu $t2, $t1, 0
#<---- SET #T39@<1,2> := select@<1,2> == 0 ---->
#<---- Alloc $t3 for #T39 ---->
seq $t3, $t2, 0
#<---- JUMP_IF #T39@<1,2> == 0 Else_start_label_3 ---->
#<---- Cancel $a2 for #T35 ---->
sw $a2, 92($sp)
#<---- Cancel $a3 for #T36 ---->
sw $a3, 96($sp)
#<---- Cancel $t0 for #T37 ---->
sw $t0, 100($sp)
#<---- Cancel $t1 for #T38 ---->
sw $t1, 104($sp)
#<---- Cancel $t2 for select ---->
sw $t2, 108($sp)
#<---- Cancel $t3 for #T39 ---->
sw $t3, 112($sp)
#<---- Alloc $a2 for #T39 ---->
lw $a2, 112($sp)
beq $a2, 0, Else_start_label_3
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_4 ---->
#<---- Cancel $a2 for #T39 ---->
sw $a2, 112($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_4
#<---- GEN_LABEL Else_start_label_3: ---->
Else_start_label_3:
#<---- SET #T40@<1,2> := select@<1,2> == 1 ---->
#<---- Alloc $a2 for #T40 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 1
#<---- JUMP_IF #T40@<1,2> == 0 Else_start_label_4 ---->
#<---- Cancel $a2 for #T40 ---->
sw $a2, 116($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T40 ---->
lw $a2, 116($sp)
beq $a2, 0, Else_start_label_4
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_5 ---->
#<---- Cancel $a2 for #T40 ---->
sw $a2, 116($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_5
#<---- GEN_LABEL Else_start_label_4: ---->
Else_start_label_4:
#<---- SET #T41@<1,2> := select@<1,2> == 2 ---->
#<---- Alloc $a2 for #T41 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 2
#<---- JUMP_IF #T41@<1,2> == 0 Else_start_label_5 ---->
#<---- Cancel $a2 for #T41 ---->
sw $a2, 120($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T41 ---->
lw $a2, 120($sp)
beq $a2, 0, Else_start_label_5
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_6 ---->
#<---- Cancel $a2 for #T41 ---->
sw $a2, 120($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_6
#<---- GEN_LABEL Else_start_label_5: ---->
Else_start_label_5:
#<---- SET #T42@<1,2> := select@<1,2> == 3 ---->
#<---- Alloc $a2 for #T42 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 3
#<---- JUMP_IF #T42@<1,2> == 0 Else_start_label_6 ---->
#<---- Cancel $a2 for #T42 ---->
sw $a2, 124($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T42 ---->
lw $a2, 124($sp)
beq $a2, 0, Else_start_label_6
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_7 ---->
#<---- Cancel $a2 for #T42 ---->
sw $a2, 124($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_7
#<---- GEN_LABEL Else_start_label_6: ---->
Else_start_label_6:
#<---- SET #T43@<1,2> := select@<1,2> == 4 ---->
#<---- Alloc $a2 for #T43 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 4
#<---- JUMP_IF #T43@<1,2> == 0 Else_start_label_7 ---->
#<---- Cancel $a2 for #T43 ---->
sw $a2, 128($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T43 ---->
lw $a2, 128($sp)
beq $a2, 0, Else_start_label_7
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_8 ---->
#<---- Cancel $a2 for #T43 ---->
sw $a2, 128($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_8
#<---- GEN_LABEL Else_start_label_7: ---->
Else_start_label_7:
#<---- SET #T44@<1,2> := select@<1,2> == 5 ---->
#<---- Alloc $a2 for #T44 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 5
#<---- JUMP_IF #T44@<1,2> == 0 Else_start_label_8 ---->
#<---- Cancel $a2 for #T44 ---->
sw $a2, 132($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T44 ---->
lw $a2, 132($sp)
beq $a2, 0, Else_start_label_8
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_9 ---->
#<---- Cancel $a2 for #T44 ---->
sw $a2, 132($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_9
#<---- GEN_LABEL Else_start_label_8: ---->
Else_start_label_8:
#<---- SET #T45@<1,2> := select@<1,2> == 6 ---->
#<---- Alloc $a2 for #T45 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 108($sp)
seq $a2, $a3, 6
#<---- JUMP_IF #T45@<1,2> == 0 Else_start_label_9 ---->
#<---- Cancel $a2 for #T45 ---->
sw $a2, 136($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 108($sp)
#<---- Alloc $a2 for #T45 ---->
lw $a2, 136($sp)
beq $a2, 0, Else_start_label_9
#<---- print num1@<1,2> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_10 ---->
#<---- Cancel $a2 for #T45 ---->
sw $a2, 136($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
j ifElse_end_label_10
#<---- GEN_LABEL Else_start_label_9: ---->
Else_start_label_9:
#<---- print #str14 ---->
la $a0, str14
li $v0, 4
syscall
#<---- print num1@<1,2> ---->
#<---- Alloc $a2 for num1 ---->
lw $a2, 4($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str15 ---->
la $a0, str15
li $v0, 4
syscall
#<---- print num2@<1,2> ---->
#<---- Alloc $a3 for num2 ---->
lw $a3, 8($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str16 ---->
la $a0, str16
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_end_label_10: ---->
#<---- Cancel $a2 for num1 ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for num2 ---->
sw $a3, 8($sp)
ifElse_end_label_10:
#<---- GEN_LABEL ifElse_end_label_9: ---->
ifElse_end_label_9:
#<---- GEN_LABEL ifElse_end_label_8: ---->
ifElse_end_label_8:
#<---- GEN_LABEL ifElse_end_label_7: ---->
ifElse_end_label_7:
#<---- GEN_LABEL ifElse_end_label_6: ---->
ifElse_end_label_6:
#<---- GEN_LABEL ifElse_end_label_5: ---->
ifElse_end_label_5:
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- print #str17 ---->
la $a0, str17
li $v0, 4
syscall
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,2> ---->
jr $ra
#<--------------- FUNC printThree--------------->
func_label_printThree:
#<------- FORM_VAR_DEF num1@<1,3> printThree ------->
#<---- Alloc $a2 for num1 ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF num2@<1,3> printThree ------->
#<---- Alloc $a3 for num2 ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF num3@<1,3> printThree ------->
#<---- Alloc $t0 for num3 ---->
lw $t0, 12($sp)
#<---- #T46@<1,3> = num1@<1,3> MOD 50 ---->
#<---- Alloc $t1 for #T46 ---->
addiu $v1, $zero, 50
div $a2, $v1
mfhi $t1
#<---- #T47@<1,3> = #T46@<1,3> ADD 50 ---->
#<---- Alloc $t2 for #T47 ---->
addiu $t2, $t1, 50
#<---- #T48@<1,3> = #T47@<1,3> MOD 50 ---->
#<---- Alloc $t3 for #T48 ---->
addiu $v1, $zero, 50
div $t2, $v1
mfhi $t3
#<---- LOAD #T49@<1,3> = reflect1@<0,0>[#T48@<1,3>] ---->
#<---- Alloc $t4 for #T49 ---->
sll $a1, $t3, 2
lw $t4, array_reflect1_($a1)
#<---- #T50@<1,3> = num1@<1,3> MUL #T49@<1,3> ---->
#<---- Alloc $t5 for #T50 ---->
mult $a2, $t4
mflo $t5
#<---- ASSIGN num1@<1,3> = #T50@<1,3> ---->
addiu $a2, $t5, 0
#<---- #T51@<1,3> = num2@<1,3> MOD 10 ---->
#<---- Alloc $t6 for #T51 ---->
addiu $v1, $zero, 10
div $a3, $v1
mfhi $t6
#<---- #T52@<1,3> = #T51@<1,3> ADD 10 ---->
#<---- Alloc $t7 for #T52 ---->
addiu $t7, $t6, 10
#<---- #T53@<1,3> = #T52@<1,3> MOD 10 ---->
#<---- Alloc $t8 for #T53 ---->
addiu $v1, $zero, 10
div $t7, $v1
mfhi $t8
#<---- #T54@<1,3> = num3@<1,3> MOD 10 ---->
#<---- Alloc $t9 for #T54 ---->
addiu $v1, $zero, 10
div $t0, $v1
mfhi $t9
#<---- #T55@<1,3> = #T54@<1,3> ADD 10 ---->
#<---- Alloc $s0 for #T55 ---->
addiu $s0, $t9, 10
#<---- #T56@<1,3> = #T55@<1,3> MOD 10 ---->
#<---- Alloc $s1 for #T56 ---->
addiu $v1, $zero, 10
div $s0, $v1
mfhi $s1
#<---- #T57@<1,3> = #T53@<1,3> MUL 10 ---->
#<---- Alloc $s2 for #T57 ---->
li $v1, 10
mult $t8, $v1
mflo $s2
#<---- #T58@<1,3> = #T57@<1,3> ADD #T56@<1,3> ---->
#<---- Alloc $s3 for #T58 ---->
addu $s3, $s2, $s1
#<---- LOAD #T59@<1,3> = reflect2@<0,0>[#T58@<1,3>] ---->
#<---- Alloc $s4 for #T59 ---->
sll $a1, $s3, 2
lw $s4, array_reflect2_($a1)
#<---- #T60@<1,3> = num2@<1,3> MUL #T59@<1,3> ---->
#<---- Alloc $s5 for #T60 ---->
mult $a3, $s4
mflo $s5
#<---- ASSIGN num2@<1,3> = #T60@<1,3> ---->
addiu $a3, $s5, 0
#<---- #T61@<1,3> = num3@<1,3> MOD 10 ---->
#<---- Alloc $s6 for #T61 ---->
addiu $v1, $zero, 10
div $t0, $v1
mfhi $s6
#<---- #T62@<1,3> = #T61@<1,3> ADD 10 ---->
#<---- Alloc $s7 for #T62 ---->
addiu $s7, $s6, 10
#<---- #T63@<1,3> = #T62@<1,3> MOD 10 ---->
#<---- Alloc $fp for #T63 ---->
addiu $v1, $zero, 10
div $s7, $v1
mfhi $fp
#<---- #T64@<1,3> = num2@<1,3> MOD 10 ---->
#<---- Cancel $a2 for num1 ---->
sw $a2, 4($sp)
#<---- Alloc $a2 for #T64 ---->
addiu $v1, $zero, 10
div $a3, $v1
mfhi $a2
#<---- #T65@<1,3> = #T64@<1,3> ADD 10 ---->
#<---- Cancel $a3 for num2 ---->
sw $a3, 8($sp)
#<---- Alloc $a3 for #T65 ---->
addiu $a3, $a2, 10
#<---- #T66@<1,3> = #T65@<1,3> MOD 10 ---->
#<---- Cancel $t0 for num3 ---->
sw $t0, 12($sp)
#<---- Alloc $t0 for #T66 ---->
addiu $v1, $zero, 10
div $a3, $v1
mfhi $t0
#<---- #T67@<1,3> = #T63@<1,3> MUL 10 ---->
#<---- Cancel $t1 for #T46 ---->
sw $t1, 16($sp)
#<---- Alloc $t1 for #T67 ---->
li $v1, 10
mult $fp, $v1
mflo $t1
#<---- #T68@<1,3> = #T67@<1,3> ADD #T66@<1,3> ---->
#<---- Cancel $t2 for #T47 ---->
sw $t2, 20($sp)
#<---- Alloc $t2 for #T68 ---->
addu $t2, $t1, $t0
#<---- LOAD #T69@<1,3> = reflect2@<0,0>[#T68@<1,3>] ---->
#<---- Cancel $t3 for #T48 ---->
sw $t3, 24($sp)
#<---- Alloc $t3 for #T69 ---->
sll $a1, $t2, 2
lw $t3, array_reflect2_($a1)
#<---- #T70@<1,3> = num3@<1,3> MUL #T69@<1,3> ---->
#<---- Cancel $t4 for #T49 ---->
sw $t4, 28($sp)
#<---- Alloc $t4 for num3 ---->
lw $t4, 12($sp)
#<---- Cancel $t5 for #T50 ---->
sw $t5, 32($sp)
#<---- Alloc $t5 for #T70 ---->
mult $t4, $t3
mflo $t5
#<---- ASSIGN num3@<1,3> = #T70@<1,3> ---->
addiu $t4, $t5, 0
#<---- PRE_CALL rand@2 ---->
#<---- FUNC_CALL rand@2 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T64 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for #T65 ---->
sw $a3, 92($sp)
#<---- Cancel $t0 for #T66 ---->
sw $t0, 96($sp)
#<---- Cancel $t1 for #T67 ---->
sw $t1, 100($sp)
#<---- Cancel $t2 for #T68 ---->
sw $t2, 104($sp)
#<---- Cancel $t3 for #T69 ---->
sw $t3, 108($sp)
#<---- Cancel $t4 for num3 ---->
sw $t4, 12($sp)
#<---- Cancel $t5 for #T70 ---->
sw $t5, 112($sp)
#<---- Cancel $t6 for #T51 ---->
sw $t6, 36($sp)
#<---- Cancel $t7 for #T52 ---->
sw $t7, 40($sp)
#<---- Cancel $t8 for #T53 ---->
sw $t8, 44($sp)
#<---- Cancel $t9 for #T54 ---->
sw $t9, 48($sp)
#<---- Cancel $s0 for #T55 ---->
sw $s0, 52($sp)
#<---- Cancel $s1 for #T56 ---->
sw $s1, 56($sp)
#<---- Cancel $s2 for #T57 ---->
sw $s2, 60($sp)
#<---- Cancel $s3 for #T58 ---->
sw $s3, 64($sp)
#<---- Cancel $s4 for #T59 ---->
sw $s4, 68($sp)
#<---- Cancel $s5 for #T60 ---->
sw $s5, 72($sp)
#<---- Cancel $s6 for #T61 ---->
sw $s6, 76($sp)
#<---- Cancel $s7 for #T62 ---->
sw $s7, 80($sp)
#<---- Cancel $fp for #T63 ---->
sw $fp, 84($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T71@<1,3> = %RTX ---->
#<---- Alloc $a2 for #T71 ---->
move $a2, $v0
#<---- #T72@<1,3> = #T71@<1,3> MOD 16 ---->
#<---- Alloc $a3 for #T72 ---->
addiu $v1, $zero, 16
div $a2, $v1
mfhi $a3
#<---- #T73@<1,3> = #T72@<1,3> ADD 16 ---->
#<---- Alloc $t0 for #T73 ---->
addiu $t0, $a3, 16
#<---- #T74@<1,3> = #T73@<1,3> MOD 16 ---->
#<---- Alloc $t1 for #T74 ---->
addiu $v1, $zero, 16
div $t0, $v1
mfhi $t1
#<---- var select@<1,3> = #T74@<1,3> ---->
#<---- Alloc $t2 for select ---->
addiu $t2, $t1, 0
#<---- SET #T75@<1,3> := select@<1,3> == 0 ---->
#<---- Alloc $t3 for #T75 ---->
seq $t3, $t2, 0
#<---- JUMP_IF #T75@<1,3> == 0 Else_start_label_10 ---->
#<---- Cancel $a2 for #T71 ---->
sw $a2, 116($sp)
#<---- Cancel $a3 for #T72 ---->
sw $a3, 120($sp)
#<---- Cancel $t0 for #T73 ---->
sw $t0, 124($sp)
#<---- Cancel $t1 for #T74 ---->
sw $t1, 128($sp)
#<---- Cancel $t2 for select ---->
sw $t2, 132($sp)
#<---- Cancel $t3 for #T75 ---->
sw $t3, 136($sp)
#<---- Alloc $a2 for #T75 ---->
lw $a2, 136($sp)
beq $a2, 0, Else_start_label_10
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_11 ---->
#<---- Cancel $a2 for #T75 ---->
sw $a2, 136($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_11
#<---- GEN_LABEL Else_start_label_10: ---->
Else_start_label_10:
#<---- SET #T76@<1,3> := select@<1,3> == 1 ---->
#<---- Alloc $a2 for #T76 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 1
#<---- JUMP_IF #T76@<1,3> == 0 Else_start_label_11 ---->
#<---- Cancel $a2 for #T76 ---->
sw $a2, 140($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T76 ---->
lw $a2, 140($sp)
beq $a2, 0, Else_start_label_11
#<---- print #str18 ---->
la $a0, str18
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_12 ---->
#<---- Cancel $a2 for #T76 ---->
sw $a2, 140($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_12
#<---- GEN_LABEL Else_start_label_11: ---->
Else_start_label_11:
#<---- SET #T77@<1,3> := select@<1,3> == 2 ---->
#<---- Alloc $a2 for #T77 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 2
#<---- JUMP_IF #T77@<1,3> == 0 Else_start_label_12 ---->
#<---- Cancel $a2 for #T77 ---->
sw $a2, 144($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T77 ---->
lw $a2, 144($sp)
beq $a2, 0, Else_start_label_12
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str19 ---->
la $a0, str19
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_13 ---->
#<---- Cancel $a2 for #T77 ---->
sw $a2, 144($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_13
#<---- GEN_LABEL Else_start_label_12: ---->
Else_start_label_12:
#<---- SET #T78@<1,3> := select@<1,3> == 3 ---->
#<---- Alloc $a2 for #T78 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 3
#<---- JUMP_IF #T78@<1,3> == 0 Else_start_label_13 ---->
#<---- Cancel $a2 for #T78 ---->
sw $a2, 148($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T78 ---->
lw $a2, 148($sp)
beq $a2, 0, Else_start_label_13
#<---- print #str20 ---->
la $a0, str20
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str21 ---->
la $a0, str21
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_14 ---->
#<---- Cancel $a2 for #T78 ---->
sw $a2, 148($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_14
#<---- GEN_LABEL Else_start_label_13: ---->
Else_start_label_13:
#<---- SET #T79@<1,3> := select@<1,3> == 4 ---->
#<---- Alloc $a2 for #T79 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 4
#<---- JUMP_IF #T79@<1,3> == 0 Else_start_label_14 ---->
#<---- Cancel $a2 for #T79 ---->
sw $a2, 152($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T79 ---->
lw $a2, 152($sp)
beq $a2, 0, Else_start_label_14
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str22 ---->
la $a0, str22
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_15 ---->
#<---- Cancel $a2 for #T79 ---->
sw $a2, 152($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_15
#<---- GEN_LABEL Else_start_label_14: ---->
Else_start_label_14:
#<---- SET #T80@<1,3> := select@<1,3> == 5 ---->
#<---- Alloc $a2 for #T80 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 5
#<---- JUMP_IF #T80@<1,3> == 0 Else_start_label_15 ---->
#<---- Cancel $a2 for #T80 ---->
sw $a2, 156($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T80 ---->
lw $a2, 156($sp)
beq $a2, 0, Else_start_label_15
#<---- print #str23 ---->
la $a0, str23
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str24 ---->
la $a0, str24
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_16 ---->
#<---- Cancel $a2 for #T80 ---->
sw $a2, 156($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_16
#<---- GEN_LABEL Else_start_label_15: ---->
Else_start_label_15:
#<---- SET #T81@<1,3> := select@<1,3> == 6 ---->
#<---- Alloc $a2 for #T81 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 6
#<---- JUMP_IF #T81@<1,3> == 0 Else_start_label_16 ---->
#<---- Cancel $a2 for #T81 ---->
sw $a2, 160($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T81 ---->
lw $a2, 160($sp)
beq $a2, 0, Else_start_label_16
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str25 ---->
la $a0, str25
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str26 ---->
la $a0, str26
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_17 ---->
#<---- Cancel $a2 for #T81 ---->
sw $a2, 160($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_17
#<---- GEN_LABEL Else_start_label_16: ---->
Else_start_label_16:
#<---- SET #T82@<1,3> := select@<1,3> == 7 ---->
#<---- Alloc $a2 for #T82 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 7
#<---- JUMP_IF #T82@<1,3> == 0 Else_start_label_17 ---->
#<---- Cancel $a2 for #T82 ---->
sw $a2, 164($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T82 ---->
lw $a2, 164($sp)
beq $a2, 0, Else_start_label_17
#<---- print #str27 ---->
la $a0, str27
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str28 ---->
la $a0, str28
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str29 ---->
la $a0, str29
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_18 ---->
#<---- Cancel $a2 for #T82 ---->
sw $a2, 164($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_18
#<---- GEN_LABEL Else_start_label_17: ---->
Else_start_label_17:
#<---- SET #T83@<1,3> := select@<1,3> == 8 ---->
#<---- Alloc $a2 for #T83 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 8
#<---- JUMP_IF #T83@<1,3> == 0 Else_start_label_18 ---->
#<---- Cancel $a2 for #T83 ---->
sw $a2, 168($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T83 ---->
lw $a2, 168($sp)
beq $a2, 0, Else_start_label_18
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str30 ---->
la $a0, str30
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_19 ---->
#<---- Cancel $a2 for #T83 ---->
sw $a2, 168($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_19
#<---- GEN_LABEL Else_start_label_18: ---->
Else_start_label_18:
#<---- SET #T84@<1,3> := select@<1,3> == 9 ---->
#<---- Alloc $a2 for #T84 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 9
#<---- JUMP_IF #T84@<1,3> == 0 Else_start_label_19 ---->
#<---- Cancel $a2 for #T84 ---->
sw $a2, 172($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T84 ---->
lw $a2, 172($sp)
beq $a2, 0, Else_start_label_19
#<---- print #str31 ---->
la $a0, str31
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str32 ---->
la $a0, str32
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_20 ---->
#<---- Cancel $a2 for #T84 ---->
sw $a2, 172($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_20
#<---- GEN_LABEL Else_start_label_19: ---->
Else_start_label_19:
#<---- SET #T85@<1,3> := select@<1,3> == 10 ---->
#<---- Alloc $a2 for #T85 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 10
#<---- JUMP_IF #T85@<1,3> == 0 Else_start_label_20 ---->
#<---- Cancel $a2 for #T85 ---->
sw $a2, 176($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T85 ---->
lw $a2, 176($sp)
beq $a2, 0, Else_start_label_20
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str33 ---->
la $a0, str33
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str34 ---->
la $a0, str34
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_21 ---->
#<---- Cancel $a2 for #T85 ---->
sw $a2, 176($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_21
#<---- GEN_LABEL Else_start_label_20: ---->
Else_start_label_20:
#<---- SET #T86@<1,3> := select@<1,3> == 11 ---->
#<---- Alloc $a2 for #T86 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 11
#<---- JUMP_IF #T86@<1,3> == 0 Else_start_label_21 ---->
#<---- Cancel $a2 for #T86 ---->
sw $a2, 180($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T86 ---->
lw $a2, 180($sp)
beq $a2, 0, Else_start_label_21
#<---- print #str35 ---->
la $a0, str35
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str36 ---->
la $a0, str36
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str37 ---->
la $a0, str37
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_22 ---->
#<---- Cancel $a2 for #T86 ---->
sw $a2, 180($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_22
#<---- GEN_LABEL Else_start_label_21: ---->
Else_start_label_21:
#<---- SET #T87@<1,3> := select@<1,3> == 12 ---->
#<---- Alloc $a2 for #T87 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 12
#<---- JUMP_IF #T87@<1,3> == 0 Else_start_label_22 ---->
#<---- Cancel $a2 for #T87 ---->
sw $a2, 184($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T87 ---->
lw $a2, 184($sp)
beq $a2, 0, Else_start_label_22
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str38 ---->
la $a0, str38
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str39 ---->
la $a0, str39
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_23 ---->
#<---- Cancel $a2 for #T87 ---->
sw $a2, 184($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_23
#<---- GEN_LABEL Else_start_label_22: ---->
Else_start_label_22:
#<---- SET #T88@<1,3> := select@<1,3> == 13 ---->
#<---- Alloc $a2 for #T88 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 13
#<---- JUMP_IF #T88@<1,3> == 0 Else_start_label_23 ---->
#<---- Cancel $a2 for #T88 ---->
sw $a2, 188($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T88 ---->
lw $a2, 188($sp)
beq $a2, 0, Else_start_label_23
#<---- print #str40 ---->
la $a0, str40
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str41 ---->
la $a0, str41
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str42 ---->
la $a0, str42
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- JUMP ifElse_end_label_24 ---->
#<---- Cancel $a2 for #T88 ---->
sw $a2, 188($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_24
#<---- GEN_LABEL Else_start_label_23: ---->
Else_start_label_23:
#<---- SET #T89@<1,3> := select@<1,3> == 14 ---->
#<---- Alloc $a2 for #T89 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 132($sp)
seq $a2, $a3, 14
#<---- JUMP_IF #T89@<1,3> == 0 Else_start_label_24 ---->
#<---- Cancel $a2 for #T89 ---->
sw $a2, 192($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 132($sp)
#<---- Alloc $a2 for #T89 ---->
lw $a2, 192($sp)
beq $a2, 0, Else_start_label_24
#<---- print num1@<1,3> ---->
#<---- Alloc $a3 for num1 ---->
lw $a3, 4($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str43 ---->
la $a0, str43
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $t0 for num2 ---->
lw $t0, 8($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str44 ---->
la $a0, str44
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t1 for num3 ---->
lw $t1, 12($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str45 ---->
la $a0, str45
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_25 ---->
#<---- Cancel $a2 for #T89 ---->
sw $a2, 192($sp)
#<---- Cancel $a3 for num1 ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for num2 ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for num3 ---->
sw $t1, 12($sp)
j ifElse_end_label_25
#<---- GEN_LABEL Else_start_label_24: ---->
Else_start_label_24:
#<---- print #str46 ---->
la $a0, str46
li $v0, 4
syscall
#<---- print num1@<1,3> ---->
#<---- Alloc $a2 for num1 ---->
lw $a2, 4($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str47 ---->
la $a0, str47
li $v0, 4
syscall
#<---- print num2@<1,3> ---->
#<---- Alloc $a3 for num2 ---->
lw $a3, 8($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str48 ---->
la $a0, str48
li $v0, 4
syscall
#<---- print num3@<1,3> ---->
#<---- Alloc $t0 for num3 ---->
lw $t0, 12($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str49 ---->
la $a0, str49
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_end_label_25: ---->
#<---- Cancel $a2 for num1 ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for num2 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for num3 ---->
sw $t0, 12($sp)
ifElse_end_label_25:
#<---- GEN_LABEL ifElse_end_label_24: ---->
ifElse_end_label_24:
#<---- GEN_LABEL ifElse_end_label_23: ---->
ifElse_end_label_23:
#<---- GEN_LABEL ifElse_end_label_22: ---->
ifElse_end_label_22:
#<---- GEN_LABEL ifElse_end_label_21: ---->
ifElse_end_label_21:
#<---- GEN_LABEL ifElse_end_label_20: ---->
ifElse_end_label_20:
#<---- GEN_LABEL ifElse_end_label_19: ---->
ifElse_end_label_19:
#<---- GEN_LABEL ifElse_end_label_18: ---->
ifElse_end_label_18:
#<---- GEN_LABEL ifElse_end_label_17: ---->
ifElse_end_label_17:
#<---- GEN_LABEL ifElse_end_label_16: ---->
ifElse_end_label_16:
#<---- GEN_LABEL ifElse_end_label_15: ---->
ifElse_end_label_15:
#<---- GEN_LABEL ifElse_end_label_14: ---->
ifElse_end_label_14:
#<---- GEN_LABEL ifElse_end_label_13: ---->
ifElse_end_label_13:
#<---- GEN_LABEL ifElse_end_label_12: ---->
ifElse_end_label_12:
#<---- GEN_LABEL ifElse_end_label_11: ---->
ifElse_end_label_11:
#<---- print #str50 ---->
la $a0, str50
li $v0, 4
syscall
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,3> ---->
jr $ra
#<--------------- FUNC initArr--------------->
func_label_initArr:
#<------- FORM_VAR_DEF arr@<1,4> initArr ------->
#<---- Alloc $a2 for arr ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF total@<1,4> initArr ------->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- var i@<1,4> = 0 ---->
#<---- Alloc $t0 for i ---->
move $t0, $zero
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a2 for arr ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 12($sp)
while_judge_label_0:
#<---- SET #T90@<1,4> := i@<1,4> < total@<1,4> ---->
#<---- Alloc $a2 for #T90 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 12($sp)
#<---- Alloc $t0 for total ---->
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T90@<1,4> == 0 while_end_label_0 ---->
#<---- Cancel $a2 for #T90 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for total ---->
sw $t0, 8($sp)
#<---- Alloc $a2 for #T90 ---->
lw $a2, 16($sp)
beq $a2, 0, while_end_label_0
#<---- NEW_BLOCK <2,0> ---->
#<---- PRE_CALL rand@3 ---->
#<---- FUNC_CALL rand@3 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T90 ---->
sw $a2, 16($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T91@<2,0> = %RTX ---->
#<---- Alloc $a2 for #T91 ---->
move $a2, $v0
#<---- SAVE arr@<1,4>[i@<1,4>] = #T91@<2,0> ---->
#<---- Alloc $a3 for i ---->
lw $a3, 12($sp)
sll $a1, $a3, 2
#<---- Alloc $t0 for arr ---->
lw $t0, 4($sp)
addu $v1, $t0, $a1
sw $a2, 0($v1)
#<---- #T92@<2,0> = i@<1,4> ADD 1 ---->
#<---- Alloc $t1 for #T92 ---->
addiu $t1, $a3, 1
#<---- ASSIGN i@<1,4> = #T92@<2,0> ---->
addiu $a3, $t1, 0
#<---- END_BLOCK <2,0> ---->
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 for #T91 ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for arr ---->
sw $t0, 4($sp)
#<---- Cancel $t1 for #T92 ---->
sw $t1, 24($sp)
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,4> ---->
jr $ra
#<--------------- FUNC initDouble--------------->
func_label_initDouble:
#<------- FORM_VAR_DEF arr@<1,5> initDouble ------->
#<---- Alloc $a2 for arr ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF total@<1,5> initDouble ------->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- var i@<1,5> = 0 ---->
#<---- Alloc $t0 for i ---->
move $t0, $zero
#<---- GEN_LABEL while_judge_label_1: ---->
#<---- Cancel $a2 for arr ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 12($sp)
while_judge_label_1:
#<---- SET #T93@<1,5> := i@<1,5> < total@<1,5> ---->
#<---- Alloc $a2 for #T93 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 12($sp)
#<---- Alloc $t0 for total ---->
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T93@<1,5> == 0 while_end_label_1 ---->
#<---- Cancel $a2 for #T93 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for total ---->
sw $t0, 8($sp)
#<---- Alloc $a2 for #T93 ---->
lw $a2, 16($sp)
beq $a2, 0, while_end_label_1
#<---- NEW_BLOCK <2,1> ---->
#<---- PRE_CALL initArr@4 ---->
#<---- PUSH_PARA total@<1,5> #function: initArr@4 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -20($sp)
#<---- #T94@<2,1> = i@<1,5> MUL 10 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 12($sp)
#<---- Alloc $t1 for #T94 ---->
li $v1, 10
mult $t0, $v1
mflo $t1
#<---- PUSH_PARA arr@<1,5>[#T94@<2,1>] #function: initArr@4 #arg: arr ---->
sll $a1, $t1, 2
#<---- Alloc $t2 for arr ---->
lw $t2, 4($sp)
addu $v1, $t2, $a1
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@4 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T93 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T94 ---->
sw $t1, 20($sp)
#<---- Cancel $t2 for arr ---->
sw $t2, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
lw $ra, 0($sp)
#<---- ASSIGN #T95@<2,1> = %RTX ---->
#<---- Alloc $a2 for #T95 ---->
move $a2, $v0
#<---- #T96@<2,1> = i@<1,5> ADD 1 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 12($sp)
#<---- Alloc $t0 for #T96 ---->
addiu $t0, $a3, 1
#<---- ASSIGN i@<1,5> = #T96@<2,1> ---->
addiu $a3, $t0, 0
#<---- END_BLOCK <2,1> ---->
#<---- JUMP while_judge_label_1 ---->
#<---- Cancel $a2 for #T95 ---->
sw $a2, 24($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for #T96 ---->
sw $t0, 28($sp)
j while_judge_label_1
#<---- GEN_LABEL while_end_label_1: ---->
while_end_label_1:
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,5> ---->
jr $ra
#<--------------- FUNC calSum--------------->
func_label_calSum:
#<------- FORM_VAR_DEF arr@<1,6> calSum ------->
#<---- Alloc $a2 for arr ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF total@<1,6> calSum ------->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- var ans@<1,6> = 0 ---->
#<---- Alloc $t0 for ans ---->
move $t0, $zero
#<---- var i@<1,6> = 0 ---->
#<---- Alloc $t1 for i ---->
move $t1, $zero
#<---- GEN_LABEL while_judge_label_2: ---->
#<---- Cancel $a2 for arr ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for ans ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for i ---->
sw $t1, 16($sp)
while_judge_label_2:
#<---- SET #T97@<1,6> := i@<1,6> < total@<1,6> ---->
#<---- Alloc $a2 for #T97 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 16($sp)
#<---- Alloc $t0 for total ---->
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T97@<1,6> == 0 while_end_label_2 ---->
#<---- Cancel $a2 for #T97 ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for total ---->
sw $t0, 8($sp)
#<---- Alloc $a2 for #T97 ---->
lw $a2, 20($sp)
beq $a2, 0, while_end_label_2
#<---- NEW_BLOCK <2,2> ---->
#<---- LOAD #T98@<2,2> = arr@<1,6>[i@<1,6>] ---->
#<---- Alloc $a3 for #T98 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 16($sp)
sll $a1, $t0, 2
#<---- Alloc $t1 for arr ---->
lw $t1, 4($sp)
addu $v1, $t1, $a1
lw $a3, 0($v1)
#<---- #T99@<2,2> = ans@<1,6> ADD #T98@<2,2> ---->
#<---- Alloc $t2 for ans ---->
lw $t2, 12($sp)
#<---- Alloc $t3 for #T99 ---->
addu $t3, $t2, $a3
#<---- ASSIGN ans@<1,6> = #T99@<2,2> ---->
addiu $t2, $t3, 0
#<---- #T100@<2,2> = i@<1,6> MOD 2 ---->
#<---- Alloc $t4 for #T100 ---->
addiu $v1, $zero, 2
div $t0, $v1
mfhi $t4
#<---- JUMP_IF #T100@<2,2> == 0 Else_start_label_25 ---->
#<---- Cancel $a2 for #T97 ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for #T98 ---->
sw $a3, 24($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for arr ---->
sw $t1, 4($sp)
#<---- Cancel $t2 for ans ---->
sw $t2, 12($sp)
#<---- Cancel $t3 for #T99 ---->
sw $t3, 28($sp)
#<---- Cancel $t4 for #T100 ---->
sw $t4, 32($sp)
#<---- Alloc $a2 for #T100 ---->
lw $a2, 32($sp)
beq $a2, 0, Else_start_label_25
#<---- ASSIGN ans@<1,6> = ans@<1,6> ---->
#<---- Alloc $a3 for ans ---->
lw $a3, 12($sp)
addiu $a3, $a3, 0
#<---- JUMP ifElse_end_label_26 ---->
#<---- Cancel $a2 for #T100 ---->
sw $a2, 32($sp)
#<---- Cancel $a3 for ans ---->
sw $a3, 12($sp)
j ifElse_end_label_26
#<---- GEN_LABEL Else_start_label_25: ---->
Else_start_label_25:
#<---- #T101@<2,2> = 0 SUB ans@<1,6> ---->
#<---- Alloc $a2 for ans ---->
lw $a2, 12($sp)
#<---- Alloc $a3 for #T101 ---->
li $v1, 0
subu $a3, $v1, $a2
#<---- ASSIGN ans@<1,6> = #T101@<2,2> ---->
addiu $a2, $a3, 0
#<---- GEN_LABEL ifElse_end_label_26: ---->
#<---- Cancel $a2 for ans ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T101 ---->
sw $a3, 36($sp)
ifElse_end_label_26:
#<---- #T102@<2,2> = i@<1,6> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 16($sp)
#<---- Alloc $a3 for #T102 ---->
addiu $a3, $a2, 1
#<---- ASSIGN i@<1,6> = #T102@<2,2> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <2,2> ---->
#<---- JUMP while_judge_label_2 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for #T102 ---->
sw $a3, 40($sp)
j while_judge_label_2
#<---- GEN_LABEL while_end_label_2: ---->
while_end_label_2:
#<---- return ans@<1,6> ---->
#<---- Alloc $a2 for ans ---->
lw $a2, 12($sp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,6> ---->
jr $ra
#<--------------- FUNC checkArr--------------->
func_label_checkArr:
#<------- FORM_VAR_DEF arr@<1,7> checkArr ------->
#<---- Alloc $a2 for arr ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF total@<1,7> checkArr ------->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- PRE_CALL rand@5 ---->
#<---- FUNC_CALL rand@5 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for arr ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T103@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T103 ---->
move $a2, $v0
#<---- #T104@<1,7> = #T103@<1,7> MOD 3 ---->
#<---- Alloc $a3 for #T104 ---->
addiu $v1, $zero, 3
div $a2, $v1
mfhi $a3
#<---- #T105@<1,7> = #T104@<1,7> ADD 3 ---->
#<---- Alloc $t0 for #T105 ---->
addiu $t0, $a3, 3
#<---- #T106@<1,7> = #T105@<1,7> MOD 3 ---->
#<---- Alloc $t1 for #T106 ---->
addiu $v1, $zero, 3
div $t0, $v1
mfhi $t1
#<---- var select@<1,7> = #T106@<1,7> ---->
#<---- Alloc $t2 for select ---->
addiu $t2, $t1, 0
#<---- SET #T107@<1,7> := select@<1,7> == 0 ---->
#<---- Alloc $t3 for #T107 ---->
seq $t3, $t2, 0
#<---- JUMP_IF #T107@<1,7> == 0 ifElse_end_label_27 ---->
#<---- Cancel $a2 for #T103 ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T104 ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for #T105 ---->
sw $t0, 20($sp)
#<---- Cancel $t1 for #T106 ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for select ---->
sw $t2, 28($sp)
#<---- Cancel $t3 for #T107 ---->
sw $t3, 32($sp)
#<---- Alloc $a2 for #T107 ---->
lw $a2, 32($sp)
beq $a2, 0, ifElse_end_label_27
#<---- PRE_CALL printOne@6 ---->
#<---- PRE_CALL rand@7 ---->
#<---- FUNC_CALL rand@7 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T107 ---->
sw $a2, 32($sp)
addiu $sp, $sp, -76
jal func_label_rand
addiu $sp, $sp, 76
lw $ra, 0($sp)
#<---- ASSIGN #T108@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T108 ---->
move $a2, $v0
#<---- #T109@<1,7> = #T108@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T109 ---->
div $a2, $a3
mfhi $t0
#<---- #T110@<1,7> = #T109@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T110 ---->
addu $t1, $t0, $a3
#<---- #T111@<1,7> = #T110@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T111 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T112@<1,7> = arr@<1,7>[#T111@<1,7>] ---->
#<---- Alloc $t3 for #T112 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T112@<1,7> #function: printOne@6 #arg: num ---->
sw $t3, -60($sp)
#<---- FUNC_CALL printOne@6 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T108 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T109 ---->
sw $t0, 40($sp)
#<---- Cancel $t1 for #T110 ---->
sw $t1, 44($sp)
#<---- Cancel $t2 for #T111 ---->
sw $t2, 48($sp)
#<---- Cancel $t3 for #T112 ---->
sw $t3, 52($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -64
jal func_label_printOne
addiu $sp, $sp, 64
lw $ra, 0($sp)
#<---- ASSIGN #T113@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T113 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_27: ---->
#<---- Cancel $a2 for #T113 ---->
sw $a2, 56($sp)
ifElse_end_label_27:
#<---- SET #T114@<1,7> := select@<1,7> == 1 ---->
#<---- Alloc $a2 for #T114 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 28($sp)
seq $a2, $a3, 1
#<---- JUMP_IF #T114@<1,7> == 0 ifElse_end_label_28 ---->
#<---- Cancel $a2 for #T114 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 28($sp)
#<---- Alloc $a2 for #T114 ---->
lw $a2, 60($sp)
beq $a2, 0, ifElse_end_label_28
#<---- PRE_CALL printTwo@8 ---->
#<---- PRE_CALL rand@9 ---->
#<---- FUNC_CALL rand@9 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T114 ---->
sw $a2, 60($sp)
addiu $sp, $sp, -152
jal func_label_rand
addiu $sp, $sp, 152
lw $ra, 0($sp)
#<---- ASSIGN #T115@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T115 ---->
move $a2, $v0
#<---- #T116@<1,7> = #T115@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T116 ---->
div $a2, $a3
mfhi $t0
#<---- #T117@<1,7> = #T116@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T117 ---->
addu $t1, $t0, $a3
#<---- #T118@<1,7> = #T117@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T118 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T119@<1,7> = arr@<1,7>[#T118@<1,7>] ---->
#<---- Alloc $t3 for #T119 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T119@<1,7> #function: printTwo@8 #arg: num2 ---->
sw $t3, -132($sp)
#<---- PRE_CALL rand@10 ---->
#<---- FUNC_CALL rand@10 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T115 ---->
sw $a2, 64($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T116 ---->
sw $t0, 68($sp)
#<---- Cancel $t1 for #T117 ---->
sw $t1, 72($sp)
#<---- Cancel $t2 for #T118 ---->
sw $t2, 76($sp)
#<---- Cancel $t3 for #T119 ---->
sw $t3, 80($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -152
jal func_label_rand
addiu $sp, $sp, 152
lw $ra, 0($sp)
#<---- ASSIGN #T120@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T120 ---->
move $a2, $v0
#<---- #T121@<1,7> = #T120@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T121 ---->
div $a2, $a3
mfhi $t0
#<---- #T122@<1,7> = #T121@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T122 ---->
addu $t1, $t0, $a3
#<---- #T123@<1,7> = #T122@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T123 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T124@<1,7> = arr@<1,7>[#T123@<1,7>] ---->
#<---- Alloc $t3 for #T124 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T124@<1,7> #function: printTwo@8 #arg: num1 ---->
sw $t3, -136($sp)
#<---- FUNC_CALL printTwo@8 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T120 ---->
sw $a2, 84($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T121 ---->
sw $t0, 88($sp)
#<---- Cancel $t1 for #T122 ---->
sw $t1, 92($sp)
#<---- Cancel $t2 for #T123 ---->
sw $t2, 96($sp)
#<---- Cancel $t3 for #T124 ---->
sw $t3, 100($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -140
jal func_label_printTwo
addiu $sp, $sp, 140
lw $ra, 0($sp)
#<---- ASSIGN #T125@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T125 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_28: ---->
#<---- Cancel $a2 for #T125 ---->
sw $a2, 104($sp)
ifElse_end_label_28:
#<---- SET #T126@<1,7> := select@<1,7> == 2 ---->
#<---- Alloc $a2 for #T126 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 28($sp)
seq $a2, $a3, 2
#<---- JUMP_IF #T126@<1,7> == 0 ifElse_end_label_29 ---->
#<---- Cancel $a2 for #T126 ---->
sw $a2, 108($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 28($sp)
#<---- Alloc $a2 for #T126 ---->
lw $a2, 108($sp)
beq $a2, 0, ifElse_end_label_29
#<---- PRE_CALL printThree@11 ---->
#<---- PRE_CALL rand@12 ---->
#<---- FUNC_CALL rand@12 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T126 ---->
sw $a2, 108($sp)
addiu $sp, $sp, -208
jal func_label_rand
addiu $sp, $sp, 208
lw $ra, 0($sp)
#<---- ASSIGN #T127@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T127 ---->
move $a2, $v0
#<---- #T128@<1,7> = #T127@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T128 ---->
div $a2, $a3
mfhi $t0
#<---- #T129@<1,7> = #T128@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T129 ---->
addu $t1, $t0, $a3
#<---- #T130@<1,7> = #T129@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T130 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T131@<1,7> = arr@<1,7>[#T130@<1,7>] ---->
#<---- Alloc $t3 for #T131 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T131@<1,7> #function: printThree@11 #arg: num3 ---->
sw $t3, -184($sp)
#<---- PRE_CALL rand@13 ---->
#<---- FUNC_CALL rand@13 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T127 ---->
sw $a2, 112($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T128 ---->
sw $t0, 116($sp)
#<---- Cancel $t1 for #T129 ---->
sw $t1, 120($sp)
#<---- Cancel $t2 for #T130 ---->
sw $t2, 124($sp)
#<---- Cancel $t3 for #T131 ---->
sw $t3, 128($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -208
jal func_label_rand
addiu $sp, $sp, 208
lw $ra, 0($sp)
#<---- ASSIGN #T132@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T132 ---->
move $a2, $v0
#<---- #T133@<1,7> = #T132@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T133 ---->
div $a2, $a3
mfhi $t0
#<---- #T134@<1,7> = #T133@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T134 ---->
addu $t1, $t0, $a3
#<---- #T135@<1,7> = #T134@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T135 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T136@<1,7> = arr@<1,7>[#T135@<1,7>] ---->
#<---- Alloc $t3 for #T136 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T136@<1,7> #function: printThree@11 #arg: num2 ---->
sw $t3, -188($sp)
#<---- PRE_CALL rand@14 ---->
#<---- FUNC_CALL rand@14 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T132 ---->
sw $a2, 132($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T133 ---->
sw $t0, 136($sp)
#<---- Cancel $t1 for #T134 ---->
sw $t1, 140($sp)
#<---- Cancel $t2 for #T135 ---->
sw $t2, 144($sp)
#<---- Cancel $t3 for #T136 ---->
sw $t3, 148($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -208
jal func_label_rand
addiu $sp, $sp, 208
lw $ra, 0($sp)
#<---- ASSIGN #T137@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T137 ---->
move $a2, $v0
#<---- #T138@<1,7> = #T137@<1,7> MOD total@<1,7> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T138 ---->
div $a2, $a3
mfhi $t0
#<---- #T139@<1,7> = #T138@<1,7> ADD total@<1,7> ---->
#<---- Alloc $t1 for #T139 ---->
addu $t1, $t0, $a3
#<---- #T140@<1,7> = #T139@<1,7> MOD total@<1,7> ---->
#<---- Alloc $t2 for #T140 ---->
div $t1, $a3
mfhi $t2
#<---- LOAD #T141@<1,7> = arr@<1,7>[#T140@<1,7>] ---->
#<---- Alloc $t3 for #T141 ---->
sll $a1, $t2, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
lw $t3, 0($v1)
#<---- PUSH_PARA #T141@<1,7> #function: printThree@11 #arg: num1 ---->
sw $t3, -192($sp)
#<---- FUNC_CALL printThree@11 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T137 ---->
sw $a2, 152($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T138 ---->
sw $t0, 156($sp)
#<---- Cancel $t1 for #T139 ---->
sw $t1, 160($sp)
#<---- Cancel $t2 for #T140 ---->
sw $t2, 164($sp)
#<---- Cancel $t3 for #T141 ---->
sw $t3, 168($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -196
jal func_label_printThree
addiu $sp, $sp, 196
lw $ra, 0($sp)
#<---- ASSIGN #T142@<1,7> = %RTX ---->
#<---- Alloc $a2 for #T142 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_29: ---->
#<---- Cancel $a2 for #T142 ---->
sw $a2, 172($sp)
ifElse_end_label_29:
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,7> ---->
jr $ra
#<--------------- FUNC checkDouble--------------->
func_label_checkDouble:
#<------- FORM_VAR_DEF arr@<1,8> checkDouble ------->
#<---- Alloc $a2 for arr ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF total@<1,8> checkDouble ------->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- PRE_CALL rand@15 ---->
#<---- FUNC_CALL rand@15 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for arr ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -12
jal func_label_rand
addiu $sp, $sp, 12
lw $ra, 0($sp)
#<---- ASSIGN #T143@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T143 ---->
move $a2, $v0
#<---- #T144@<1,8> = #T143@<1,8> MOD 3 ---->
#<---- Alloc $a3 for #T144 ---->
addiu $v1, $zero, 3
div $a2, $v1
mfhi $a3
#<---- #T145@<1,8> = #T144@<1,8> ADD 3 ---->
#<---- Alloc $t0 for #T145 ---->
addiu $t0, $a3, 3
#<---- #T146@<1,8> = #T145@<1,8> MOD 3 ---->
#<---- Alloc $t1 for #T146 ---->
addiu $v1, $zero, 3
div $t0, $v1
mfhi $t1
#<---- var select@<1,8> = #T146@<1,8> ---->
#<---- Alloc $t2 for select ---->
addiu $t2, $t1, 0
#<---- SET #T147@<1,8> := select@<1,8> == 0 ---->
#<---- Alloc $t3 for #T147 ---->
seq $t3, $t2, 0
#<---- JUMP_IF #T147@<1,8> == 0 ifElse_end_label_30 ---->
#<---- Cancel $a2 for #T143 ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T144 ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for #T145 ---->
sw $t0, 20($sp)
#<---- Cancel $t1 for #T146 ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for select ---->
sw $t2, 28($sp)
#<---- Cancel $t3 for #T147 ---->
sw $t3, 32($sp)
#<---- Alloc $a2 for #T147 ---->
lw $a2, 32($sp)
beq $a2, 0, ifElse_end_label_30
#<---- PRE_CALL printOne@16 ---->
#<---- PRE_CALL calSum@17 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@17 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -100($sp)
#<---- PRE_CALL rand@18 ---->
#<---- FUNC_CALL rand@18 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T147 ---->
sw $a2, 32($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -120
jal func_label_rand
addiu $sp, $sp, 120
lw $ra, 0($sp)
#<---- ASSIGN #T148@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T148 ---->
move $a2, $v0
#<---- #T149@<1,8> = #T148@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T149 ---->
div $a2, $a3
mfhi $t0
#<---- #T150@<1,8> = #T149@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T150 ---->
addu $t1, $t0, $a3
#<---- #T151@<1,8> = #T150@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T151 ---->
div $t1, $a3
mfhi $t2
#<---- #T152@<1,8> = #T151@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T152 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T152@<1,8>] #function: calSum@17 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -104($sp)
#<---- FUNC_CALL calSum@17 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T148 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T149 ---->
sw $t0, 40($sp)
#<---- Cancel $t1 for #T150 ---->
sw $t1, 44($sp)
#<---- Cancel $t2 for #T151 ---->
sw $t2, 48($sp)
#<---- Cancel $t3 for #T152 ---->
sw $t3, 52($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -108
jal func_label_calSum
addiu $sp, $sp, 108
lw $ra, 0($sp)
#<---- ASSIGN #T153@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T153 ---->
move $a2, $v0
#<---- PUSH_PARA #T153@<1,8> #function: printOne@16 #arg: num ---->
sw $a2, -60($sp)
#<---- FUNC_CALL printOne@16 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T153 ---->
sw $a2, 56($sp)
addiu $sp, $sp, -64
jal func_label_printOne
addiu $sp, $sp, 64
lw $ra, 0($sp)
#<---- ASSIGN #T154@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T154 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_30: ---->
#<---- Cancel $a2 for #T154 ---->
sw $a2, 60($sp)
ifElse_end_label_30:
#<---- SET #T155@<1,8> := select@<1,8> == 1 ---->
#<---- Alloc $a2 for #T155 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 28($sp)
seq $a2, $a3, 1
#<---- JUMP_IF #T155@<1,8> == 0 ifElse_end_label_31 ---->
#<---- Cancel $a2 for #T155 ---->
sw $a2, 64($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 28($sp)
#<---- Alloc $a2 for #T155 ---->
lw $a2, 64($sp)
beq $a2, 0, ifElse_end_label_31
#<---- PRE_CALL printTwo@19 ---->
#<---- PRE_CALL calSum@20 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@20 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -176($sp)
#<---- PRE_CALL rand@21 ---->
#<---- FUNC_CALL rand@21 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T155 ---->
sw $a2, 64($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -196
jal func_label_rand
addiu $sp, $sp, 196
lw $ra, 0($sp)
#<---- ASSIGN #T156@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T156 ---->
move $a2, $v0
#<---- #T157@<1,8> = #T156@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T157 ---->
div $a2, $a3
mfhi $t0
#<---- #T158@<1,8> = #T157@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T158 ---->
addu $t1, $t0, $a3
#<---- #T159@<1,8> = #T158@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T159 ---->
div $t1, $a3
mfhi $t2
#<---- #T160@<1,8> = #T159@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T160 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T160@<1,8>] #function: calSum@20 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -180($sp)
#<---- FUNC_CALL calSum@20 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T156 ---->
sw $a2, 68($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T157 ---->
sw $t0, 72($sp)
#<---- Cancel $t1 for #T158 ---->
sw $t1, 76($sp)
#<---- Cancel $t2 for #T159 ---->
sw $t2, 80($sp)
#<---- Cancel $t3 for #T160 ---->
sw $t3, 84($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -184
jal func_label_calSum
addiu $sp, $sp, 184
lw $ra, 0($sp)
#<---- ASSIGN #T161@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T161 ---->
move $a2, $v0
#<---- PUSH_PARA #T161@<1,8> #function: printTwo@19 #arg: num2 ---->
sw $a2, -132($sp)
#<---- PRE_CALL calSum@22 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@22 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -176($sp)
#<---- PRE_CALL rand@23 ---->
#<---- FUNC_CALL rand@23 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T161 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -196
jal func_label_rand
addiu $sp, $sp, 196
lw $ra, 0($sp)
#<---- ASSIGN #T162@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T162 ---->
move $a2, $v0
#<---- #T163@<1,8> = #T162@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T163 ---->
div $a2, $a3
mfhi $t0
#<---- #T164@<1,8> = #T163@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T164 ---->
addu $t1, $t0, $a3
#<---- #T165@<1,8> = #T164@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T165 ---->
div $t1, $a3
mfhi $t2
#<---- #T166@<1,8> = #T165@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T166 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T166@<1,8>] #function: calSum@22 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -180($sp)
#<---- FUNC_CALL calSum@22 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T162 ---->
sw $a2, 92($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T163 ---->
sw $t0, 96($sp)
#<---- Cancel $t1 for #T164 ---->
sw $t1, 100($sp)
#<---- Cancel $t2 for #T165 ---->
sw $t2, 104($sp)
#<---- Cancel $t3 for #T166 ---->
sw $t3, 108($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -184
jal func_label_calSum
addiu $sp, $sp, 184
lw $ra, 0($sp)
#<---- ASSIGN #T167@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T167 ---->
move $a2, $v0
#<---- PUSH_PARA #T167@<1,8> #function: printTwo@19 #arg: num1 ---->
sw $a2, -136($sp)
#<---- FUNC_CALL printTwo@19 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T167 ---->
sw $a2, 112($sp)
addiu $sp, $sp, -140
jal func_label_printTwo
addiu $sp, $sp, 140
lw $ra, 0($sp)
#<---- ASSIGN #T168@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T168 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_31: ---->
#<---- Cancel $a2 for #T168 ---->
sw $a2, 116($sp)
ifElse_end_label_31:
#<---- SET #T169@<1,8> := select@<1,8> == 2 ---->
#<---- Alloc $a2 for #T169 ---->
#<---- Alloc $a3 for select ---->
lw $a3, 28($sp)
seq $a2, $a3, 2
#<---- JUMP_IF #T169@<1,8> == 0 ifElse_end_label_32 ---->
#<---- Cancel $a2 for #T169 ---->
sw $a2, 120($sp)
#<---- Cancel $a3 for select ---->
sw $a3, 28($sp)
#<---- Alloc $a2 for #T169 ---->
lw $a2, 120($sp)
beq $a2, 0, ifElse_end_label_32
#<---- PRE_CALL printThree@24 ---->
#<---- PRE_CALL calSum@25 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@25 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -232($sp)
#<---- PRE_CALL rand@26 ---->
#<---- FUNC_CALL rand@26 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T169 ---->
sw $a2, 120($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -252
jal func_label_rand
addiu $sp, $sp, 252
lw $ra, 0($sp)
#<---- ASSIGN #T170@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T170 ---->
move $a2, $v0
#<---- #T171@<1,8> = #T170@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T171 ---->
div $a2, $a3
mfhi $t0
#<---- #T172@<1,8> = #T171@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T172 ---->
addu $t1, $t0, $a3
#<---- #T173@<1,8> = #T172@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T173 ---->
div $t1, $a3
mfhi $t2
#<---- #T174@<1,8> = #T173@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T174 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T174@<1,8>] #function: calSum@25 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -236($sp)
#<---- FUNC_CALL calSum@25 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T170 ---->
sw $a2, 124($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T171 ---->
sw $t0, 128($sp)
#<---- Cancel $t1 for #T172 ---->
sw $t1, 132($sp)
#<---- Cancel $t2 for #T173 ---->
sw $t2, 136($sp)
#<---- Cancel $t3 for #T174 ---->
sw $t3, 140($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -240
jal func_label_calSum
addiu $sp, $sp, 240
lw $ra, 0($sp)
#<---- ASSIGN #T175@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T175 ---->
move $a2, $v0
#<---- PUSH_PARA #T175@<1,8> #function: printThree@24 #arg: num3 ---->
sw $a2, -184($sp)
#<---- PRE_CALL calSum@27 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@27 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -232($sp)
#<---- PRE_CALL rand@28 ---->
#<---- FUNC_CALL rand@28 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T175 ---->
sw $a2, 144($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -252
jal func_label_rand
addiu $sp, $sp, 252
lw $ra, 0($sp)
#<---- ASSIGN #T176@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T176 ---->
move $a2, $v0
#<---- #T177@<1,8> = #T176@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T177 ---->
div $a2, $a3
mfhi $t0
#<---- #T178@<1,8> = #T177@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T178 ---->
addu $t1, $t0, $a3
#<---- #T179@<1,8> = #T178@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T179 ---->
div $t1, $a3
mfhi $t2
#<---- #T180@<1,8> = #T179@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T180 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T180@<1,8>] #function: calSum@27 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -236($sp)
#<---- FUNC_CALL calSum@27 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T176 ---->
sw $a2, 148($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T177 ---->
sw $t0, 152($sp)
#<---- Cancel $t1 for #T178 ---->
sw $t1, 156($sp)
#<---- Cancel $t2 for #T179 ---->
sw $t2, 160($sp)
#<---- Cancel $t3 for #T180 ---->
sw $t3, 164($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -240
jal func_label_calSum
addiu $sp, $sp, 240
lw $ra, 0($sp)
#<---- ASSIGN #T181@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T181 ---->
move $a2, $v0
#<---- PUSH_PARA #T181@<1,8> #function: printThree@24 #arg: num2 ---->
sw $a2, -188($sp)
#<---- PRE_CALL calSum@29 ---->
#<---- PUSH_PARA total@<1,8> #function: calSum@29 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
sw $a3, -232($sp)
#<---- PRE_CALL rand@30 ---->
#<---- FUNC_CALL rand@30 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T181 ---->
sw $a2, 168($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
addiu $sp, $sp, -252
jal func_label_rand
addiu $sp, $sp, 252
lw $ra, 0($sp)
#<---- ASSIGN #T182@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T182 ---->
move $a2, $v0
#<---- #T183@<1,8> = #T182@<1,8> MOD total@<1,8> ---->
#<---- Alloc $a3 for total ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for #T183 ---->
div $a2, $a3
mfhi $t0
#<---- #T184@<1,8> = #T183@<1,8> ADD total@<1,8> ---->
#<---- Alloc $t1 for #T184 ---->
addu $t1, $t0, $a3
#<---- #T185@<1,8> = #T184@<1,8> MOD total@<1,8> ---->
#<---- Alloc $t2 for #T185 ---->
div $t1, $a3
mfhi $t2
#<---- #T186@<1,8> = #T185@<1,8> MUL 10 ---->
#<---- Alloc $t3 for #T186 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- PUSH_PARA arr@<1,8>[#T186@<1,8>] #function: calSum@29 #arg: arr ---->
sll $a1, $t3, 2
#<---- Alloc $t4 for arr ---->
lw $t4, 4($sp)
addu $v1, $t4, $a1
sw $v1, -236($sp)
#<---- FUNC_CALL calSum@29 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T182 ---->
sw $a2, 172($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T183 ---->
sw $t0, 176($sp)
#<---- Cancel $t1 for #T184 ---->
sw $t1, 180($sp)
#<---- Cancel $t2 for #T185 ---->
sw $t2, 184($sp)
#<---- Cancel $t3 for #T186 ---->
sw $t3, 188($sp)
#<---- Cancel $t4 for arr ---->
sw $t4, 4($sp)
addiu $sp, $sp, -240
jal func_label_calSum
addiu $sp, $sp, 240
lw $ra, 0($sp)
#<---- ASSIGN #T187@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T187 ---->
move $a2, $v0
#<---- PUSH_PARA #T187@<1,8> #function: printThree@24 #arg: num1 ---->
sw $a2, -192($sp)
#<---- FUNC_CALL printThree@24 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T187 ---->
sw $a2, 192($sp)
addiu $sp, $sp, -196
jal func_label_printThree
addiu $sp, $sp, 196
lw $ra, 0($sp)
#<---- ASSIGN #T188@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T188 ---->
move $a2, $v0
#<---- GEN_LABEL ifElse_end_label_32: ---->
#<---- Cancel $a2 for #T188 ---->
sw $a2, 196($sp)
ifElse_end_label_32:
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,8> ---->
jr $ra
#<--------------- FUNC bubbleSort--------------->
func_label_bubbleSort:
#<------- FORM_VAR_DEF total@<1,9> bubbleSort ------->
#<---- Alloc $a2 for total ---->
lw $a2, 4($sp)
#<---- var i@<1,9> = 0 ---->
#<---- Alloc $a3 for i ---->
move $a3, $zero
#<---- SET #T189@<1,9> := i@<1,9> < total@<1,9> ---->
#<---- Alloc $t0 for #T189 ---->
slt $t0, $a3, $a2
#<---- JUMP_IF #T189@<1,9> == 0 ifElse_end_label_33 ---->
#<---- Cancel $a2 for total ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T189 ---->
sw $t0, 12($sp)
#<---- Alloc $a2 for #T189 ---->
lw $a2, 12($sp)
beq $a2, 0, ifElse_end_label_33
#<---- GEN_LABEL while_judge_label_3: ---->
#<---- Cancel $a2 for #T189 ---->
sw $a2, 12($sp)
while_judge_label_3:
#<---- NEW_BLOCK <2,3> ---->
#<---- NEW_BLOCK <3,0> ---->
#<---- var j@<3,0> = 0 ---->
#<---- Alloc $a2 for j ---->
move $a2, $zero
#<---- #T190@<3,0> = total@<1,9> SUB i@<1,9> ---->
#<---- Alloc $a3 for i ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for total ---->
lw $t0, 4($sp)
#<---- Alloc $t1 for #T190 ---->
subu $t1, $t0, $a3
#<---- #T191@<3,0> = #T190@<3,0> SUB 1 ---->
#<---- Alloc $t2 for #T191 ---->
addiu $t2, $t1, -1
#<---- SET #T192@<3,0> := j@<3,0> < #T191@<3,0> ---->
#<---- Alloc $t3 for #T192 ---->
slt $t3, $a2, $t2
#<---- JUMP_IF #T192@<3,0> == 0 ifElse_end_label_34 ---->
#<---- Cancel $a2 for j ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for total ---->
sw $t0, 4($sp)
#<---- Cancel $t1 for #T190 ---->
sw $t1, 20($sp)
#<---- Cancel $t2 for #T191 ---->
sw $t2, 24($sp)
#<---- Cancel $t3 for #T192 ---->
sw $t3, 28($sp)
#<---- Alloc $a2 for #T192 ---->
lw $a2, 28($sp)
beq $a2, 0, ifElse_end_label_34
#<---- GEN_LABEL while_judge_label_4: ---->
#<---- Cancel $a2 for #T192 ---->
sw $a2, 28($sp)
while_judge_label_4:
#<---- NEW_BLOCK <4,0> ---->
#<---- NEW_BLOCK <5,0> ---->
#<---- LOAD #T193@<5,0> = src@<0,0>[j@<3,0>] ---->
#<---- Alloc $a2 for #T193 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 16($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- #T194@<5,0> = j@<3,0> ADD 1 ---->
#<---- Alloc $t0 for #T194 ---->
addiu $t0, $a3, 1
#<---- LOAD #T195@<5,0> = src@<0,0>[#T194@<5,0>] ---->
#<---- Alloc $t1 for #T195 ---->
sll $a1, $t0, 2
lw $t1, array_src_($a1)
#<---- SET #T196@<5,0> := #T195@<5,0> < #T193@<5,0> ---->
#<---- Alloc $t2 for #T196 ---->
slt $t2, $t1, $a2
#<---- JUMP_IF #T196@<5,0> == 0 ifElse_end_label_35 ---->
#<---- Cancel $a2 for #T193 ---->
sw $a2, 40($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for #T194 ---->
sw $t0, 44($sp)
#<---- Cancel $t1 for #T195 ---->
sw $t1, 48($sp)
#<---- Cancel $t2 for #T196 ---->
sw $t2, 52($sp)
#<---- Alloc $a2 for #T196 ---->
lw $a2, 52($sp)
beq $a2, 0, ifElse_end_label_35
#<---- NEW_BLOCK <6,0> ---->
#<---- NEW_BLOCK <7,0> ---->
#<---- LOAD #T197@<7,0> = src@<0,0>[j@<3,0>] ---->
#<---- Alloc $a3 for #T197 ---->
#<---- Alloc $t0 for j ---->
lw $t0, 16($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- var i@<7,0> = #T197@<7,0> ---->
#<---- Alloc $t1 for i ---->
addiu $t1, $a3, 0
#<---- #T198@<7,0> = j@<3,0> ADD 1 ---->
#<---- Alloc $t2 for #T198 ---->
addiu $t2, $t0, 1
#<---- LOAD #T199@<7,0> = src@<0,0>[#T198@<7,0>] ---->
#<---- Alloc $t3 for #T199 ---->
sll $a1, $t2, 2
lw $t3, array_src_($a1)
#<---- SAVE src@<0,0>[j@<3,0>] = #T199@<7,0> ---->
sll $a1, $t0, 2
sw $t3, array_src_($a1)
#<---- #T200@<7,0> = j@<3,0> ADD 1 ---->
#<---- Alloc $t4 for #T200 ---->
addiu $t4, $t0, 1
#<---- SAVE src@<0,0>[#T200@<7,0>] = i@<7,0> ---->
sll $a1, $t4, 2
sw $t1, array_src_($a1)
#<---- END_BLOCK <7,0> ---->
#<---- END_BLOCK <6,0> ---->
#<---- GEN_LABEL ifElse_end_label_35: ---->
#<---- Cancel $a2 for #T196 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for #T197 ---->
sw $a3, 72($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for i ---->
sw $t1, 76($sp)
#<---- Cancel $t2 for #T198 ---->
sw $t2, 80($sp)
#<---- Cancel $t3 for #T199 ---->
sw $t3, 84($sp)
#<---- Cancel $t4 for #T200 ---->
sw $t4, 88($sp)
ifElse_end_label_35:
#<---- #T201@<5,0> = j@<3,0> ADD 1 ---->
#<---- Alloc $a2 for j ---->
lw $a2, 16($sp)
#<---- Alloc $a3 for #T201 ---->
addiu $a3, $a2, 1
#<---- ASSIGN j@<3,0> = #T201@<5,0> ---->
addiu $a2, $a3, 0
#<---- #T202@<5,0> = total@<1,9> SUB i@<1,9> ---->
#<---- Alloc $t0 for i ---->
lw $t0, 8($sp)
#<---- Alloc $t1 for total ---->
lw $t1, 4($sp)
#<---- Alloc $t2 for #T202 ---->
subu $t2, $t1, $t0
#<---- #T203@<5,0> = #T202@<5,0> SUB 1 ---->
#<---- Alloc $t3 for #T203 ---->
addiu $t3, $t2, -1
#<---- SET #T204@<5,0> := j@<3,0> < #T203@<5,0> ---->
#<---- Alloc $t4 for #T204 ---->
slt $t4, $a2, $t3
#<---- JUMP_IF #T204@<5,0> == 0 ifElse_end_label_36 ---->
#<---- Cancel $a2 for j ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for #T201 ---->
sw $a3, 56($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for total ---->
sw $t1, 4($sp)
#<---- Cancel $t2 for #T202 ---->
sw $t2, 60($sp)
#<---- Cancel $t3 for #T203 ---->
sw $t3, 64($sp)
#<---- Cancel $t4 for #T204 ---->
sw $t4, 68($sp)
#<---- Alloc $a2 for #T204 ---->
lw $a2, 68($sp)
beq $a2, 0, ifElse_end_label_36
#<---- JUMP while_judge_label_4 ---->
#<---- Cancel $a2 for #T204 ---->
sw $a2, 68($sp)
j while_judge_label_4
#<---- GEN_LABEL ifElse_end_label_36: ---->
ifElse_end_label_36:
#<---- JUMP while_end_label_4 ---->
j while_end_label_4
#<---- END_BLOCK <5,0> ---->
#<---- END_BLOCK <4,0> ---->
#<---- JUMP while_judge_label_4 ---->
j while_judge_label_4
#<---- GEN_LABEL while_end_label_4: ---->
while_end_label_4:
#<---- GEN_LABEL ifElse_end_label_34: ---->
ifElse_end_label_34:
#<---- #T205@<3,0> = i@<1,9> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for #T205 ---->
addiu $a3, $a2, 1
#<---- ASSIGN i@<1,9> = #T205@<3,0> ---->
addiu $a2, $a3, 0
#<---- SET #T206@<3,0> := i@<1,9> < total@<1,9> ---->
#<---- Alloc $t0 for #T206 ---->
#<---- Alloc $t1 for total ---->
lw $t1, 4($sp)
slt $t0, $a2, $t1
#<---- JUMP_IF #T206@<3,0> == 0 ifElse_end_label_37 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T205 ---->
sw $a3, 32($sp)
#<---- Cancel $t0 for #T206 ---->
sw $t0, 36($sp)
#<---- Cancel $t1 for total ---->
sw $t1, 4($sp)
#<---- Alloc $a2 for #T206 ---->
lw $a2, 36($sp)
beq $a2, 0, ifElse_end_label_37
#<---- JUMP while_judge_label_3 ---->
#<---- Cancel $a2 for #T206 ---->
sw $a2, 36($sp)
j while_judge_label_3
#<---- GEN_LABEL ifElse_end_label_37: ---->
ifElse_end_label_37:
#<---- JUMP while_end_label_3 ---->
j while_end_label_3
#<---- END_BLOCK <3,0> ---->
#<---- END_BLOCK <2,3> ---->
#<---- JUMP while_judge_label_3 ---->
j while_judge_label_3
#<---- GEN_LABEL while_end_label_3: ---->
while_end_label_3:
#<---- GEN_LABEL ifElse_end_label_33: ---->
ifElse_end_label_33:
#<---- END_BLOCK <1,9> ---->
jr $ra
#<--------------- FUNC shellSort--------------->
func_label_shellSort:
#<------- FORM_VAR_DEF total@<1,10> shellSort ------->
#<---- Alloc $a2 for total ---->
lw $a2, 4($sp)
#<---- #T207@<1,10> = total@<1,10> DIV 2 ---->
#<---- Alloc $a3 for #T207 ---->
addiu $v1, $zero, 2
div $a2, $v1
mflo $a3
#<---- var gap@<1,10> = #T207@<1,10> ---->
#<---- Alloc $t0 for gap ---->
addiu $t0, $a3, 0
#<---- GEN_LABEL while_judge_label_5: ---->
#<---- Cancel $a2 for total ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T207 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for gap ---->
sw $t0, 12($sp)
while_judge_label_5:
#<---- NEW_BLOCK <2,4> ---->
#<---- NEW_BLOCK <3,1> ---->
#<---- SET #T208@<3,1> := gap@<1,10> == 0 ---->
#<---- Alloc $a2 for #T208 ---->
#<---- Alloc $a3 for gap ---->
lw $a3, 12($sp)
seq $a2, $a3, 0
#<---- JUMP_IF #T208@<3,1> == 0 ifElse_end_label_38 ---->
#<---- Cancel $a2 for #T208 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for gap ---->
sw $a3, 12($sp)
#<---- Alloc $a2 for #T208 ---->
lw $a2, 16($sp)
beq $a2, 0, ifElse_end_label_38
#<---- JUMP while_end_label_5 ---->
#<---- Cancel $a2 for #T208 ---->
sw $a2, 16($sp)
j while_end_label_5
#<---- GEN_LABEL ifElse_end_label_38: ---->
ifElse_end_label_38:
#<---- var i@<3,1> = gap@<1,10> ---->
#<---- Alloc $a2 for gap ---->
lw $a2, 12($sp)
#<---- Alloc $a3 for i ---->
addiu $a3, $a2, 0
#<---- GEN_LABEL while_judge_label_6: ---->
#<---- Cancel $a2 for gap ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 20($sp)
while_judge_label_6:
#<---- NEW_BLOCK <4,1> ---->
#<---- NEW_BLOCK <5,1> ---->
#<---- SET #T209@<5,1> := total@<1,10> <= i@<3,1> ---->
#<---- Alloc $a2 for #T209 ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for i ---->
lw $t0, 20($sp)
sle $a2, $a3, $t0
#<---- JUMP_IF #T209@<5,1> == 0 ifElse_end_label_39 ---->
#<---- Cancel $a2 for #T209 ---->
sw $a2, 28($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 20($sp)
#<---- Alloc $a2 for #T209 ---->
lw $a2, 28($sp)
beq $a2, 0, ifElse_end_label_39
#<---- JUMP while_end_label_6 ---->
#<---- Cancel $a2 for #T209 ---->
sw $a2, 28($sp)
j while_end_label_6
#<---- GEN_LABEL ifElse_end_label_39: ---->
ifElse_end_label_39:
#<---- #T210@<5,1> = i@<3,1> SUB gap@<1,10> ---->
#<---- Alloc $a2 for gap ---->
lw $a2, 12($sp)
#<---- Alloc $a3 for i ---->
lw $a3, 20($sp)
#<---- Alloc $t0 for #T210 ---->
subu $t0, $a3, $a2
#<---- var j@<5,1> = #T210@<5,1> ---->
#<---- Alloc $t1 for j ---->
addiu $t1, $t0, 0
#<---- GEN_LABEL while_judge_label_7: ---->
#<---- Cancel $a2 for gap ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 20($sp)
#<---- Cancel $t0 for #T210 ---->
sw $t0, 32($sp)
#<---- Cancel $t1 for j ---->
sw $t1, 36($sp)
while_judge_label_7:
#<---- NEW_BLOCK <6,1> ---->
#<---- NEW_BLOCK <7,1> ---->
#<---- SET #T211@<7,1> := j@<5,1> < 0 ---->
#<---- Alloc $a2 for #T211 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 36($sp)
slti $a2, $a3, 0
#<---- JUMP_IF #T211@<7,1> == 1 or_label_0 ---->
#<---- Cancel $a2 for #T211 ---->
sw $a2, 44($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 36($sp)
#<---- Alloc $a2 for #T211 ---->
lw $a2, 44($sp)
beq $a2, 1, or_label_0
#<---- LOAD #T212@<7,1> = src@<0,0>[j@<5,1>] ---->
#<---- Alloc $a3 for #T212 ---->
#<---- Alloc $t0 for j ---->
lw $t0, 36($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- #T213@<7,1> = j@<5,1> ADD gap@<1,10> ---->
#<---- Alloc $t1 for gap ---->
lw $t1, 12($sp)
#<---- Alloc $t2 for #T213 ---->
addu $t2, $t0, $t1
#<---- LOAD #T214@<7,1> = src@<0,0>[#T213@<7,1>] ---->
#<---- Alloc $t3 for #T214 ---->
sll $a1, $t2, 2
lw $t3, array_src_($a1)
#<---- SET #T215@<7,1> := #T212@<7,1> <= #T214@<7,1> ---->
#<---- Alloc $t4 for #T215 ---->
sle $t4, $a3, $t3
#<---- JUMP_IF #T215@<7,1> == 0 ifElse_end_label_40 ---->
#<---- Cancel $a2 for #T211 ---->
sw $a2, 44($sp)
#<---- Cancel $a3 for #T212 ---->
sw $a3, 48($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 36($sp)
#<---- Cancel $t1 for gap ---->
sw $t1, 12($sp)
#<---- Cancel $t2 for #T213 ---->
sw $t2, 52($sp)
#<---- Cancel $t3 for #T214 ---->
sw $t3, 56($sp)
#<---- Cancel $t4 for #T215 ---->
sw $t4, 60($sp)
#<---- Alloc $a2 for #T215 ---->
lw $a2, 60($sp)
beq $a2, 0, ifElse_end_label_40
#<---- GEN_LABEL or_label_0: ---->
#<---- Cancel $a2 for #T215 ---->
sw $a2, 60($sp)
or_label_0:
#<---- JUMP while_end_label_7 ---->
j while_end_label_7
#<---- GEN_LABEL ifElse_end_label_40: ---->
ifElse_end_label_40:
#<---- LOAD #T216@<7,1> = src@<0,0>[j@<5,1>] ---->
#<---- Alloc $a2 for #T216 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 36($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- var i@<7,1> = #T216@<7,1> ---->
#<---- Alloc $t0 for i ---->
addiu $t0, $a2, 0
#<---- #T217@<7,1> = j@<5,1> ADD gap@<1,10> ---->
#<---- Alloc $t1 for gap ---->
lw $t1, 12($sp)
#<---- Alloc $t2 for #T217 ---->
addu $t2, $a3, $t1
#<---- LOAD #T218@<7,1> = src@<0,0>[#T217@<7,1>] ---->
#<---- Alloc $t3 for #T218 ---->
sll $a1, $t2, 2
lw $t3, array_src_($a1)
#<---- SAVE src@<0,0>[j@<5,1>] = #T218@<7,1> ---->
sll $a1, $a3, 2
sw $t3, array_src_($a1)
#<---- #T219@<7,1> = j@<5,1> ADD gap@<1,10> ---->
#<---- Alloc $t4 for #T219 ---->
addu $t4, $a3, $t1
#<---- SAVE src@<0,0>[#T219@<7,1>] = i@<7,1> ---->
sll $a1, $t4, 2
sw $t0, array_src_($a1)
#<---- #T220@<7,1> = j@<5,1> SUB gap@<1,10> ---->
#<---- Alloc $t5 for #T220 ---->
subu $t5, $a3, $t1
#<---- ASSIGN j@<5,1> = #T220@<7,1> ---->
addiu $a3, $t5, 0
#<---- END_BLOCK <7,1> ---->
#<---- END_BLOCK <6,1> ---->
#<---- JUMP while_judge_label_7 ---->
#<---- Cancel $a2 for #T216 ---->
sw $a2, 64($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 36($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 68($sp)
#<---- Cancel $t1 for gap ---->
sw $t1, 12($sp)
#<---- Cancel $t2 for #T217 ---->
sw $t2, 72($sp)
#<---- Cancel $t3 for #T218 ---->
sw $t3, 76($sp)
#<---- Cancel $t4 for #T219 ---->
sw $t4, 80($sp)
#<---- Cancel $t5 for #T220 ---->
sw $t5, 84($sp)
j while_judge_label_7
#<---- GEN_LABEL while_end_label_7: ---->
while_end_label_7:
#<---- #T221@<5,1> = i@<3,1> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 20($sp)
#<---- Alloc $a3 for #T221 ---->
addiu $a3, $a2, 1
#<---- ASSIGN i@<3,1> = #T221@<5,1> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <5,1> ---->
#<---- END_BLOCK <4,1> ---->
#<---- JUMP while_judge_label_6 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for #T221 ---->
sw $a3, 40($sp)
j while_judge_label_6
#<---- GEN_LABEL while_end_label_6: ---->
while_end_label_6:
#<---- #T222@<3,1> = gap@<1,10> DIV 2 ---->
#<---- Alloc $a2 for gap ---->
lw $a2, 12($sp)
#<---- Alloc $a3 for #T222 ---->
addiu $v1, $zero, 2
div $a2, $v1
mflo $a3
#<---- ASSIGN gap@<1,10> = #T222@<3,1> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <3,1> ---->
#<---- END_BLOCK <2,4> ---->
#<---- JUMP while_judge_label_5 ---->
#<---- Cancel $a2 for gap ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T222 ---->
sw $a3, 24($sp)
j while_judge_label_5
#<---- GEN_LABEL while_end_label_5: ---->
while_end_label_5:
#<---- END_BLOCK <1,10> ---->
jr $ra
#<--------------- FUNC merge--------------->
func_label_merge:
#<------- FORM_VAR_DEF l@<1,11> merge ------->
#<---- Alloc $a2 for l ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF mid@<1,11> merge ------->
#<---- Alloc $a3 for mid ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF r@<1,11> merge ------->
#<---- Alloc $t0 for r ---->
lw $t0, 12($sp)
#<---- var k@<1,11> = l@<1,11> ---->
#<---- Alloc $t1 for k ---->
addiu $t1, $a2, 0
#<---- #T223@<1,11> = mid@<1,11> ADD 1 ---->
#<---- Alloc $t2 for #T223 ---->
addiu $t2, $a3, 1
#<---- var j@<1,11> = #T223@<1,11> ---->
#<---- Alloc $t3 for j ---->
addiu $t3, $t2, 0
#<---- var i@<1,11> = l@<1,11> ---->
#<---- Alloc $t4 for i ---->
addiu $t4, $a2, 0
#<---- GEN_LABEL while_judge_label_8: ---->
#<---- Cancel $a2 for l ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for mid ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for r ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T223 ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for j ---->
sw $t3, 24($sp)
#<---- Cancel $t4 for i ---->
sw $t4, 28($sp)
while_judge_label_8:
#<---- SET #T224@<1,11> := i@<1,11> <= r@<1,11> ---->
#<---- Alloc $a2 for #T224 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 28($sp)
#<---- Alloc $t0 for r ---->
lw $t0, 12($sp)
sle $a2, $a3, $t0
#<---- JUMP_IF #T224@<1,11> == 0 while_end_label_8 ---->
#<---- Cancel $a2 for #T224 ---->
sw $a2, 32($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 28($sp)
#<---- Cancel $t0 for r ---->
sw $t0, 12($sp)
#<---- Alloc $a2 for #T224 ---->
lw $a2, 32($sp)
beq $a2, 0, while_end_label_8
#<---- NEW_BLOCK <2,5> ---->
#<---- NEW_BLOCK <3,2> ---->
#<---- END_BLOCK <3,2> ---->
#<---- LOAD #T225@<2,5> = src@<0,0>[i@<1,11>] ---->
#<---- Alloc $a3 for #T225 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 28($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- SAVE buf@<0,0>[i@<1,11>] = #T225@<2,5> ---->
sll $a1, $t0, 2
sw $a3, array_buf_($a1)
#<---- #T226@<2,5> = i@<1,11> ADD 1 ---->
#<---- Alloc $t1 for #T226 ---->
addiu $t1, $t0, 1
#<---- ASSIGN i@<1,11> = #T226@<2,5> ---->
addiu $t0, $t1, 0
#<---- NEW_BLOCK <3,3> ---->
#<---- END_BLOCK <3,3> ---->
#<---- END_BLOCK <2,5> ---->
#<---- JUMP while_judge_label_8 ---->
#<---- Cancel $a2 for #T224 ---->
sw $a2, 32($sp)
#<---- Cancel $a3 for #T225 ---->
sw $a3, 44($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 28($sp)
#<---- Cancel $t1 for #T226 ---->
sw $t1, 48($sp)
j while_judge_label_8
#<---- GEN_LABEL while_end_label_8: ---->
while_end_label_8:
#<---- ASSIGN i@<1,11> = l@<1,11> ---->
#<---- Alloc $a2 for l ---->
lw $a2, 4($sp)
#<---- Alloc $a3 for i ---->
addiu $a3, $a2, 0
#<---- GEN_LABEL while_judge_label_9: ---->
#<---- Cancel $a2 for l ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 28($sp)
while_judge_label_9:
#<---- SET #T227@<1,11> := i@<1,11> <= mid@<1,11> ---->
#<---- Alloc $a2 for #T227 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 28($sp)
#<---- Alloc $t0 for mid ---->
lw $t0, 8($sp)
sle $a2, $a3, $t0
#<---- JUMP_IF #T227@<1,11> == 1 or_label_1 ---->
#<---- Cancel $a2 for #T227 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 28($sp)
#<---- Cancel $t0 for mid ---->
sw $t0, 8($sp)
#<---- Alloc $a2 for #T227 ---->
lw $a2, 36($sp)
beq $a2, 1, or_label_1
#<---- SET #T228@<1,11> := j@<1,11> <= r@<1,11> ---->
#<---- Alloc $a3 for #T228 ---->
#<---- Alloc $t0 for j ---->
lw $t0, 24($sp)
#<---- Alloc $t1 for r ---->
lw $t1, 12($sp)
sle $a3, $t0, $t1
#<---- JUMP_IF #T228@<1,11> == 0 while_end_label_9 ---->
#<---- Cancel $a2 for #T227 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for #T228 ---->
sw $a3, 40($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for r ---->
sw $t1, 12($sp)
#<---- Alloc $a2 for #T228 ---->
lw $a2, 40($sp)
beq $a2, 0, while_end_label_9
#<---- GEN_LABEL or_label_1: ---->
#<---- Cancel $a2 for #T228 ---->
sw $a2, 40($sp)
or_label_1:
#<---- NEW_BLOCK <2,6> ---->
#<---- NEW_BLOCK <3,4> ---->
#<---- END_BLOCK <3,4> ---->
#<---- SET #T229@<2,6> := mid@<1,11> < i@<1,11> ---->
#<---- Alloc $a2 for #T229 ---->
#<---- Alloc $a3 for mid ---->
lw $a3, 8($sp)
#<---- Alloc $t0 for i ---->
lw $t0, 28($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T229@<2,6> == 0 Else_start_label_26 ---->
#<---- Cancel $a2 for #T229 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for mid ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 28($sp)
#<---- Alloc $a2 for #T229 ---->
lw $a2, 52($sp)
beq $a2, 0, Else_start_label_26
#<---- NEW_BLOCK <3,5> ---->
#<---- NEW_BLOCK <4,2> ---->
#<---- END_BLOCK <4,2> ---->
#<---- LOAD #T230@<3,5> = buf@<0,0>[j@<1,11>] ---->
#<---- Alloc $a3 for #T230 ---->
#<---- Alloc $t0 for j ---->
lw $t0, 24($sp)
sll $a1, $t0, 2
lw $a3, array_buf_($a1)
#<---- SAVE src@<0,0>[k@<1,11>] = #T230@<3,5> ---->
#<---- Alloc $t1 for k ---->
lw $t1, 16($sp)
sll $a1, $t1, 2
sw $a3, array_src_($a1)
#<---- #T231@<3,5> = j@<1,11> ADD 1 ---->
#<---- Alloc $t2 for #T231 ---->
addiu $t2, $t0, 1
#<---- ASSIGN j@<1,11> = #T231@<3,5> ---->
addiu $t0, $t2, 0
#<---- NEW_BLOCK <4,3> ---->
#<---- END_BLOCK <4,3> ---->
#<---- END_BLOCK <3,5> ---->
#<---- JUMP ifElse_end_label_41 ---->
#<---- Cancel $a2 for #T229 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for #T230 ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T231 ---->
sw $t2, 80($sp)
j ifElse_end_label_41
#<---- GEN_LABEL Else_start_label_26: ---->
Else_start_label_26:
#<---- SET #T232@<2,6> := r@<1,11> < j@<1,11> ---->
#<---- Alloc $a2 for #T232 ---->
#<---- Alloc $a3 for r ---->
lw $a3, 12($sp)
#<---- Alloc $t0 for j ---->
lw $t0, 24($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T232@<2,6> == 0 Else_start_label_27 ---->
#<---- Cancel $a2 for #T232 ---->
sw $a2, 56($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 24($sp)
#<---- Alloc $a2 for #T232 ---->
lw $a2, 56($sp)
beq $a2, 0, Else_start_label_27
#<---- NEW_BLOCK <3,6> ---->
#<---- NEW_BLOCK <4,4> ---->
#<---- END_BLOCK <4,4> ---->
#<---- LOAD #T233@<3,6> = buf@<0,0>[i@<1,11>] ---->
#<---- Alloc $a3 for #T233 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 28($sp)
sll $a1, $t0, 2
lw $a3, array_buf_($a1)
#<---- SAVE src@<0,0>[k@<1,11>] = #T233@<3,6> ---->
#<---- Alloc $t1 for k ---->
lw $t1, 16($sp)
sll $a1, $t1, 2
sw $a3, array_src_($a1)
#<---- #T234@<3,6> = i@<1,11> ADD 1 ---->
#<---- Alloc $t2 for #T234 ---->
addiu $t2, $t0, 1
#<---- ASSIGN i@<1,11> = #T234@<3,6> ---->
addiu $t0, $t2, 0
#<---- NEW_BLOCK <4,5> ---->
#<---- END_BLOCK <4,5> ---->
#<---- END_BLOCK <3,6> ---->
#<---- JUMP ifElse_end_label_42 ---->
#<---- Cancel $a2 for #T232 ---->
sw $a2, 56($sp)
#<---- Cancel $a3 for #T233 ---->
sw $a3, 84($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 28($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T234 ---->
sw $t2, 88($sp)
j ifElse_end_label_42
#<---- GEN_LABEL Else_start_label_27: ---->
Else_start_label_27:
#<---- LOAD #T235@<2,6> = buf@<0,0>[i@<1,11>] ---->
#<---- Alloc $a2 for #T235 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 28($sp)
sll $a1, $a3, 2
lw $a2, array_buf_($a1)
#<---- LOAD #T236@<2,6> = buf@<0,0>[j@<1,11>] ---->
#<---- Alloc $t0 for #T236 ---->
#<---- Alloc $t1 for j ---->
lw $t1, 24($sp)
sll $a1, $t1, 2
lw $t0, array_buf_($a1)
#<---- SET #T237@<2,6> := #T236@<2,6> < #T235@<2,6> ---->
#<---- Alloc $t2 for #T237 ---->
slt $t2, $t0, $a2
#<---- JUMP_IF #T237@<2,6> == 0 Else_start_label_28 ---->
#<---- Cancel $a2 for #T235 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 28($sp)
#<---- Cancel $t0 for #T236 ---->
sw $t0, 64($sp)
#<---- Cancel $t1 for j ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T237 ---->
sw $t2, 68($sp)
#<---- Alloc $a2 for #T237 ---->
lw $a2, 68($sp)
beq $a2, 0, Else_start_label_28
#<---- NEW_BLOCK <3,7> ---->
#<---- NEW_BLOCK <4,6> ---->
#<---- END_BLOCK <4,6> ---->
#<---- LOAD #T238@<3,7> = buf@<0,0>[j@<1,11>] ---->
#<---- Alloc $a3 for #T238 ---->
#<---- Alloc $t0 for j ---->
lw $t0, 24($sp)
sll $a1, $t0, 2
lw $a3, array_buf_($a1)
#<---- SAVE src@<0,0>[k@<1,11>] = #T238@<3,7> ---->
#<---- Alloc $t1 for k ---->
lw $t1, 16($sp)
sll $a1, $t1, 2
sw $a3, array_src_($a1)
#<---- #T239@<3,7> = j@<1,11> ADD 1 ---->
#<---- Alloc $t2 for #T239 ---->
addiu $t2, $t0, 1
#<---- ASSIGN j@<1,11> = #T239@<3,7> ---->
addiu $t0, $t2, 0
#<---- NEW_BLOCK <4,7> ---->
#<---- END_BLOCK <4,7> ---->
#<---- END_BLOCK <3,7> ---->
#<---- JUMP ifElse_end_label_43 ---->
#<---- Cancel $a2 for #T237 ---->
sw $a2, 68($sp)
#<---- Cancel $a3 for #T238 ---->
sw $a3, 92($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T239 ---->
sw $t2, 96($sp)
j ifElse_end_label_43
#<---- GEN_LABEL Else_start_label_28: ---->
Else_start_label_28:
#<---- NEW_BLOCK <3,8> ---->
#<---- NEW_BLOCK <4,8> ---->
#<---- END_BLOCK <4,8> ---->
#<---- LOAD #T240@<3,8> = buf@<0,0>[i@<1,11>] ---->
#<---- Alloc $a2 for #T240 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 28($sp)
sll $a1, $a3, 2
lw $a2, array_buf_($a1)
#<---- SAVE src@<0,0>[k@<1,11>] = #T240@<3,8> ---->
#<---- Alloc $t0 for k ---->
lw $t0, 16($sp)
sll $a1, $t0, 2
sw $a2, array_src_($a1)
#<---- #T241@<3,8> = i@<1,11> ADD 1 ---->
#<---- Alloc $t1 for #T241 ---->
addiu $t1, $a3, 1
#<---- ASSIGN i@<1,11> = #T241@<3,8> ---->
addiu $a3, $t1, 0
#<---- NEW_BLOCK <4,9> ---->
#<---- END_BLOCK <4,9> ---->
#<---- END_BLOCK <3,8> ---->
#<---- GEN_LABEL ifElse_end_label_43: ---->
#<---- Cancel $a2 for #T240 ---->
sw $a2, 100($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 28($sp)
#<---- Cancel $t0 for k ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for #T241 ---->
sw $t1, 104($sp)
ifElse_end_label_43:
#<---- GEN_LABEL ifElse_end_label_42: ---->
ifElse_end_label_42:
#<---- GEN_LABEL ifElse_end_label_41: ---->
ifElse_end_label_41:
#<---- #T242@<2,6> = k@<1,11> ADD 1 ---->
#<---- Alloc $a2 for k ---->
lw $a2, 16($sp)
#<---- Alloc $a3 for #T242 ---->
addiu $a3, $a2, 1
#<---- ASSIGN k@<1,11> = #T242@<2,6> ---->
addiu $a2, $a3, 0
#<---- NEW_BLOCK <3,9> ---->
#<---- END_BLOCK <3,9> ---->
#<---- END_BLOCK <2,6> ---->
#<---- JUMP while_judge_label_9 ---->
#<---- Cancel $a2 for k ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for #T242 ---->
sw $a3, 72($sp)
j while_judge_label_9
#<---- GEN_LABEL while_end_label_9: ---->
while_end_label_9:
#<---- END_BLOCK <1,11> ---->
jr $ra
#<--------------- FUNC mergeSort--------------->
func_label_mergeSort:
#<------- FORM_VAR_DEF l@<1,12> mergeSort ------->
#<---- Alloc $a2 for l ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF r@<1,12> mergeSort ------->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
#<---- SET #T243@<1,12> := r@<1,12> <= l@<1,12> ---->
#<---- Alloc $t0 for #T243 ---->
sle $t0, $a3, $a2
#<---- JUMP_IF #T243@<1,12> == 0 ifElse_end_label_44 ---->
#<---- Cancel $a2 for l ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T243 ---->
sw $t0, 12($sp)
#<---- Alloc $a2 for #T243 ---->
lw $a2, 12($sp)
beq $a2, 0, ifElse_end_label_44
#<---- return  ---->
jr $ra
#<---- GEN_LABEL ifElse_end_label_44: ---->
#<---- Cancel $a2 for #T243 ---->
sw $a2, 12($sp)
ifElse_end_label_44:
#<---- #T244@<1,12> = l@<1,12> ADD r@<1,12> ---->
#<---- Alloc $a2 for r ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for l ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T244 ---->
addu $t0, $a3, $a2
#<---- #T245@<1,12> = #T244@<1,12> DIV 2 ---->
#<---- Alloc $t1 for #T245 ---->
addiu $v1, $zero, 2
div $t0, $v1
mflo $t1
#<---- var mid@<1,12> = #T245@<1,12> ---->
#<---- Alloc $t2 for mid ---->
addiu $t2, $t1, 0
#<---- PRE_CALL mergeSort@31 ---->
#<---- PUSH_PARA mid@<1,12> #function: mergeSort@31 #arg: r ---->
sw $t2, -36($sp)
#<---- PUSH_PARA l@<1,12> #function: mergeSort@31 #arg: l ---->
sw $a3, -40($sp)
#<---- FUNC_CALL mergeSort@31 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for r ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T244 ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for #T245 ---->
sw $t1, 20($sp)
#<---- Cancel $t2 for mid ---->
sw $t2, 24($sp)
addiu $sp, $sp, -44
jal func_label_mergeSort
addiu $sp, $sp, 44
lw $ra, 0($sp)
#<---- ASSIGN #T246@<1,12> = %RTX ---->
#<---- Alloc $a2 for #T246 ---->
move $a2, $v0
#<---- PRE_CALL mergeSort@32 ---->
#<---- PUSH_PARA r@<1,12> #function: mergeSort@32 #arg: r ---->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
sw $a3, -36($sp)
#<---- #T247@<1,12> = mid@<1,12> ADD 1 ---->
#<---- Alloc $t0 for mid ---->
lw $t0, 24($sp)
#<---- Alloc $t1 for #T247 ---->
addiu $t1, $t0, 1
#<---- PUSH_PARA #T247@<1,12> #function: mergeSort@32 #arg: l ---->
sw $t1, -40($sp)
#<---- FUNC_CALL mergeSort@32 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T246 ---->
sw $a2, 28($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for mid ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for #T247 ---->
sw $t1, 32($sp)
addiu $sp, $sp, -44
jal func_label_mergeSort
addiu $sp, $sp, 44
lw $ra, 0($sp)
#<---- ASSIGN #T248@<1,12> = %RTX ---->
#<---- Alloc $a2 for #T248 ---->
move $a2, $v0
#<---- PRE_CALL merge@33 ---->
#<---- PUSH_PARA r@<1,12> #function: merge@33 #arg: r ---->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
sw $a3, -96($sp)
#<---- PUSH_PARA mid@<1,12> #function: merge@33 #arg: mid ---->
#<---- Alloc $t0 for mid ---->
lw $t0, 24($sp)
sw $t0, -100($sp)
#<---- PUSH_PARA l@<1,12> #function: merge@33 #arg: l ---->
#<---- Alloc $t1 for l ---->
lw $t1, 4($sp)
sw $t1, -104($sp)
#<---- FUNC_CALL merge@33 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T248 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for mid ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for l ---->
sw $t1, 4($sp)
addiu $sp, $sp, -108
jal func_label_merge
addiu $sp, $sp, 108
lw $ra, 0($sp)
#<---- ASSIGN #T249@<1,12> = %RTX ---->
#<---- Alloc $a2 for #T249 ---->
move $a2, $v0
#<---- END_BLOCK <1,12> ---->
jr $ra
#<--------------- FUNC quickSort--------------->
func_label_quickSort:
#<------- FORM_VAR_DEF l@<1,13> quickSort ------->
#<---- Alloc $a2 for l ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF r@<1,13> quickSort ------->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
#<---- SET #T250@<1,13> := r@<1,13> < l@<1,13> ---->
#<---- Alloc $t0 for #T250 ---->
slt $t0, $a3, $a2
#<---- JUMP_IF #T250@<1,13> == 0 ifElse_end_label_45 ---->
#<---- Cancel $a2 for l ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T250 ---->
sw $t0, 12($sp)
#<---- Alloc $a2 for #T250 ---->
lw $a2, 12($sp)
beq $a2, 0, ifElse_end_label_45
#<---- return  ---->
jr $ra
#<---- GEN_LABEL ifElse_end_label_45: ---->
#<---- Cancel $a2 for #T250 ---->
sw $a2, 12($sp)
ifElse_end_label_45:
#<---- #T251@<1,13> = l@<1,13> ADD r@<1,13> ---->
#<---- Alloc $a2 for r ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for l ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T251 ---->
addu $t0, $a3, $a2
#<---- #T252@<1,13> = #T251@<1,13> DIV 2 ---->
#<---- Alloc $t1 for #T252 ---->
addiu $v1, $zero, 2
div $t0, $v1
mflo $t1
#<---- var mid@<1,13> = #T252@<1,13> ---->
#<---- Alloc $t2 for mid ---->
addiu $t2, $t1, 0
#<---- LOAD #T253@<1,13> = src@<0,0>[l@<1,13>] ---->
#<---- Alloc $t3 for #T253 ---->
sll $a1, $a3, 2
lw $t3, array_src_($a1)
#<---- LOAD #T254@<1,13> = src@<0,0>[r@<1,13>] ---->
#<---- Alloc $t4 for #T254 ---->
sll $a1, $a2, 2
lw $t4, array_src_($a1)
#<---- SET #T255@<1,13> := #T254@<1,13> < #T253@<1,13> ---->
#<---- Alloc $t5 for #T255 ---->
slt $t5, $t4, $t3
#<---- JUMP_IF #T255@<1,13> == 0 ifElse_end_label_46 ---->
#<---- Cancel $a2 for r ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T251 ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for #T252 ---->
sw $t1, 20($sp)
#<---- Cancel $t2 for mid ---->
sw $t2, 24($sp)
#<---- Cancel $t3 for #T253 ---->
sw $t3, 28($sp)
#<---- Cancel $t4 for #T254 ---->
sw $t4, 32($sp)
#<---- Cancel $t5 for #T255 ---->
sw $t5, 36($sp)
#<---- Alloc $a2 for #T255 ---->
lw $a2, 36($sp)
beq $a2, 0, ifElse_end_label_46
#<---- NEW_BLOCK <2,7> ---->
#<---- NEW_BLOCK <3,10> ---->
#<---- END_BLOCK <3,10> ---->
#<---- LOAD #T256@<2,7> = src@<0,0>[l@<1,13>] ---->
#<---- Alloc $a3 for #T256 ---->
#<---- Alloc $t0 for l ---->
lw $t0, 4($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- var k@<2,7> = #T256@<2,7> ---->
#<---- Alloc $t1 for k ---->
addiu $t1, $a3, 0
#<---- LOAD #T257@<2,7> = src@<0,0>[r@<1,13>] ---->
#<---- Alloc $t2 for #T257 ---->
#<---- Alloc $t3 for r ---->
lw $t3, 8($sp)
sll $a1, $t3, 2
lw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[l@<1,13>] = #T257@<2,7> ---->
sll $a1, $t0, 2
sw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[r@<1,13>] = k@<2,7> ---->
sll $a1, $t3, 2
sw $t1, array_src_($a1)
#<---- NEW_BLOCK <3,11> ---->
#<---- END_BLOCK <3,11> ---->
#<---- END_BLOCK <2,7> ---->
#<---- GEN_LABEL ifElse_end_label_46: ---->
#<---- Cancel $a2 for #T255 ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for #T256 ---->
sw $a3, 128($sp)
#<---- Cancel $t0 for l ---->
sw $t0, 4($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 132($sp)
#<---- Cancel $t2 for #T257 ---->
sw $t2, 136($sp)
#<---- Cancel $t3 for r ---->
sw $t3, 8($sp)
ifElse_end_label_46:
#<---- LOAD #T258@<1,13> = src@<0,0>[r@<1,13>] ---->
#<---- Alloc $a2 for #T258 ---->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- LOAD #T259@<1,13> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t0 for #T259 ---->
#<---- Alloc $t1 for mid ---->
lw $t1, 24($sp)
sll $a1, $t1, 2
lw $t0, array_src_($a1)
#<---- SET #T260@<1,13> := #T258@<1,13> < #T259@<1,13> ---->
#<---- Alloc $t2 for #T260 ---->
slt $t2, $a2, $t0
#<---- JUMP_IF #T260@<1,13> == 0 ifElse_end_label_47 ---->
#<---- Cancel $a2 for #T258 ---->
sw $a2, 40($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T259 ---->
sw $t0, 44($sp)
#<---- Cancel $t1 for mid ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T260 ---->
sw $t2, 48($sp)
#<---- Alloc $a2 for #T260 ---->
lw $a2, 48($sp)
beq $a2, 0, ifElse_end_label_47
#<---- NEW_BLOCK <2,8> ---->
#<---- NEW_BLOCK <3,12> ---->
#<---- END_BLOCK <3,12> ---->
#<---- LOAD #T261@<2,8> = src@<0,0>[r@<1,13>] ---->
#<---- Alloc $a3 for #T261 ---->
#<---- Alloc $t0 for r ---->
lw $t0, 8($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- var k@<2,8> = #T261@<2,8> ---->
#<---- Alloc $t1 for k ---->
addiu $t1, $a3, 0
#<---- LOAD #T262@<2,8> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t2 for #T262 ---->
#<---- Alloc $t3 for mid ---->
lw $t3, 24($sp)
sll $a1, $t3, 2
lw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[l@<1,13>] = #T262@<2,8> ---->
#<---- Alloc $t4 for l ---->
lw $t4, 4($sp)
sll $a1, $t4, 2
sw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[mid@<1,13>] = k@<2,8> ---->
sll $a1, $t3, 2
sw $t1, array_src_($a1)
#<---- NEW_BLOCK <3,13> ---->
#<---- END_BLOCK <3,13> ---->
#<---- END_BLOCK <2,8> ---->
#<---- GEN_LABEL ifElse_end_label_47: ---->
#<---- Cancel $a2 for #T260 ---->
sw $a2, 48($sp)
#<---- Cancel $a3 for #T261 ---->
sw $a3, 140($sp)
#<---- Cancel $t0 for r ---->
sw $t0, 8($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 144($sp)
#<---- Cancel $t2 for #T262 ---->
sw $t2, 148($sp)
#<---- Cancel $t3 for mid ---->
sw $t3, 24($sp)
#<---- Cancel $t4 for l ---->
sw $t4, 4($sp)
ifElse_end_label_47:
#<---- LOAD #T263@<1,13> = src@<0,0>[l@<1,13>] ---->
#<---- Alloc $a2 for #T263 ---->
#<---- Alloc $a3 for l ---->
lw $a3, 4($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- LOAD #T264@<1,13> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t0 for #T264 ---->
#<---- Alloc $t1 for mid ---->
lw $t1, 24($sp)
sll $a1, $t1, 2
lw $t0, array_src_($a1)
#<---- SET #T265@<1,13> := #T263@<1,13> < #T264@<1,13> ---->
#<---- Alloc $t2 for #T265 ---->
slt $t2, $a2, $t0
#<---- JUMP_IF #T265@<1,13> == 0 ifElse_end_label_48 ---->
#<---- Cancel $a2 for #T263 ---->
sw $a2, 52($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T264 ---->
sw $t0, 56($sp)
#<---- Cancel $t1 for mid ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T265 ---->
sw $t2, 60($sp)
#<---- Alloc $a2 for #T265 ---->
lw $a2, 60($sp)
beq $a2, 0, ifElse_end_label_48
#<---- NEW_BLOCK <2,9> ---->
#<---- NEW_BLOCK <3,14> ---->
#<---- END_BLOCK <3,14> ---->
#<---- LOAD #T266@<2,9> = src@<0,0>[l@<1,13>] ---->
#<---- Alloc $a3 for #T266 ---->
#<---- Alloc $t0 for l ---->
lw $t0, 4($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- var k@<2,9> = #T266@<2,9> ---->
#<---- Alloc $t1 for k ---->
addiu $t1, $a3, 0
#<---- LOAD #T267@<2,9> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t2 for #T267 ---->
#<---- Alloc $t3 for mid ---->
lw $t3, 24($sp)
sll $a1, $t3, 2
lw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[l@<1,13>] = #T267@<2,9> ---->
sll $a1, $t0, 2
sw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[mid@<1,13>] = k@<2,9> ---->
sll $a1, $t3, 2
sw $t1, array_src_($a1)
#<---- NEW_BLOCK <3,15> ---->
#<---- END_BLOCK <3,15> ---->
#<---- END_BLOCK <2,9> ---->
#<---- GEN_LABEL ifElse_end_label_48: ---->
#<---- Cancel $a2 for #T265 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for #T266 ---->
sw $a3, 152($sp)
#<---- Cancel $t0 for l ---->
sw $t0, 4($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 156($sp)
#<---- Cancel $t2 for #T267 ---->
sw $t2, 160($sp)
#<---- Cancel $t3 for mid ---->
sw $t3, 24($sp)
ifElse_end_label_48:
#<---- LOAD #T268@<1,13> = src@<0,0>[l@<1,13>] ---->
#<---- Alloc $a2 for #T268 ---->
#<---- Alloc $a3 for l ---->
lw $a3, 4($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- var tmp@<1,13> = #T268@<1,13> ---->
#<---- Alloc $t0 for tmp ---->
addiu $t0, $a2, 0
#<---- var j@<1,13> = r@<1,13> ---->
#<---- Alloc $t1 for r ---->
lw $t1, 8($sp)
#<---- Alloc $t2 for j ---->
addiu $t2, $t1, 0
#<---- var i@<1,13> = l@<1,13> ---->
#<---- Alloc $t3 for i ---->
addiu $t3, $a3, 0
#<---- GEN_LABEL while_judge_label_10: ---->
#<---- Cancel $a2 for #T268 ---->
sw $a2, 64($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for tmp ---->
sw $t0, 68($sp)
#<---- Cancel $t1 for r ---->
sw $t1, 8($sp)
#<---- Cancel $t2 for j ---->
sw $t2, 72($sp)
#<---- Cancel $t3 for i ---->
sw $t3, 76($sp)
while_judge_label_10:
#<---- SET #T269@<1,13> := i@<1,13> != j@<1,13> ---->
#<---- Alloc $a2 for #T269 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
#<---- Alloc $t0 for j ---->
lw $t0, 72($sp)
sne $a2, $a3, $t0
#<---- JUMP_IF #T269@<1,13> == 0 while_end_label_10 ---->
#<---- Cancel $a2 for #T269 ---->
sw $a2, 80($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 72($sp)
#<---- Alloc $a2 for #T269 ---->
lw $a2, 80($sp)
beq $a2, 0, while_end_label_10
#<---- NEW_BLOCK <2,10> ---->
#<---- NEW_BLOCK <3,16> ---->
#<---- END_BLOCK <3,16> ---->
#<---- GEN_LABEL while_judge_label_11: ---->
#<---- Cancel $a2 for #T269 ---->
sw $a2, 80($sp)
while_judge_label_11:
#<---- LOAD #T270@<2,10> = src@<0,0>[j@<1,13>] ---->
#<---- Alloc $a2 for #T270 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 72($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- SET #T271@<2,10> := tmp@<1,13> <= #T270@<2,10> ---->
#<---- Alloc $t0 for #T271 ---->
#<---- Alloc $t1 for tmp ---->
lw $t1, 68($sp)
sle $t0, $t1, $a2
#<---- JUMP_IF #T271@<2,10> == 0 while_end_label_11 ---->
#<---- Cancel $a2 for #T270 ---->
sw $a2, 164($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 72($sp)
#<---- Cancel $t0 for #T271 ---->
sw $t0, 168($sp)
#<---- Cancel $t1 for tmp ---->
sw $t1, 68($sp)
#<---- Alloc $a2 for #T271 ---->
lw $a2, 168($sp)
beq $a2, 0, while_end_label_11
#<---- SET #T272@<2,10> := i@<1,13> < j@<1,13> ---->
#<---- Alloc $a3 for #T272 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 76($sp)
#<---- Alloc $t1 for j ---->
lw $t1, 72($sp)
slt $a3, $t0, $t1
#<---- JUMP_IF #T272@<2,10> == 0 while_end_label_11 ---->
#<---- Cancel $a2 for #T271 ---->
sw $a2, 168($sp)
#<---- Cancel $a3 for #T272 ---->
sw $a3, 172($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 76($sp)
#<---- Cancel $t1 for j ---->
sw $t1, 72($sp)
#<---- Alloc $a2 for #T272 ---->
lw $a2, 172($sp)
beq $a2, 0, while_end_label_11
#<---- #T273@<2,10> = j@<1,13> SUB 1 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 72($sp)
#<---- Alloc $t0 for #T273 ---->
addiu $t0, $a3, -1
#<---- ASSIGN j@<1,13> = #T273@<2,10> ---->
addiu $a3, $t0, 0
#<---- JUMP while_judge_label_11 ---->
#<---- Cancel $a2 for #T272 ---->
sw $a2, 172($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 72($sp)
#<---- Cancel $t0 for #T273 ---->
sw $t0, 176($sp)
j while_judge_label_11
#<---- GEN_LABEL while_end_label_11: ---->
while_end_label_11:
#<---- GEN_LABEL while_judge_label_12: ---->
while_judge_label_12:
#<---- LOAD #T274@<2,10> = src@<0,0>[i@<1,13>] ---->
#<---- Alloc $a2 for #T274 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- SET #T275@<2,10> := #T274@<2,10> <= tmp@<1,13> ---->
#<---- Alloc $t0 for #T275 ---->
#<---- Alloc $t1 for tmp ---->
lw $t1, 68($sp)
sle $t0, $a2, $t1
#<---- JUMP_IF #T275@<2,10> == 0 while_end_label_12 ---->
#<---- Cancel $a2 for #T274 ---->
sw $a2, 180($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for #T275 ---->
sw $t0, 184($sp)
#<---- Cancel $t1 for tmp ---->
sw $t1, 68($sp)
#<---- Alloc $a2 for #T275 ---->
lw $a2, 184($sp)
beq $a2, 0, while_end_label_12
#<---- SET #T276@<2,10> := i@<1,13> < j@<1,13> ---->
#<---- Alloc $a3 for #T276 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 76($sp)
#<---- Alloc $t1 for j ---->
lw $t1, 72($sp)
slt $a3, $t0, $t1
#<---- JUMP_IF #T276@<2,10> == 0 while_end_label_12 ---->
#<---- Cancel $a2 for #T275 ---->
sw $a2, 184($sp)
#<---- Cancel $a3 for #T276 ---->
sw $a3, 188($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 76($sp)
#<---- Cancel $t1 for j ---->
sw $t1, 72($sp)
#<---- Alloc $a2 for #T276 ---->
lw $a2, 188($sp)
beq $a2, 0, while_end_label_12
#<---- #T277@<2,10> = i@<1,13> ADD 1 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
#<---- Alloc $t0 for #T277 ---->
addiu $t0, $a3, 1
#<---- ASSIGN i@<1,13> = #T277@<2,10> ---->
addiu $a3, $t0, 0
#<---- JUMP while_judge_label_12 ---->
#<---- Cancel $a2 for #T276 ---->
sw $a2, 188($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for #T277 ---->
sw $t0, 192($sp)
j while_judge_label_12
#<---- GEN_LABEL while_end_label_12: ---->
while_end_label_12:
#<---- SET #T278@<2,10> := i@<1,13> < j@<1,13> ---->
#<---- Alloc $a2 for #T278 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
#<---- Alloc $t0 for j ---->
lw $t0, 72($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T278@<2,10> == 0 ifElse_end_label_49 ---->
#<---- Cancel $a2 for #T278 ---->
sw $a2, 196($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 72($sp)
#<---- Alloc $a2 for #T278 ---->
lw $a2, 196($sp)
beq $a2, 0, ifElse_end_label_49
#<---- NEW_BLOCK <3,17> ---->
#<---- NEW_BLOCK <4,10> ---->
#<---- END_BLOCK <4,10> ---->
#<---- LOAD #T279@<3,17> = src@<0,0>[i@<1,13>] ---->
#<---- Alloc $a3 for #T279 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 76($sp)
sll $a1, $t0, 2
lw $a3, array_src_($a1)
#<---- var k@<3,17> = #T279@<3,17> ---->
#<---- Alloc $t1 for k ---->
addiu $t1, $a3, 0
#<---- LOAD #T280@<3,17> = src@<0,0>[j@<1,13>] ---->
#<---- Alloc $t2 for #T280 ---->
#<---- Alloc $t3 for j ---->
lw $t3, 72($sp)
sll $a1, $t3, 2
lw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[i@<1,13>] = #T280@<3,17> ---->
sll $a1, $t0, 2
sw $t2, array_src_($a1)
#<---- SAVE src@<0,0>[j@<1,13>] = k@<3,17> ---->
sll $a1, $t3, 2
sw $t1, array_src_($a1)
#<---- NEW_BLOCK <4,11> ---->
#<---- END_BLOCK <4,11> ---->
#<---- END_BLOCK <3,17> ---->
#<---- GEN_LABEL ifElse_end_label_49: ---->
#<---- Cancel $a2 for #T278 ---->
sw $a2, 196($sp)
#<---- Cancel $a3 for #T279 ---->
sw $a3, 200($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 76($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 204($sp)
#<---- Cancel $t2 for #T280 ---->
sw $t2, 208($sp)
#<---- Cancel $t3 for j ---->
sw $t3, 72($sp)
ifElse_end_label_49:
#<---- NEW_BLOCK <3,18> ---->
#<---- END_BLOCK <3,18> ---->
#<---- END_BLOCK <2,10> ---->
#<---- JUMP while_judge_label_10 ---->
j while_judge_label_10
#<---- GEN_LABEL while_end_label_10: ---->
while_end_label_10:
#<---- LOAD #T281@<1,13> = src@<0,0>[i@<1,13>] ---->
#<---- Alloc $a2 for #T281 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- SAVE src@<0,0>[l@<1,13>] = #T281@<1,13> ---->
#<---- Alloc $t0 for l ---->
lw $t0, 4($sp)
sll $a1, $t0, 2
sw $a2, array_src_($a1)
#<---- SAVE src@<0,0>[i@<1,13>] = tmp@<1,13> ---->
sll $a1, $a3, 2
#<---- Alloc $t1 for tmp ---->
lw $t1, 68($sp)
sw $t1, array_src_($a1)
#<---- ASSIGN mid@<1,13> = j@<1,13> ---->
#<---- Alloc $t2 for j ---->
lw $t2, 72($sp)
#<---- Alloc $t3 for mid ---->
addiu $t3, $t2, 0
#<---- ASSIGN j@<1,13> = i@<1,13> ---->
addiu $t2, $a3, 0
#<---- GEN_LABEL while_judge_label_13: ---->
#<---- Cancel $a2 for #T281 ---->
sw $a2, 84($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for l ---->
sw $t0, 4($sp)
#<---- Cancel $t1 for tmp ---->
sw $t1, 68($sp)
#<---- Cancel $t2 for j ---->
sw $t2, 72($sp)
#<---- Cancel $t3 for mid ---->
sw $t3, 24($sp)
while_judge_label_13:
#<---- LOAD #T282@<1,13> = src@<0,0>[i@<1,13>] ---->
#<---- Alloc $a2 for #T282 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- LOAD #T283@<1,13> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t0 for #T283 ---->
#<---- Alloc $t1 for mid ---->
lw $t1, 24($sp)
sll $a1, $t1, 2
lw $t0, array_src_($a1)
#<---- SET #T284@<1,13> := #T282@<1,13> == #T283@<1,13> ---->
#<---- Alloc $t2 for #T284 ---->
seq $t2, $a2, $t0
#<---- JUMP_IF #T284@<1,13> == 0 while_end_label_13 ---->
#<---- Cancel $a2 for #T282 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for #T283 ---->
sw $t0, 92($sp)
#<---- Cancel $t1 for mid ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T284 ---->
sw $t2, 96($sp)
#<---- Alloc $a2 for #T284 ---->
lw $a2, 96($sp)
beq $a2, 0, while_end_label_13
#<---- #T285@<1,13> = i@<1,13> SUB 1 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 76($sp)
#<---- Alloc $t0 for #T285 ---->
addiu $t0, $a3, -1
#<---- ASSIGN i@<1,13> = #T285@<1,13> ---->
addiu $a3, $t0, 0
#<---- JUMP while_judge_label_13 ---->
#<---- Cancel $a2 for #T284 ---->
sw $a2, 96($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for #T285 ---->
sw $t0, 100($sp)
j while_judge_label_13
#<---- GEN_LABEL while_end_label_13: ---->
while_end_label_13:
#<---- GEN_LABEL while_judge_label_14: ---->
while_judge_label_14:
#<---- LOAD #T286@<1,13> = src@<0,0>[j@<1,13>] ---->
#<---- Alloc $a2 for #T286 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 72($sp)
sll $a1, $a3, 2
lw $a2, array_src_($a1)
#<---- LOAD #T287@<1,13> = src@<0,0>[mid@<1,13>] ---->
#<---- Alloc $t0 for #T287 ---->
#<---- Alloc $t1 for mid ---->
lw $t1, 24($sp)
sll $a1, $t1, 2
lw $t0, array_src_($a1)
#<---- SET #T288@<1,13> := #T286@<1,13> == #T287@<1,13> ---->
#<---- Alloc $t2 for #T288 ---->
seq $t2, $a2, $t0
#<---- JUMP_IF #T288@<1,13> == 0 while_end_label_14 ---->
#<---- Cancel $a2 for #T286 ---->
sw $a2, 104($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 72($sp)
#<---- Cancel $t0 for #T287 ---->
sw $t0, 108($sp)
#<---- Cancel $t1 for mid ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T288 ---->
sw $t2, 112($sp)
#<---- Alloc $a2 for #T288 ---->
lw $a2, 112($sp)
beq $a2, 0, while_end_label_14
#<---- #T289@<1,13> = j@<1,13> ADD 1 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 72($sp)
#<---- Alloc $t0 for #T289 ---->
addiu $t0, $a3, 1
#<---- ASSIGN j@<1,13> = #T289@<1,13> ---->
addiu $a3, $t0, 0
#<---- JUMP while_judge_label_14 ---->
#<---- Cancel $a2 for #T288 ---->
sw $a2, 112($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 72($sp)
#<---- Cancel $t0 for #T289 ---->
sw $t0, 116($sp)
j while_judge_label_14
#<---- GEN_LABEL while_end_label_14: ---->
while_end_label_14:
#<---- PRE_CALL quickSort@34 ---->
#<---- PUSH_PARA i@<1,13> #function: quickSort@34 #arg: r ---->
#<---- Alloc $a2 for i ---->
lw $a2, 76($sp)
sw $a2, -204($sp)
#<---- PUSH_PARA l@<1,13> #function: quickSort@34 #arg: l ---->
#<---- Alloc $a3 for l ---->
lw $a3, 4($sp)
sw $a3, -208($sp)
#<---- FUNC_CALL quickSort@34 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for i ---->
sw $a2, 76($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 4($sp)
addiu $sp, $sp, -212
jal func_label_quickSort
addiu $sp, $sp, 212
lw $ra, 0($sp)
#<---- ASSIGN #T290@<1,13> = %RTX ---->
#<---- Alloc $a2 for #T290 ---->
move $a2, $v0
#<---- PRE_CALL quickSort@35 ---->
#<---- PUSH_PARA r@<1,13> #function: quickSort@35 #arg: r ---->
#<---- Alloc $a3 for r ---->
lw $a3, 8($sp)
sw $a3, -204($sp)
#<---- PUSH_PARA j@<1,13> #function: quickSort@35 #arg: l ---->
#<---- Alloc $t0 for j ---->
lw $t0, 72($sp)
sw $t0, -208($sp)
#<---- FUNC_CALL quickSort@35 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T290 ---->
sw $a2, 120($sp)
#<---- Cancel $a3 for r ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for j ---->
sw $t0, 72($sp)
addiu $sp, $sp, -212
jal func_label_quickSort
addiu $sp, $sp, 212
lw $ra, 0($sp)
#<---- ASSIGN #T291@<1,13> = %RTX ---->
#<---- Alloc $a2 for #T291 ---->
move $a2, $v0
#<---- END_BLOCK <1,13> ---->
jr $ra
#<--------------- FUNC determinant--------------->
func_label_determinant:
#<------- FORM_VAR_DEF in@<1,14> determinant ------->
#<---- Alloc $a2 for in ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF n@<1,14> determinant ------->
#<---- Alloc $a3 for n ---->
lw $a3, 8($sp)
#<---- SET #T292@<1,14> := n@<1,14> == 1 ---->
#<---- Alloc $t0 for #T292 ---->
seq $t0, $a3, 1
#<---- JUMP_IF #T292@<1,14> == 0 ifElse_end_label_50 ---->
#<---- Cancel $a2 for in ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for n ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T292 ---->
sw $t0, 12($sp)
#<---- Alloc $a2 for #T292 ---->
lw $a2, 12($sp)
beq $a2, 0, ifElse_end_label_50
#<---- LOAD #T293@<1,14> = in@<1,14>[0] ---->
#<---- Alloc $a3 for #T293 ---->
#<---- Alloc $t0 for in ---->
lw $t0, 4($sp)
lw $a3, 0($t0)
#<---- return #T293@<1,14> ---->
move $v0, $a3
jr $ra
#<---- GEN_LABEL ifElse_end_label_50: ---->
#<---- Cancel $a2 for #T292 ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T293 ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for in ---->
sw $t0, 4($sp)
ifElse_end_label_50:
#<---- var tmp@<1,14> ---->
#<---- var i@<1,14> = 0 ---->
#<---- Alloc $a2 for i ---->
move $a2, $zero
#<---- var ans@<1,14> = 0 ---->
#<---- Alloc $a3 for ans ---->
move $a3, $zero
#<---- GEN_LABEL while_judge_label_15: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 420($sp)
#<---- Cancel $a3 for ans ---->
sw $a3, 424($sp)
while_judge_label_15:
#<---- SET #T294@<1,14> := i@<1,14> < n@<1,14> ---->
#<---- Alloc $a2 for #T294 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 420($sp)
#<---- Alloc $t0 for n ---->
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T294@<1,14> == 0 while_end_label_15 ---->
#<---- Cancel $a2 for #T294 ---->
sw $a2, 428($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 420($sp)
#<---- Cancel $t0 for n ---->
sw $t0, 8($sp)
#<---- Alloc $a2 for #T294 ---->
lw $a2, 428($sp)
beq $a2, 0, while_end_label_15
#<---- NEW_BLOCK <2,11> ---->
#<---- var j@<2,11> = 0 ---->
#<---- Alloc $a3 for j ---->
move $a3, $zero
#<---- GEN_LABEL while_judge_label_16: ---->
#<---- Cancel $a2 for #T294 ---->
sw $a2, 428($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 432($sp)
while_judge_label_16:
#<---- #T295@<2,11> = n@<1,14> SUB 1 ---->
#<---- Alloc $a2 for n ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for #T295 ---->
addiu $a3, $a2, -1
#<---- SET #T296@<2,11> := j@<2,11> < #T295@<2,11> ---->
#<---- Alloc $t0 for #T296 ---->
#<---- Alloc $t1 for j ---->
lw $t1, 432($sp)
slt $t0, $t1, $a3
#<---- JUMP_IF #T296@<2,11> == 0 while_end_label_16 ---->
#<---- Cancel $a2 for n ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T295 ---->
sw $a3, 436($sp)
#<---- Cancel $t0 for #T296 ---->
sw $t0, 440($sp)
#<---- Cancel $t1 for j ---->
sw $t1, 432($sp)
#<---- Alloc $a2 for #T296 ---->
lw $a2, 440($sp)
beq $a2, 0, while_end_label_16
#<---- NEW_BLOCK <3,19> ---->
#<---- var k@<3,19> = 0 ---->
#<---- Alloc $a3 for k ---->
move $a3, $zero
#<---- GEN_LABEL while_judge_label_17: ---->
#<---- Cancel $a2 for #T296 ---->
sw $a2, 440($sp)
#<---- Cancel $a3 for k ---->
sw $a3, 504($sp)
while_judge_label_17:
#<---- #T297@<3,19> = n@<1,14> SUB 1 ---->
#<---- Alloc $a2 for n ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for #T297 ---->
addiu $a3, $a2, -1
#<---- SET #T298@<3,19> := k@<3,19> < #T297@<3,19> ---->
#<---- Alloc $t0 for #T298 ---->
#<---- Alloc $t1 for k ---->
lw $t1, 504($sp)
slt $t0, $t1, $a3
#<---- JUMP_IF #T298@<3,19> == 0 while_end_label_17 ---->
#<---- Cancel $a2 for n ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T297 ---->
sw $a3, 508($sp)
#<---- Cancel $t0 for #T298 ---->
sw $t0, 512($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 504($sp)
#<---- Alloc $a2 for #T298 ---->
lw $a2, 512($sp)
beq $a2, 0, while_end_label_17
#<---- NEW_BLOCK <4,12> ---->
#<---- SET #T299@<4,12> := k@<3,19> < i@<1,14> ---->
#<---- Alloc $a3 for #T299 ---->
#<---- Alloc $t0 for k ---->
lw $t0, 504($sp)
#<---- Alloc $t1 for i ---->
lw $t1, 420($sp)
slt $a3, $t0, $t1
#<---- JUMP_IF #T299@<4,12> == 0 Else_start_label_29 ---->
#<---- Cancel $a2 for #T298 ---->
sw $a2, 512($sp)
#<---- Cancel $a3 for #T299 ---->
sw $a3, 520($sp)
#<---- Cancel $t0 for k ---->
sw $t0, 504($sp)
#<---- Cancel $t1 for i ---->
sw $t1, 420($sp)
#<---- Alloc $a2 for #T299 ---->
lw $a2, 520($sp)
beq $a2, 0, Else_start_label_29
#<---- #T300@<4,12> = j@<2,11> MUL 10 ---->
#<---- Alloc $a3 for j ---->
lw $a3, 432($sp)
#<---- Alloc $t0 for #T300 ---->
li $v1, 10
mult $a3, $v1
mflo $t0
#<---- #T301@<4,12> = #T300@<4,12> ADD k@<3,19> ---->
#<---- Alloc $t1 for k ---->
lw $t1, 504($sp)
#<---- Alloc $t2 for #T301 ---->
addu $t2, $t0, $t1
#<---- #T302@<4,12> = j@<2,11> ADD 1 ---->
#<---- Alloc $t3 for #T302 ---->
addiu $t3, $a3, 1
#<---- #T303@<4,12> = #T302@<4,12> MUL 10 ---->
#<---- Alloc $t4 for #T303 ---->
li $v1, 10
mult $t3, $v1
mflo $t4
#<---- #T304@<4,12> = #T303@<4,12> ADD k@<3,19> ---->
#<---- Alloc $t5 for #T304 ---->
addu $t5, $t4, $t1
#<---- LOAD #T305@<4,12> = in@<1,14>[#T304@<4,12>] ---->
#<---- Alloc $t6 for #T305 ---->
sll $a1, $t5, 2
#<---- Alloc $t7 for in ---->
lw $t7, 4($sp)
addu $v1, $t7, $a1
lw $t6, 0($v1)
#<---- SAVE tmp@<1,14>[#T301@<4,12>] = #T305@<4,12> ---->
sll $a1, $t2, 2
addiu $v1, $sp, 20
addu $v1, $v1, $a1
sw $t6, 0($v1)
#<---- JUMP ifElse_end_label_51 ---->
#<---- Cancel $a2 for #T299 ---->
sw $a2, 520($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 432($sp)
#<---- Cancel $t0 for #T300 ---->
sw $t0, 524($sp)
#<---- Cancel $t1 for k ---->
sw $t1, 504($sp)
#<---- Cancel $t2 for #T301 ---->
sw $t2, 528($sp)
#<---- Cancel $t3 for #T302 ---->
sw $t3, 532($sp)
#<---- Cancel $t4 for #T303 ---->
sw $t4, 536($sp)
#<---- Cancel $t5 for #T304 ---->
sw $t5, 540($sp)
#<---- Cancel $t6 for #T305 ---->
sw $t6, 544($sp)
#<---- Cancel $t7 for in ---->
sw $t7, 4($sp)
j ifElse_end_label_51
#<---- GEN_LABEL Else_start_label_29: ---->
Else_start_label_29:
#<---- #T306@<4,12> = j@<2,11> MUL 10 ---->
#<---- Alloc $a2 for j ---->
lw $a2, 432($sp)
#<---- Alloc $a3 for #T306 ---->
li $v1, 10
mult $a2, $v1
mflo $a3
#<---- #T307@<4,12> = #T306@<4,12> ADD k@<3,19> ---->
#<---- Alloc $t0 for k ---->
lw $t0, 504($sp)
#<---- Alloc $t1 for #T307 ---->
addu $t1, $a3, $t0
#<---- #T308@<4,12> = j@<2,11> ADD 1 ---->
#<---- Alloc $t2 for #T308 ---->
addiu $t2, $a2, 1
#<---- #T309@<4,12> = k@<3,19> ADD 1 ---->
#<---- Alloc $t3 for #T309 ---->
addiu $t3, $t0, 1
#<---- #T310@<4,12> = #T308@<4,12> MUL 10 ---->
#<---- Alloc $t4 for #T310 ---->
li $v1, 10
mult $t2, $v1
mflo $t4
#<---- #T311@<4,12> = #T310@<4,12> ADD #T309@<4,12> ---->
#<---- Alloc $t5 for #T311 ---->
addu $t5, $t4, $t3
#<---- LOAD #T312@<4,12> = in@<1,14>[#T311@<4,12>] ---->
#<---- Alloc $t6 for #T312 ---->
sll $a1, $t5, 2
#<---- Alloc $t7 for in ---->
lw $t7, 4($sp)
addu $v1, $t7, $a1
lw $t6, 0($v1)
#<---- SAVE tmp@<1,14>[#T307@<4,12>] = #T312@<4,12> ---->
sll $a1, $t1, 2
addiu $v1, $sp, 20
addu $v1, $v1, $a1
sw $t6, 0($v1)
#<---- GEN_LABEL ifElse_end_label_51: ---->
#<---- Cancel $a2 for j ---->
sw $a2, 432($sp)
#<---- Cancel $a3 for #T306 ---->
sw $a3, 548($sp)
#<---- Cancel $t0 for k ---->
sw $t0, 504($sp)
#<---- Cancel $t1 for #T307 ---->
sw $t1, 552($sp)
#<---- Cancel $t2 for #T308 ---->
sw $t2, 556($sp)
#<---- Cancel $t3 for #T309 ---->
sw $t3, 560($sp)
#<---- Cancel $t4 for #T310 ---->
sw $t4, 564($sp)
#<---- Cancel $t5 for #T311 ---->
sw $t5, 568($sp)
#<---- Cancel $t6 for #T312 ---->
sw $t6, 572($sp)
#<---- Cancel $t7 for in ---->
sw $t7, 4($sp)
ifElse_end_label_51:
#<---- #T313@<4,12> = k@<3,19> ADD 1 ---->
#<---- Alloc $a2 for k ---->
lw $a2, 504($sp)
#<---- Alloc $a3 for #T313 ---->
addiu $a3, $a2, 1
#<---- ASSIGN k@<3,19> = #T313@<4,12> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <4,12> ---->
#<---- JUMP while_judge_label_17 ---->
#<---- Cancel $a2 for k ---->
sw $a2, 504($sp)
#<---- Cancel $a3 for #T313 ---->
sw $a3, 576($sp)
j while_judge_label_17
#<---- GEN_LABEL while_end_label_17: ---->
while_end_label_17:
#<---- #T314@<3,19> = j@<2,11> ADD 1 ---->
#<---- Alloc $a2 for j ---->
lw $a2, 432($sp)
#<---- Alloc $a3 for #T314 ---->
addiu $a3, $a2, 1
#<---- ASSIGN j@<2,11> = #T314@<3,19> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <3,19> ---->
#<---- JUMP while_judge_label_16 ---->
#<---- Cancel $a2 for j ---->
sw $a2, 432($sp)
#<---- Cancel $a3 for #T314 ---->
sw $a3, 516($sp)
j while_judge_label_16
#<---- GEN_LABEL while_end_label_16: ---->
while_end_label_16:
#<---- PRE_CALL determinant@36 ---->
#<---- #T315@<2,11> = n@<1,14> SUB 1 ---->
#<---- Alloc $a2 for n ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for #T315 ---->
addiu $a3, $a2, -1
#<---- PUSH_PARA #T315@<2,11> #function: determinant@36 #arg: n ---->
sw $a3, -572($sp)
#<---- PUSH_PARA tmp@<1,14> #function: determinant@36 #arg: in ---->
addiu $v1, $sp, 20
sw $v1, -576($sp)
#<---- FUNC_CALL determinant@36 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for n ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T315 ---->
sw $a3, 444($sp)
addiu $sp, $sp, -580
jal func_label_determinant
addiu $sp, $sp, 580
lw $ra, 0($sp)
#<---- ASSIGN #T316@<2,11> = %RTX ---->
#<---- Alloc $a2 for #T316 ---->
move $a2, $v0
#<---- var l@<2,11> = #T316@<2,11> ---->
#<---- Alloc $a3 for l ---->
addiu $a3, $a2, 0
#<---- #T317@<2,11> = i@<1,14> MOD 2 ---->
#<---- Alloc $t0 for i ---->
lw $t0, 420($sp)
#<---- Alloc $t1 for #T317 ---->
addiu $v1, $zero, 2
div $t0, $v1
mfhi $t1
#<---- JUMP_IF #T317@<2,11> == 0 Else_start_label_30 ---->
#<---- Cancel $a2 for #T316 ---->
sw $a2, 448($sp)
#<---- Cancel $a3 for l ---->
sw $a3, 452($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 420($sp)
#<---- Cancel $t1 for #T317 ---->
sw $t1, 456($sp)
#<---- Alloc $a2 for #T317 ---->
lw $a2, 456($sp)
beq $a2, 0, Else_start_label_30
#<---- #T318@<2,11> = 0 MUL 10 ---->
#<---- Alloc $a3 for #T318 ---->
li $v1, 0
li $v0, 10
mult $v1, $v0
mflo $a3
#<---- #T319@<2,11> = #T318@<2,11> ADD i@<1,14> ---->
#<---- Alloc $t0 for i ---->
lw $t0, 420($sp)
#<---- Alloc $t1 for #T319 ---->
addu $t1, $a3, $t0
#<---- LOAD #T320@<2,11> = in@<1,14>[#T319@<2,11>] ---->
#<---- Alloc $t2 for #T320 ---->
sll $a1, $t1, 2
#<---- Alloc $t3 for in ---->
lw $t3, 4($sp)
addu $v1, $t3, $a1
lw $t2, 0($v1)
#<---- #T321@<2,11> = #T320@<2,11> MUL l@<2,11> ---->
#<---- Alloc $t4 for l ---->
lw $t4, 452($sp)
#<---- Alloc $t5 for #T321 ---->
mult $t2, $t4
mflo $t5
#<---- #T322@<2,11> = ans@<1,14> SUB #T321@<2,11> ---->
#<---- Alloc $t6 for ans ---->
lw $t6, 424($sp)
#<---- Alloc $t7 for #T322 ---->
subu $t7, $t6, $t5
#<---- ASSIGN ans@<1,14> = #T322@<2,11> ---->
addiu $t6, $t7, 0
#<---- JUMP ifElse_end_label_52 ---->
#<---- Cancel $a2 for #T317 ---->
sw $a2, 456($sp)
#<---- Cancel $a3 for #T318 ---->
sw $a3, 460($sp)
#<---- Cancel $t0 for i ---->
sw $t0, 420($sp)
#<---- Cancel $t1 for #T319 ---->
sw $t1, 464($sp)
#<---- Cancel $t2 for #T320 ---->
sw $t2, 468($sp)
#<---- Cancel $t3 for in ---->
sw $t3, 4($sp)
#<---- Cancel $t4 for l ---->
sw $t4, 452($sp)
#<---- Cancel $t5 for #T321 ---->
sw $t5, 472($sp)
#<---- Cancel $t6 for ans ---->
sw $t6, 424($sp)
#<---- Cancel $t7 for #T322 ---->
sw $t7, 476($sp)
j ifElse_end_label_52
#<---- GEN_LABEL Else_start_label_30: ---->
Else_start_label_30:
#<---- #T323@<2,11> = 0 MUL 10 ---->
#<---- Alloc $a2 for #T323 ---->
li $v1, 0
li $v0, 10
mult $v1, $v0
mflo $a2
#<---- #T324@<2,11> = #T323@<2,11> ADD i@<1,14> ---->
#<---- Alloc $a3 for i ---->
lw $a3, 420($sp)
#<---- Alloc $t0 for #T324 ---->
addu $t0, $a2, $a3
#<---- LOAD #T325@<2,11> = in@<1,14>[#T324@<2,11>] ---->
#<---- Alloc $t1 for #T325 ---->
sll $a1, $t0, 2
#<---- Alloc $t2 for in ---->
lw $t2, 4($sp)
addu $v1, $t2, $a1
lw $t1, 0($v1)
#<---- #T326@<2,11> = #T325@<2,11> MUL l@<2,11> ---->
#<---- Alloc $t3 for l ---->
lw $t3, 452($sp)
#<---- Alloc $t4 for #T326 ---->
mult $t1, $t3
mflo $t4
#<---- #T327@<2,11> = ans@<1,14> ADD #T326@<2,11> ---->
#<---- Alloc $t5 for ans ---->
lw $t5, 424($sp)
#<---- Alloc $t6 for #T327 ---->
addu $t6, $t5, $t4
#<---- ASSIGN ans@<1,14> = #T327@<2,11> ---->
addiu $t5, $t6, 0
#<---- GEN_LABEL ifElse_end_label_52: ---->
#<---- Cancel $a2 for #T323 ---->
sw $a2, 480($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 420($sp)
#<---- Cancel $t0 for #T324 ---->
sw $t0, 484($sp)
#<---- Cancel $t1 for #T325 ---->
sw $t1, 488($sp)
#<---- Cancel $t2 for in ---->
sw $t2, 4($sp)
#<---- Cancel $t3 for l ---->
sw $t3, 452($sp)
#<---- Cancel $t4 for #T326 ---->
sw $t4, 492($sp)
#<---- Cancel $t5 for ans ---->
sw $t5, 424($sp)
#<---- Cancel $t6 for #T327 ---->
sw $t6, 496($sp)
ifElse_end_label_52:
#<---- #T328@<2,11> = i@<1,14> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 420($sp)
#<---- Alloc $a3 for #T328 ---->
addiu $a3, $a2, 1
#<---- ASSIGN i@<1,14> = #T328@<2,11> ---->
addiu $a2, $a3, 0
#<---- END_BLOCK <2,11> ---->
#<---- JUMP while_judge_label_15 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 420($sp)
#<---- Cancel $a3 for #T328 ---->
sw $a3, 500($sp)
j while_judge_label_15
#<---- GEN_LABEL while_end_label_15: ---->
while_end_label_15:
#<---- return ans@<1,14> ---->
#<---- Alloc $a2 for ans ---->
lw $a2, 424($sp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,14> ---->
jr $ra
#<--------------- FUNC main--------------->
func_label_main:
#<---- var total@<1,15> ---->
#<---- Alloc $a2 for total ---->
#<---- seed@<0,0> = input() ---->
#<---- Alloc $a3 for seed ---->
lw $a3, -612($gp)
li $v0, 5
syscall
move $a3, $v0
sw $v0, -612($gp)
#<---- total@<1,15> = input() ---->
li $v0, 5
syscall
move $a2, $v0
#<---- print #str51 ---->
la $a0, str51
li $v0, 4
syscall
#<---- var demo1@<1,15>[0] = 1686070451 ---->
li $v1, 1686070451
sw $v1, 8($sp)
#<---- var demo1@<1,15>[1] = 580167200 ---->
li $v1, 580167200
sw $v1, 12($sp)
#<---- var demo1@<1,15>[2] = -71727344 ---->
li $v1, -71727344
sw $v1, 16($sp)
#<---- var demo1@<1,15>[3] = 1790458882 ---->
li $v1, 1790458882
sw $v1, 20($sp)
#<---- var demo1@<1,15>[4] = -707294080 ---->
li $v1, -707294080
sw $v1, 24($sp)
#<---- var demo1@<1,15>[5] = 437522823 ---->
li $v1, 437522823
sw $v1, 28($sp)
#<---- var demo1@<1,15>[6] = -354745685 ---->
li $v1, -354745685
sw $v1, 32($sp)
#<---- var demo1@<1,15>[7] = -903788492 ---->
li $v1, -903788492
sw $v1, 36($sp)
#<---- var demo1@<1,15>[8] = -853326395 ---->
li $v1, -853326395
sw $v1, 40($sp)
#<---- var demo1@<1,15>[9] = -2045068380 ---->
li $v1, -2045068380
sw $v1, 44($sp)
#<---- var demo2@<1,15>[0] = 1919156834 ---->
li $v1, 1919156834
sw $v1, 48($sp)
#<---- var demo2@<1,15>[1] = -1000786109 ---->
li $v1, -1000786109
sw $v1, 52($sp)
#<---- var demo2@<1,15>[2] = 1852757103 ---->
li $v1, 1852757103
sw $v1, 56($sp)
#<---- var demo2@<1,15>[3] = 1966938780 ---->
li $v1, 1966938780
sw $v1, 60($sp)
#<---- var demo2@<1,15>[4] = -1198616081 ---->
li $v1, -1198616081
sw $v1, 64($sp)
#<---- var demo2@<1,15>[5] = -2118269519 ---->
li $v1, -2118269519
sw $v1, 68($sp)
#<---- var demo2@<1,15>[6] = -2070890619 ---->
li $v1, -2070890619
sw $v1, 72($sp)
#<---- var demo2@<1,15>[7] = 1878585957 ---->
li $v1, 1878585957
sw $v1, 76($sp)
#<---- var demo2@<1,15>[8] = 1457271300 ---->
li $v1, 1457271300
sw $v1, 80($sp)
#<---- var demo2@<1,15>[9] = 828307086 ---->
li $v1, 828307086
sw $v1, 84($sp)
#<---- var demo2@<1,15>[10] = 1840937318 ---->
li $v1, 1840937318
sw $v1, 88($sp)
#<---- var demo2@<1,15>[11] = 2091480844 ---->
li $v1, 2091480844
sw $v1, 92($sp)
#<---- var demo2@<1,15>[12] = 459617059 ---->
li $v1, 459617059
sw $v1, 96($sp)
#<---- var demo2@<1,15>[13] = -1837848014 ---->
li $v1, -1837848014
sw $v1, 100($sp)
#<---- var demo2@<1,15>[14] = 932994868 ---->
li $v1, 932994868
sw $v1, 104($sp)
#<---- var demo2@<1,15>[15] = 199723542 ---->
li $v1, 199723542
sw $v1, 108($sp)
#<---- var demo2@<1,15>[16] = -1678902097 ---->
li $v1, -1678902097
sw $v1, 112($sp)
#<---- var demo2@<1,15>[17] = 460611448 ---->
li $v1, 460611448
sw $v1, 116($sp)
#<---- var demo2@<1,15>[18] = 572100277 ---->
li $v1, 572100277
sw $v1, 120($sp)
#<---- var demo2@<1,15>[19] = -1607527460 ---->
li $v1, -1607527460
sw $v1, 124($sp)
#<---- var demo2@<1,15>[20] = -744604366 ---->
li $v1, -744604366
sw $v1, 128($sp)
#<---- var demo2@<1,15>[21] = -2044300164 ---->
li $v1, -2044300164
sw $v1, 132($sp)
#<---- var demo2@<1,15>[22] = 1958063122 ---->
li $v1, 1958063122
sw $v1, 136($sp)
#<---- var demo2@<1,15>[23] = 1148229092 ---->
li $v1, 1148229092
sw $v1, 140($sp)
#<---- var demo2@<1,15>[24] = 840274257 ---->
li $v1, 840274257
sw $v1, 144($sp)
#<---- var demo2@<1,15>[25] = 969614164 ---->
li $v1, 969614164
sw $v1, 148($sp)
#<---- var demo2@<1,15>[26] = -631737099 ---->
li $v1, -631737099
sw $v1, 152($sp)
#<---- var demo2@<1,15>[27] = 1127462504 ---->
li $v1, 1127462504
sw $v1, 156($sp)
#<---- var demo2@<1,15>[28] = 2018161914 ---->
li $v1, 2018161914
sw $v1, 160($sp)
#<---- var demo2@<1,15>[29] = 556766899 ---->
li $v1, 556766899
sw $v1, 164($sp)
#<---- var demo2@<1,15>[30] = 1861544443 ---->
li $v1, 1861544443
sw $v1, 168($sp)
#<---- var demo2@<1,15>[31] = -232935718 ---->
li $v1, -232935718
sw $v1, 172($sp)
#<---- var demo2@<1,15>[32] = -1828379384 ---->
li $v1, -1828379384
sw $v1, 176($sp)
#<---- var demo2@<1,15>[33] = -1282922638 ---->
li $v1, -1282922638
sw $v1, 180($sp)
#<---- var demo2@<1,15>[34] = 809442004 ---->
li $v1, 809442004
sw $v1, 184($sp)
#<---- var demo2@<1,15>[35] = -65540968 ---->
li $v1, -65540968
sw $v1, 188($sp)
#<---- var demo2@<1,15>[36] = -1068429160 ---->
li $v1, -1068429160
sw $v1, 192($sp)
#<---- var demo2@<1,15>[37] = 1264461509 ---->
li $v1, 1264461509
sw $v1, 196($sp)
#<---- var demo2@<1,15>[38] = -2042849861 ---->
li $v1, -2042849861
sw $v1, 200($sp)
#<---- var demo2@<1,15>[39] = 118226071 ---->
li $v1, 118226071
sw $v1, 204($sp)
#<---- var demo2@<1,15>[40] = 277629739 ---->
li $v1, 277629739
sw $v1, 208($sp)
#<---- var demo2@<1,15>[41] = 386521250 ---->
li $v1, 386521250
sw $v1, 212($sp)
#<---- var demo2@<1,15>[42] = -821181987 ---->
li $v1, -821181987
sw $v1, 216($sp)
#<---- var demo2@<1,15>[43] = 929741622 ---->
li $v1, 929741622
sw $v1, 220($sp)
#<---- var demo2@<1,15>[44] = 727825736 ---->
li $v1, 727825736
sw $v1, 224($sp)
#<---- var demo2@<1,15>[45] = 1178454426 ---->
li $v1, 1178454426
sw $v1, 228($sp)
#<---- var demo2@<1,15>[46] = 1874370738 ---->
li $v1, 1874370738
sw $v1, 232($sp)
#<---- var demo2@<1,15>[47] = -25464282 ---->
li $v1, -25464282
sw $v1, 236($sp)
#<---- var demo2@<1,15>[48] = -1509655790 ---->
li $v1, -1509655790
sw $v1, 240($sp)
#<---- var demo2@<1,15>[49] = -1380518334 ---->
li $v1, -1380518334
sw $v1, 244($sp)
#<---- var demo2@<1,15>[50] = -1895096581 ---->
li $v1, -1895096581
sw $v1, 248($sp)
#<---- var demo2@<1,15>[51] = -1442451475 ---->
li $v1, -1442451475
sw $v1, 252($sp)
#<---- var demo2@<1,15>[52] = -480102141 ---->
li $v1, -480102141
sw $v1, 256($sp)
#<---- var demo2@<1,15>[53] = -925000658 ---->
li $v1, -925000658
sw $v1, 260($sp)
#<---- var demo2@<1,15>[54] = 1440901658 ---->
li $v1, 1440901658
sw $v1, 264($sp)
#<---- var demo2@<1,15>[55] = 925907631 ---->
li $v1, 925907631
sw $v1, 268($sp)
#<---- var demo2@<1,15>[56] = 550507243 ---->
li $v1, 550507243
sw $v1, 272($sp)
#<---- var demo2@<1,15>[57] = -1102555955 ---->
li $v1, -1102555955
sw $v1, 276($sp)
#<---- var demo2@<1,15>[58] = 1761734355 ---->
li $v1, 1761734355
sw $v1, 280($sp)
#<---- var demo2@<1,15>[59] = -248691452 ---->
li $v1, -248691452
sw $v1, 284($sp)
#<---- var demo2@<1,15>[60] = -585370257 ---->
li $v1, -585370257
sw $v1, 288($sp)
#<---- var demo2@<1,15>[61] = 1581421921 ---->
li $v1, 1581421921
sw $v1, 292($sp)
#<---- var demo2@<1,15>[62] = 2032931954 ---->
li $v1, 2032931954
sw $v1, 296($sp)
#<---- var demo2@<1,15>[63] = -232837497 ---->
li $v1, -232837497
sw $v1, 300($sp)
#<---- var demo2@<1,15>[64] = -361586023 ---->
li $v1, -361586023
sw $v1, 304($sp)
#<---- var demo2@<1,15>[65] = 1180399945 ---->
li $v1, 1180399945
sw $v1, 308($sp)
#<---- var demo2@<1,15>[66] = -940248727 ---->
li $v1, -940248727
sw $v1, 312($sp)
#<---- var demo2@<1,15>[67] = 1175495179 ---->
li $v1, 1175495179
sw $v1, 316($sp)
#<---- var demo2@<1,15>[68] = -2002866570 ---->
li $v1, -2002866570
sw $v1, 320($sp)
#<---- var demo2@<1,15>[69] = 1444260543 ---->
li $v1, 1444260543
sw $v1, 324($sp)
#<---- var demo2@<1,15>[70] = -1115441947 ---->
li $v1, -1115441947
sw $v1, 328($sp)
#<---- var demo2@<1,15>[71] = -1999355682 ---->
li $v1, -1999355682
sw $v1, 332($sp)
#<---- var demo2@<1,15>[72] = 986897468 ---->
li $v1, 986897468
sw $v1, 336($sp)
#<---- var demo2@<1,15>[73] = -646376841 ---->
li $v1, -646376841
sw $v1, 340($sp)
#<---- var demo2@<1,15>[74] = 1528095330 ---->
li $v1, 1528095330
sw $v1, 344($sp)
#<---- var demo2@<1,15>[75] = 113845900 ---->
li $v1, 113845900
sw $v1, 348($sp)
#<---- var demo2@<1,15>[76] = 1886450727 ---->
li $v1, 1886450727
sw $v1, 352($sp)
#<---- var demo2@<1,15>[77] = 257617693 ---->
li $v1, 257617693
sw $v1, 356($sp)
#<---- var demo2@<1,15>[78] = 617641447 ---->
li $v1, 617641447
sw $v1, 360($sp)
#<---- var demo2@<1,15>[79] = 2108323588 ---->
li $v1, 2108323588
sw $v1, 364($sp)
#<---- var demo2@<1,15>[80] = -1511698150 ---->
li $v1, -1511698150
sw $v1, 368($sp)
#<---- var demo2@<1,15>[81] = -934377428 ---->
li $v1, -934377428
sw $v1, 372($sp)
#<---- var demo2@<1,15>[82] = 1685574582 ---->
li $v1, 1685574582
sw $v1, 376($sp)
#<---- var demo2@<1,15>[83] = -146587647 ---->
li $v1, -146587647
sw $v1, 380($sp)
#<---- var demo2@<1,15>[84] = -701324057 ---->
li $v1, -701324057
sw $v1, 384($sp)
#<---- var demo2@<1,15>[85] = 243164633 ---->
li $v1, 243164633
sw $v1, 388($sp)
#<---- var demo2@<1,15>[86] = 765474257 ---->
li $v1, 765474257
sw $v1, 392($sp)
#<---- var demo2@<1,15>[87] = 1644349516 ---->
li $v1, 1644349516
sw $v1, 396($sp)
#<---- var demo2@<1,15>[88] = 872868955 ---->
li $v1, 872868955
sw $v1, 400($sp)
#<---- var demo2@<1,15>[89] = -1652887731 ---->
li $v1, -1652887731
sw $v1, 404($sp)
#<---- var demo2@<1,15>[90] = 1476073729 ---->
li $v1, 1476073729
sw $v1, 408($sp)
#<---- var demo2@<1,15>[91] = -299222375 ---->
li $v1, -299222375
sw $v1, 412($sp)
#<---- var demo2@<1,15>[92] = -1205701938 ---->
li $v1, -1205701938
sw $v1, 416($sp)
#<---- var demo2@<1,15>[93] = 302771914 ---->
li $v1, 302771914
sw $v1, 420($sp)
#<---- var demo2@<1,15>[94] = -1986235546 ---->
li $v1, -1986235546
sw $v1, 424($sp)
#<---- var demo2@<1,15>[95] = 1861009141 ---->
li $v1, 1861009141
sw $v1, 428($sp)
#<---- var demo2@<1,15>[96] = -1098803687 ---->
li $v1, -1098803687
sw $v1, 432($sp)
#<---- var demo2@<1,15>[97] = -1370104357 ---->
li $v1, -1370104357
sw $v1, 436($sp)
#<---- var demo2@<1,15>[98] = -1104419163 ---->
li $v1, -1104419163
sw $v1, 440($sp)
#<---- var demo2@<1,15>[99] = -1293373514 ---->
li $v1, -1293373514
sw $v1, 444($sp)
#<---- PRE_CALL checkArr@37 ---->
#<---- PUSH_PARA 10 #function: checkArr@37 #arg: total ---->
li $v1, 10
sw $v1, -168($sp)
#<---- PUSH_PARA demo1@<1,15> #function: checkArr@37 #arg: arr ---->
addiu $v1, $sp, 8
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@37 ---->
#<---- Cancel $a2 for total ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for seed ---->
sw $a3, -612($gp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T329@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T329 ---->
move $a2, $v0
#<---- PRE_CALL checkDouble@38 ---->
#<---- PUSH_PARA 5 #function: checkDouble@38 #arg: total ---->
li $v1, 5
sw $v1, -192($sp)
#<---- PUSH_PARA demo2@<1,15> #function: checkDouble@38 #arg: arr ---->
addiu $v1, $sp, 48
sw $v1, -196($sp)
#<---- FUNC_CALL checkDouble@38 ---->
#<---- Cancel $a2 for #T329 ---->
sw $a2, 448($sp)
addiu $sp, $sp, -200
jal func_label_checkDouble
addiu $sp, $sp, 200
#<---- ASSIGN #T330@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T330 ---->
move $a2, $v0
#<---- PRE_CALL initArr@39 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@39 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@39 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@39 ---->
#<---- Cancel $a2 for #T330 ---->
sw $a2, 452($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T331@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T331 ---->
move $a2, $v0
#<---- PRE_CALL bubbleSort@40 ---->
#<---- PUSH_PARA total@<1,15> #function: bubbleSort@40 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -88($sp)
#<---- FUNC_CALL bubbleSort@40 ---->
#<---- Cancel $a2 for #T331 ---->
sw $a2, 456($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -92
jal func_label_bubbleSort
addiu $sp, $sp, 92
#<---- ASSIGN #T332@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T332 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@41 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@41 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@41 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@41 ---->
#<---- Cancel $a2 for #T332 ---->
sw $a2, 460($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T333@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T333 ---->
move $a2, $v0
#<---- PRE_CALL initArr@42 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@42 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@42 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@42 ---->
#<---- Cancel $a2 for #T333 ---->
sw $a2, 464($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T334@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T334 ---->
move $a2, $v0
#<---- PRE_CALL shellSort@43 ---->
#<---- PUSH_PARA total@<1,15> #function: shellSort@43 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -84($sp)
#<---- FUNC_CALL shellSort@43 ---->
#<---- Cancel $a2 for #T334 ---->
sw $a2, 468($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -88
jal func_label_shellSort
addiu $sp, $sp, 88
#<---- ASSIGN #T335@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T335 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@44 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@44 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@44 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@44 ---->
#<---- Cancel $a2 for #T335 ---->
sw $a2, 472($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T336@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T336 ---->
move $a2, $v0
#<---- PRE_CALL initArr@45 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@45 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@45 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@45 ---->
#<---- Cancel $a2 for #T336 ---->
sw $a2, 476($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T337@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T337 ---->
move $a2, $v0
#<---- PRE_CALL mergeSort@46 ---->
#<---- #T338@<1,15> = total@<1,15> SUB 1 ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T338 ---->
addiu $t0, $a3, -1
#<---- PUSH_PARA #T338@<1,15> #function: mergeSort@46 #arg: r ---->
sw $t0, -36($sp)
#<---- PUSH_PARA 0 #function: mergeSort@46 #arg: l ---->
li $v1, 0
sw $v1, -40($sp)
#<---- FUNC_CALL mergeSort@46 ---->
#<---- Cancel $a2 for #T337 ---->
sw $a2, 480($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T338 ---->
sw $t0, 484($sp)
addiu $sp, $sp, -44
jal func_label_mergeSort
addiu $sp, $sp, 44
#<---- ASSIGN #T339@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T339 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@47 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@47 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@47 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@47 ---->
#<---- Cancel $a2 for #T339 ---->
sw $a2, 488($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T340@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T340 ---->
move $a2, $v0
#<---- PRE_CALL initArr@48 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@48 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@48 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@48 ---->
#<---- Cancel $a2 for #T340 ---->
sw $a2, 492($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T341@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T341 ---->
move $a2, $v0
#<---- PRE_CALL quickSort@49 ---->
#<---- #T342@<1,15> = total@<1,15> SUB 1 ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T342 ---->
addiu $t0, $a3, -1
#<---- PUSH_PARA #T342@<1,15> #function: quickSort@49 #arg: r ---->
sw $t0, -204($sp)
#<---- PUSH_PARA 0 #function: quickSort@49 #arg: l ---->
li $v1, 0
sw $v1, -208($sp)
#<---- FUNC_CALL quickSort@49 ---->
#<---- Cancel $a2 for #T341 ---->
sw $a2, 496($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T342 ---->
sw $t0, 500($sp)
addiu $sp, $sp, -212
jal func_label_quickSort
addiu $sp, $sp, 212
#<---- ASSIGN #T343@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T343 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@50 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@50 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@50 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@50 ---->
#<---- Cancel $a2 for #T343 ---->
sw $a2, 504($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T344@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T344 ---->
move $a2, $v0
#<---- PRE_CALL initArr@51 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@51 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@51 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@51 ---->
#<---- Cancel $a2 for #T344 ---->
sw $a2, 508($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T345@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T345 ---->
move $a2, $v0
#<---- PRE_CALL shellSort@52 ---->
#<---- PUSH_PARA total@<1,15> #function: shellSort@52 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -84($sp)
#<---- FUNC_CALL shellSort@52 ---->
#<---- Cancel $a2 for #T345 ---->
sw $a2, 512($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -88
jal func_label_shellSort
addiu $sp, $sp, 88
#<---- ASSIGN #T346@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T346 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@53 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@53 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@53 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@53 ---->
#<---- Cancel $a2 for #T346 ---->
sw $a2, 516($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T347@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T347 ---->
move $a2, $v0
#<---- PRE_CALL initArr@54 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@54 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@54 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@54 ---->
#<---- Cancel $a2 for #T347 ---->
sw $a2, 520($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T348@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T348 ---->
move $a2, $v0
#<---- PRE_CALL mergeSort@55 ---->
#<---- #T349@<1,15> = total@<1,15> SUB 1 ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T349 ---->
addiu $t0, $a3, -1
#<---- PUSH_PARA #T349@<1,15> #function: mergeSort@55 #arg: r ---->
sw $t0, -36($sp)
#<---- PUSH_PARA 0 #function: mergeSort@55 #arg: l ---->
li $v1, 0
sw $v1, -40($sp)
#<---- FUNC_CALL mergeSort@55 ---->
#<---- Cancel $a2 for #T348 ---->
sw $a2, 524($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T349 ---->
sw $t0, 528($sp)
addiu $sp, $sp, -44
jal func_label_mergeSort
addiu $sp, $sp, 44
#<---- ASSIGN #T350@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T350 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@56 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@56 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@56 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@56 ---->
#<---- Cancel $a2 for #T350 ---->
sw $a2, 532($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T351@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T351 ---->
move $a2, $v0
#<---- PRE_CALL initArr@57 ---->
#<---- PUSH_PARA total@<1,15> #function: initArr@57 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -20($sp)
#<---- PUSH_PARA src@<0,0> #function: initArr@57 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -24($sp)
#<---- FUNC_CALL initArr@57 ---->
#<---- Cancel $a2 for #T351 ---->
sw $a2, 536($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -28
jal func_label_initArr
addiu $sp, $sp, 28
#<---- ASSIGN #T352@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T352 ---->
move $a2, $v0
#<---- PRE_CALL quickSort@58 ---->
#<---- #T353@<1,15> = total@<1,15> SUB 1 ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T353 ---->
addiu $t0, $a3, -1
#<---- PUSH_PARA #T353@<1,15> #function: quickSort@58 #arg: r ---->
sw $t0, -204($sp)
#<---- PUSH_PARA 0 #function: quickSort@58 #arg: l ---->
li $v1, 0
sw $v1, -208($sp)
#<---- FUNC_CALL quickSort@58 ---->
#<---- Cancel $a2 for #T352 ---->
sw $a2, 540($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T353 ---->
sw $t0, 544($sp)
addiu $sp, $sp, -212
jal func_label_quickSort
addiu $sp, $sp, 212
#<---- ASSIGN #T354@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T354 ---->
move $a2, $v0
#<---- PRE_CALL checkArr@59 ---->
#<---- PUSH_PARA total@<1,15> #function: checkArr@59 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -168($sp)
#<---- PUSH_PARA src@<0,0> #function: checkArr@59 #arg: arr ---->
li $v1, 0x10010190
sw $v1, -172($sp)
#<---- FUNC_CALL checkArr@59 ---->
#<---- Cancel $a2 for #T354 ---->
sw $a2, 548($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -176
jal func_label_checkArr
addiu $sp, $sp, 176
#<---- ASSIGN #T355@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T355 ---->
move $a2, $v0
#<---- total@<1,15> = input() ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
li $v0, 5
syscall
move $a3, $v0
#<---- PRE_CALL initDouble@60 ---->
#<---- PUSH_PARA total@<1,15> #function: initDouble@60 #arg: total ---->
sw $a3, -24($sp)
#<---- PUSH_PARA matrix@<0,0> #function: initDouble@60 #arg: arr ---->
li $v1, 0x10010000
sw $v1, -28($sp)
#<---- FUNC_CALL initDouble@60 ---->
#<---- Cancel $a2 for #T355 ---->
sw $a2, 552($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -32
jal func_label_initDouble
addiu $sp, $sp, 32
#<---- ASSIGN #T356@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T356 ---->
move $a2, $v0
#<---- PRE_CALL determinant@61 ---->
#<---- PUSH_PARA total@<1,15> #function: determinant@61 #arg: n ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -572($sp)
#<---- PUSH_PARA matrix@<0,0> #function: determinant@61 #arg: in ---->
li $v1, 0x10010000
sw $v1, -576($sp)
#<---- FUNC_CALL determinant@61 ---->
#<---- Cancel $a2 for #T356 ---->
sw $a2, 556($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -580
jal func_label_determinant
addiu $sp, $sp, 580
#<---- ASSIGN #T357@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T357 ---->
move $a2, $v0
#<---- print #T357@<1,15> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str52 ---->
la $a0, str52
li $v0, 4
syscall
#<---- PRE_CALL checkDouble@62 ---->
#<---- PUSH_PARA total@<1,15> #function: checkDouble@62 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -192($sp)
#<---- PUSH_PARA matrix@<0,0> #function: checkDouble@62 #arg: arr ---->
li $v1, 0x10010000
sw $v1, -196($sp)
#<---- FUNC_CALL checkDouble@62 ---->
#<---- Cancel $a2 for #T357 ---->
sw $a2, 560($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -200
jal func_label_checkDouble
addiu $sp, $sp, 200
#<---- ASSIGN #T358@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T358 ---->
move $a2, $v0
#<---- PRE_CALL initDouble@63 ---->
#<---- PUSH_PARA total@<1,15> #function: initDouble@63 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -24($sp)
#<---- PUSH_PARA matrix@<0,0> #function: initDouble@63 #arg: arr ---->
li $v1, 0x10010000
sw $v1, -28($sp)
#<---- FUNC_CALL initDouble@63 ---->
#<---- Cancel $a2 for #T358 ---->
sw $a2, 564($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -32
jal func_label_initDouble
addiu $sp, $sp, 32
#<---- ASSIGN #T359@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T359 ---->
move $a2, $v0
#<---- PRE_CALL determinant@64 ---->
#<---- PUSH_PARA total@<1,15> #function: determinant@64 #arg: n ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -572($sp)
#<---- PUSH_PARA matrix@<0,0> #function: determinant@64 #arg: in ---->
li $v1, 0x10010000
sw $v1, -576($sp)
#<---- FUNC_CALL determinant@64 ---->
#<---- Cancel $a2 for #T359 ---->
sw $a2, 568($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -580
jal func_label_determinant
addiu $sp, $sp, 580
#<---- ASSIGN #T360@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T360 ---->
move $a2, $v0
#<---- print #T360@<1,15> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str53 ---->
la $a0, str53
li $v0, 4
syscall
#<---- PRE_CALL checkDouble@65 ---->
#<---- PUSH_PARA total@<1,15> #function: checkDouble@65 #arg: total ---->
#<---- Alloc $a3 for total ---->
lw $a3, 4($sp)
sw $a3, -192($sp)
#<---- PUSH_PARA matrix@<0,0> #function: checkDouble@65 #arg: arr ---->
li $v1, 0x10010000
sw $v1, -196($sp)
#<---- FUNC_CALL checkDouble@65 ---->
#<---- Cancel $a2 for #T360 ---->
sw $a2, 572($sp)
#<---- Cancel $a3 for total ---->
sw $a3, 4($sp)
addiu $sp, $sp, -200
jal func_label_checkDouble
addiu $sp, $sp, 200
#<---- ASSIGN #T361@<1,15> = %RTX ---->
#<---- Alloc $a2 for #T361 ---->
move $a2, $v0
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,15> ---->
