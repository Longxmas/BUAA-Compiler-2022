.data
array_aaa: .space 8
array_A: .space 48
array__23879: .space 16
array__3u22: .space 16
array_cdwuh: .space 8
array_dijhw: .space 24
str0: .asciiz "   !!! ()*+,-./:;<>=@?^_`{}|~[]  called func: ___\n"
str1: .asciiz "//called func: ____, _arg = "
str2: .asciiz "\n"
str3: .asciiz "called func: __, array[0] = "
str4: .asciiz "\n\n\n"
str5: .asciiz "called func: Main, array[0][0] = "
str6: .asciiz ", array[0][1] = "
str7: .asciiz "\n\n"
str8: .asciiz "\n"
str9: .asciiz "\n"
str10: .asciiz "\n"
str11: .asciiz "20373381\n"
str12: .asciiz "temp: "
str13: .asciiz "\n"
str14: .asciiz " "
str15: .asciiz " "
str16: .asciiz " "
str17: .asciiz " "
str18: .asciiz " "
str19: .asciiz " "
str20: .asciiz " "
str21: .asciiz " "
str22: .asciiz " "
str23: .asciiz "\n"
str24: .asciiz " "
str25: .asciiz " "
str26: .asciiz " "
str27: .asciiz " "
str28: .asciiz " "
str29: .asciiz " "
str30: .asciiz " "
str31: .asciiz " "
str32: .asciiz " "
str33: .asciiz "\n"
str34: .asciiz " "
str35: .asciiz " "
str36: .asciiz " "
str37: .asciiz " "
str38: .asciiz " "
str39: .asciiz " "
str40: .asciiz " "
str41: .asciiz " "
str42: .asciiz " "
str43: .asciiz "\n"
str44: .asciiz " "
str45: .asciiz " "
str46: .asciiz " "
str47: .asciiz " "
str48: .asciiz " "
str49: .asciiz " "
str50: .asciiz " "
str51: .asciiz " "
str52: .asciiz " "
str53: .asciiz "\n"
.text
addi $gp, $gp, 164
#<------- var _1@<0,0> = 4 ------->
li $t0, 4
sw $t0, -164($gp)
#<------- var _3@<0,0> = 64 ------->
li $t0, 64
sw $t0, -160($gp)
#<------- var _____@<0,0> = -49331 ------->
li $t0, -49331
sw $t0, -156($gp)
#<------- var _2@<0,0> = 24 ------->
li $t0, 24
sw $t0, -152($gp)
#<------- var _10@<0,0> = 1040 ------->
li $t0, 1040
sw $t0, -148($gp)
#<------- var aaa@<0,0>[0] = 10086 ------->
li $t0, 10086
sw $t0, array_aaa+0($zero)
#<------- var aaa@<0,0>[1] = 16 ------->
li $t0, 16
sw $t0, array_aaa+4($zero)
#<------- var A@<0,0>[0] = 212132 ------->
li $t0, 212132
sw $t0, array_A+0($zero)
#<------- var A@<0,0>[1] = 76 ------->
li $t0, 76
sw $t0, array_A+4($zero)
#<------- var A@<0,0>[2] = 308 ------->
li $t0, 308
sw $t0, array_A+8($zero)
#<------- var A@<0,0>[3] = 26 ------->
li $t0, 26
sw $t0, array_A+12($zero)
#<------- var A@<0,0>[4] = 57048 ------->
li $t0, 57048
sw $t0, array_A+16($zero)
#<------- var A@<0,0>[5] = 3194880 ------->
li $t0, 3194880
sw $t0, array_A+20($zero)
#<------- var A@<0,0>[6] = 8792 ------->
li $t0, 8792
sw $t0, array_A+24($zero)
#<------- var A@<0,0>[7] = -687331 ------->
li $t0, -687331
sw $t0, array_A+28($zero)
#<------- var A@<0,0>[8] = 908 ------->
li $t0, 908
sw $t0, array_A+32($zero)
#<------- var A@<0,0>[9] = 1040 ------->
li $t0, 1040
sw $t0, array_A+36($zero)
#<------- var A@<0,0>[10] = 136 ------->
li $t0, 136
sw $t0, array_A+40($zero)
#<------- var A@<0,0>[11] = 10104 ------->
li $t0, 10104
sw $t0, array_A+44($zero)
#<------- var hdc33ec_dyu@<0,0> = -597 ------->
li $t0, -597
sw $t0, -88($gp)
#<------- var _3cg@<0,0> = 4491858 ------->
li $t0, 4491858
sw $t0, -84($gp)
#<------- var _23879@<0,0>[0] = 2323 ------->
li $t0, 2323
sw $t0, array__23879+0($zero)
#<------- var _23879@<0,0>[1] = 9254 ------->
li $t0, 9254
sw $t0, array__23879+4($zero)
#<------- var _23879@<0,0>[2] = 0 ------->
#<------- var _23879@<0,0>[3] = -1269906 ------->
li $t0, -1269906
sw $t0, array__23879+12($zero)
#<------- var duhih2_23c@<0,0> = 1983 ------->
li $t0, 1983
sw $t0, -64($gp)
#<------- var cdh3yi_23@<0,0> = 1983 ------->
li $t0, 1983
sw $t0, -60($gp)
#<------- var _3u22@<0,0>[0] = 287 ------->
li $t0, 287
sw $t0, array__3u22+0($zero)
#<------- var _3u22@<0,0>[1] = -98662 ------->
li $t0, -98662
sw $t0, array__3u22+4($zero)
#<------- var _3u22@<0,0>[2] = 287 ------->
li $t0, 287
sw $t0, array__3u22+8($zero)
#<------- var _3u22@<0,0>[3] = 11505 ------->
li $t0, 11505
sw $t0, array__3u22+12($zero)
#<------- var wuei@<0,0> = 0 ------->
#<------- var cdwuh@<0,0> ------->
#<------- var dijhw@<0,0> ------->
#<------- var jdfo_@<0,0> = 0 ------->
addi $sp, $sp, -380
j func_label_main
#<--------------- FUNC __my_Ha_s__h--------------->
func_label___my_Ha_s__h:
#<------- FORM_VAR_DEF _@<1,0> __my_Ha_s__h ------->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF len@<1,0> __my_Ha_s__h ------->
lw $a3, 8($sp)
#<---- var I@<1,0> ---->
#<---- var __@<1,0> ---->
#<---- ASSIGN __@<1,0> = len@<1,0> ---->
addi $t1, $a3, 0
#<---- ASSIGN I@<1,0> = 0 ---->
move $t0, $zero
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a2 for _ ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for len ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for I ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for __ ---->
sw $t1, 16($sp)
while_judge_label_0:
#<---- SET #T0@<1,0> := I@<1,0> < len@<1,0> ---->
lw $a3, 12($sp)
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T0@<1,0> == 0 while_end_label_0 ---->
#<---- Cancel $a2 for #T0 ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for I ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for len ---->
sw $t0, 8($sp)
lw $a2, 20($sp)
beq $a2, 0, while_end_label_0
#<---- NEW_BLOCK <2,0> ---->
#<---- #T1@<2,0> = __@<1,0> ADD 98326464 ---->
lw $a3, 16($sp)
addi $t0, $a3, 98326464
#<---- ASSIGN __@<1,0> = #T1@<2,0> ---->
addi $a3, $t0, 0
#<---- #T2@<2,0> = __@<1,0> MUL 20373381 ---->
li $v1, 20373381
mult $a3, $v1
mflo $t1
#<---- ASSIGN __@<1,0> = #T2@<2,0> ---->
addi $a3, $t1, 0
#<---- #T3@<2,0> = __@<1,0> ADD 23667832 ---->
addi $t2, $a3, 23667832
#<---- ASSIGN __@<1,0> = #T3@<2,0> ---->
addi $a3, $t2, 0
#<---- #T4@<2,0> = __@<1,0> DIV 133 ---->
addi $v1, $zero, 133
div $a3, $v1
mflo $t3
#<---- ASSIGN __@<1,0> = #T4@<2,0> ---->
addi $a3, $t3, 0
#<---- #T5@<2,0> = __@<1,0> ADD 1347887899 ---->
addi $t4, $a3, 1347887899
#<---- ASSIGN __@<1,0> = #T5@<2,0> ---->
addi $a3, $t4, 0
#<---- #T6@<2,0> = __@<1,0> MOD 99998099 ---->
addi $v1, $zero, 99998099
div $a3, $v1
mfhi $t5
#<---- ASSIGN __@<1,0> = #T6@<2,0> ---->
addi $a3, $t5, 0
#<---- #T7@<2,0> = __@<1,0> MUL 123671861 ---->
li $v1, 123671861
mult $a3, $v1
mflo $t6
#<---- #T8@<2,0> = #T7@<2,0> SUB 236234 ---->
addi $t7, $t6, -236234
#<---- #T9@<2,0> = __@<1,0> ADD 135632 ---->
addi $t8, $a3, 135632
#<---- #T10@<2,0> = #T8@<2,0> MUL #T9@<2,0> ---->
mult $t7, $t8
mflo $t9
#<---- #T11@<2,0> = #T10@<2,0> DIV 7 ---->
addi $v1, $zero, 7
div $t9, $v1
mflo $s0
#<---- ASSIGN __@<1,0> = #T11@<2,0> ---->
addi $a3, $s0, 0
#<---- #T12@<2,0> = I@<1,0> ADD 1 ---->
lw $s1, 12($sp)
addi $s2, $s1, 1
#<---- ASSIGN I@<1,0> = #T12@<2,0> ---->
addi $s1, $s2, 0
#<---- END_BLOCK <2,0> ---->
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 for #T0 ---->
sw $a2, 20($sp)
#<---- Cancel $a3 for __ ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for #T1 ---->
sw $t0, 24($sp)
#<---- Cancel $t1 for #T2 ---->
sw $t1, 28($sp)
#<---- Cancel $t2 for #T3 ---->
sw $t2, 32($sp)
#<---- Cancel $t3 for #T4 ---->
sw $t3, 36($sp)
#<---- Cancel $t4 for #T5 ---->
sw $t4, 40($sp)
#<---- Cancel $t5 for #T6 ---->
sw $t5, 44($sp)
#<---- Cancel $t6 for #T7 ---->
sw $t6, 48($sp)
#<---- Cancel $t7 for #T8 ---->
sw $t7, 52($sp)
#<---- Cancel $t8 for #T9 ---->
sw $t8, 56($sp)
#<---- Cancel $t9 for #T10 ---->
sw $t9, 60($sp)
#<---- Cancel $s0 for #T11 ---->
sw $s0, 64($sp)
#<---- Cancel $s1 for I ---->
sw $s1, 12($sp)
#<---- Cancel $s2 for #T12 ---->
sw $s2, 68($sp)
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- return __@<1,0> ---->
lw $a2, 16($sp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,0> ---->
jr $ra
#<--------------- FUNC ___--------------->
func_label____:
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- END_BLOCK <1,1> ---->
jr $ra
#<--------------- FUNC ____--------------->
func_label_____:
#<------- FORM_VAR_DEF _arg@<1,2> ____ ------->
lw $a2, 4($sp)
#<---- #T13@<1,2> = _arg@<1,2> MUL 2 ---->
li $v1, 2
mult $a2, $v1
mflo $a3
#<---- #T14@<1,2> = #T13@<1,2> MUL 3 ---->
li $v1, 3
mult $a3, $v1
mflo $t0
#<---- #T15@<1,2> = #T14@<1,2> DIV 6 ---->
addi $v1, $zero, 6
div $t0, $v1
mflo $t1
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print #T15@<1,2> ---->
move $a0, $t1
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- END_BLOCK <1,2> ---->
jr $ra
#<--------------- FUNC __--------------->
func_label___:
#<------- FORM_VAR_DEF _arr_Ay@<1,3> __ ------->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF useless@<1,3> __ ------->
lw $a3, 8($sp)
#<---- LOAD #T16@<1,3> = _arr_Ay@<1,3>[0] ---->
lw $t0, 0($a2)
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- print #T16@<1,3> ---->
move $a0, $t0
li $v0, 1
syscall
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,3> ---->
jr $ra
#<--------------- FUNC _Main--------------->
func_label__Main:
#<------- FORM_VAR_DEF _arr_Ay@<1,4> _Main ------->
lw $a2, 4($sp)
#<---- LOAD #T17@<1,4> = _arr_Ay@<1,4>[0] ---->
lw $a3, 0($a2)
#<---- LOAD #T18@<1,4> = _arr_Ay@<1,4>[1] ---->
lw $t0, 4($a2)
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- print #T17@<1,4> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- print #T18@<1,4> ---->
move $a0, $t0
li $v0, 1
syscall
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- END_BLOCK <1,4> ---->
jr $ra
#<--------------- FUNC _add_fake--------------->
func_label__add_fake:
#<------- FORM_VAR_DEF a@<1,5> _add_fake ------->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,5> _add_fake ------->
lw $a3, 8($sp)
#<---- #T19@<1,5> = a@<1,5> ADD b@<1,5> ---->
addu $t0, $a2, $a3
#<---- SET #T20@<1,5> := 10186 <= #T19@<1,5> ---->
sge $t1, $t0, 10186
#<---- JUMP_IF #T20@<1,5> == 0 Else_start_label_0 ---->
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T19 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T20 ---->
sw $t1, 16($sp)
lw $a2, 16($sp)
beq $a2, 0, Else_start_label_0
#<---- NEW_BLOCK <2,1> ---->
#<---- #T21@<2,1> = 203 MUL b@<1,5> ---->
lw $a3, 8($sp)
li $v1, 203
mult $v1, $a3
mflo $t0
#<---- #T22@<2,1> = #T21@<2,1> DIV 201 ---->
addi $v1, $zero, 201
div $t0, $v1
mflo $t1
#<---- #T23@<2,1> = a@<1,5> ADD #T22@<2,1> ---->
lw $t2, 4($sp)
addu $t3, $t2, $t1
#<---- return #T23@<2,1> ---->
move $v0, $t3
jr $ra
#<---- END_BLOCK <2,1> ---->
#<---- JUMP ifElse_end_label_0 ---->
#<---- Cancel $a2 for #T20 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T21 ---->
sw $t0, 32($sp)
#<---- Cancel $t1 for #T22 ---->
sw $t1, 36($sp)
#<---- Cancel $t2 for a ---->
sw $t2, 4($sp)
#<---- Cancel $t3 for #T23 ---->
sw $t3, 40($sp)
j ifElse_end_label_0
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- #T24@<1,5> = a@<1,5> ADD b@<1,5> ---->
lw $a2, 8($sp)
lw $a3, 4($sp)
addu $t0, $a3, $a2
#<---- #T25@<1,5> = #T24@<1,5> SUB 10086 ---->
addi $t1, $t0, -10086
#<---- SET #T26@<1,5> := #T25@<1,5> < 12345678 ---->
li $v1, , 12345678
slt $t2, $t1, $v1
#<---- JUMP_IF #T26@<1,5> == 0 Else_start_label_1 ---->
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T24 ---->
sw $t0, 20($sp)
#<---- Cancel $t1 for #T25 ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T26 ---->
sw $t2, 28($sp)
lw $a2, 28($sp)
beq $a2, 0, Else_start_label_1
#<---- NEW_BLOCK <2,2> ---->
#<---- #T27@<2,2> = 1003 MUL a@<1,5> ---->
lw $a3, 4($sp)
li $v1, 1003
mult $v1, $a3
mflo $t0
#<---- #T28@<2,2> = #T27@<2,2> DIV 1009 ---->
addi $v1, $zero, 1009
div $t0, $v1
mflo $t1
#<---- #T29@<2,2> = 2022 MUL b@<1,5> ---->
lw $t2, 8($sp)
li $v1, 2022
mult $v1, $t2
mflo $t3
#<---- #T30@<2,2> = #T29@<2,2> DIV 2019 ---->
addi $v1, $zero, 2019
div $t3, $v1
mflo $t4
#<---- #T31@<2,2> = #T28@<2,2> ADD #T30@<2,2> ---->
addu $t5, $t1, $t4
#<---- return #T31@<2,2> ---->
move $v0, $t5
jr $ra
#<---- END_BLOCK <2,2> ---->
#<---- JUMP ifElse_end_label_1 ---->
#<---- Cancel $a2 for #T26 ---->
sw $a2, 28($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T27 ---->
sw $t0, 44($sp)
#<---- Cancel $t1 for #T28 ---->
sw $t1, 48($sp)
#<---- Cancel $t2 for b ---->
sw $t2, 8($sp)
#<---- Cancel $t3 for #T29 ---->
sw $t3, 52($sp)
#<---- Cancel $t4 for #T30 ---->
sw $t4, 56($sp)
#<---- Cancel $t5 for #T31 ---->
sw $t5, 60($sp)
j ifElse_end_label_1
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- NEW_BLOCK <2,3> ---->
#<---- #T32@<2,3> = a@<1,5> ADD b@<1,5> ---->
lw $a2, 8($sp)
lw $a3, 4($sp)
addu $t0, $a3, $a2
#<---- #T33@<2,3> = #T32@<2,3> SUB 233 ---->
addi $t1, $t0, -233
#<---- return #T33@<2,3> ---->
move $v0, $t1
jr $ra
#<---- END_BLOCK <2,3> ---->
#<---- GEN_LABEL ifElse_end_label_1: ---->
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T32 ---->
sw $t0, 64($sp)
#<---- Cancel $t1 for #T33 ---->
sw $t1, 68($sp)
ifElse_end_label_1:
#<---- GEN_LABEL ifElse_end_label_0: ---->
ifElse_end_label_0:
#<---- return -10086 ---->
li $v0, -10086
jr $ra
#<---- END_BLOCK <1,5> ---->
jr $ra
#<--------------- FUNC _add--------------->
func_label__add:
#<------- FORM_VAR_DEF a@<1,6> _add ------->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,6> _add ------->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF c@<1,6> _add ------->
lw $t0, 12($sp)
#<---- #T34@<1,6> = a@<1,6> ADD b@<1,6> ---->
addu $t1, $a2, $a3
#<---- #T35@<1,6> = #T34@<1,6> ADD c@<1,6> ---->
addu $t2, $t1, $t0
#<---- return #T35@<1,6> ---->
move $v0, $t2
jr $ra
#<---- END_BLOCK <1,6> ---->
jr $ra
#<--------------- FUNC _get_id--------------->
func_label__get_id:
#<---- var _2_wj5qhidw_@<1,7> ---->
#<---- ASSIGN _2_wj5qhidw_@<1,7> = 76 ---->
addi $a2, $zero, 76
#<---- NEW_BLOCK <2,4> ---->
#<---- print _2_wj5qhidw_@<1,7> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- ASSIGN _2_wj5qhidw_@<1,7> = 10086 ---->
addi $a2, $zero, 10086
#<---- print _2_wj5qhidw_@<1,7> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- var _2_wj5qhidw_@<2,4> = -10 ---->
addi $a3, $zero, -10
#<---- print _2_wj5qhidw_@<2,4> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- END_BLOCK <2,4> ---->
#<---- return 20373381 ---->
li $v0, 20373381
jr $ra
#<---- END_BLOCK <1,7> ---->
jr $ra
#<--------------- FUNC _M__a_G_I___c--------------->
func_label__M__a_G_I___c:
#<------- FORM_VAR_DEF num@<1,8> _M__a_G_I___c ------->
lw $a2, 4($sp)
#<---- #T36@<1,8> = num@<1,8> ADD -763835168 ---->
addi $a3, $a2, -763835168
#<---- #T37@<1,8> = #T36@<1,8> MOD 1996325548 ---->
addi $v1, $zero, 1996325548
div $a3, $v1
mfhi $t0
#<---- #T38@<1,8> = #T37@<1,8> MUL 1881457024 ---->
li $v1, 1881457024
mult $t0, $v1
mflo $t1
#<---- #T39@<1,8> = #T38@<1,8> DIV 11 ---->
addi $v1, $zero, 11
div $t1, $v1
mflo $t2
#<---- #T40@<1,8> = #T39@<1,8> MUL 540488577 ---->
li $v1, 540488577
mult $t2, $v1
mflo $t3
#<---- return #T40@<1,8> ---->
move $v0, $t3
jr $ra
#<---- END_BLOCK <1,8> ---->
jr $ra
#<--------------- FUNC main--------------->
func_label_main:
#<---- NEW_BLOCK <2,5> ---->
#<---- NEW_BLOCK <3,0> ---->
#<---- NEW_BLOCK <4,0> ---->
#<---- NEW_BLOCK <5,0> ---->
#<---- END_BLOCK <5,0> ---->
#<---- END_BLOCK <4,0> ---->
#<---- END_BLOCK <3,0> ---->
#<---- END_BLOCK <2,5> ---->
#<---- var a10086__@<1,9> ---->
#<---- var _2233@<1,9> ---->
#<---- var _Int@<1,9> ---->
#<---- var _for___@<1,9> ---->
#<---- var ___2_0_3_7_3_3_8_1___X___J___h_____@<1,9> ---->
#<---- var __array@<1,9>[0] = 1 ---->
li $v1, 1
sw $v1, 24($sp)
#<---- var __array@<1,9>[1] = 2 ---->
li $v1, 2
sw $v1, 28($sp)
#<---- var __array@<1,9>[2] = 3 ---->
li $v1, 3
sw $v1, 32($sp)
#<---- var __array@<1,9>[3] = 4 ---->
li $v1, 4
sw $v1, 36($sp)
#<---- var __array@<1,9>[4] = 5 ---->
li $v1, 5
sw $v1, 40($sp)
#<---- var __array@<1,9>[5] = 6 ---->
li $v1, 6
sw $v1, 44($sp)
#<---- var __array@<1,9>[6] = 7 ---->
li $v1, 7
sw $v1, 48($sp)
#<---- var __array@<1,9>[7] = 8 ---->
li $v1, 8
sw $v1, 52($sp)
#<---- var aaaaa@<1,9> = 10 ---->
addi $t3, $zero, 10
#<---- var bbbbb@<1,9> = 20 ---->
addi $t4, $zero, 20
#<---- var _0@<1,9> = 10 ---->
addi $t5, $zero, 10
#<---- var Main@<1,9> = 1 ---->
addi $t6, $zero, 1
#<---- var _main@<1,9> = 0 ---->
move $t7, $zero
#<---- ___2_0_3_7_3_3_8_1___X___J___h_____@<1,9> = input() ---->
li $v0, 5
syscall
move $t2, $v0
#<---- _for___@<1,9> = input() ---->
li $v0, 5
syscall
move $t1, $v0
#<---- _Int@<1,9> = input() ---->
li $v0, 5
syscall
move $t0, $v0
#<---- _2233@<1,9> = input() ---->
li $v0, 5
syscall
move $a3, $v0
#<---- a10086__@<1,9> = input() ---->
li $v0, 5
syscall
move $a2, $v0
#<---- SET #T41@<1,9> := ___2_0_3_7_3_3_8_1___X___J___h_____@<1,9> == 20373381 ---->
seq $t8, $t2, 20373381
#<---- JUMP_IF #T41@<1,9> == 0 ifElse_end_label_2 ---->
#<---- Cancel $t8 for #T41 ---->
sw $t8, 76($sp)
#<---- Cancel $a2 for a10086__ ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for _2233 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for _Int ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for _for___ ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for ___2_0_3_7_3_3_8_1___X___J___h_____ ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for aaaaa ---->
sw $t3, 56($sp)
#<---- Cancel $t4 for bbbbb ---->
sw $t4, 60($sp)
#<---- Cancel $t5 for _0 ---->
sw $t5, 64($sp)
#<---- Cancel $t6 for Main ---->
sw $t6, 68($sp)
#<---- Cancel $t7 for _main ---->
sw $t7, 72($sp)
lw $a2, 76($sp)
beq $a2, 0, ifElse_end_label_2
#<---- NEW_BLOCK <2,6> ---->
#<---- #T42@<2,6> = Main@<1,9> ADD 1 ---->
lw $a3, 68($sp)
addi $t0, $a3, 1
#<---- ASSIGN Main@<1,9> = #T42@<2,6> ---->
addi $a3, $t0, 0
#<---- #T43@<2,6> = _main@<1,9> ADD 1332 ---->
lw $t1, 72($sp)
addi $t2, $t1, 1332
#<---- ASSIGN _main@<1,9> = #T43@<2,6> ---->
addi $t1, $t2, 0
#<---- END_BLOCK <2,6> ---->
#<---- GEN_LABEL ifElse_end_label_2: ---->
#<---- Cancel $a2 for #T41 ---->
sw $a2, 76($sp)
#<---- Cancel $a3 for Main ---->
sw $a3, 68($sp)
#<---- Cancel $t0 for #T42 ---->
sw $t0, 320($sp)
#<---- Cancel $t1 for _main ---->
sw $t1, 72($sp)
#<---- Cancel $t2 for #T43 ---->
sw $t2, 324($sp)
ifElse_end_label_2:
#<---- SET #T44@<1,9> := 200 < _for___@<1,9> ---->
lw $a3, 16($sp)
sgt $a2, $a3, 200
#<---- JUMP_IF #T44@<1,9> == 0 ifElse_end_label_3 ---->
#<---- Cancel $a2 for #T44 ---->
sw $a2, 80($sp)
#<---- Cancel $a3 for _for___ ---->
sw $a3, 16($sp)
lw $a2, 80($sp)
beq $a2, 0, ifElse_end_label_3
#<---- #T45@<1,9> = Main@<1,9> ADD 1 ---->
lw $a3, 68($sp)
addi $t0, $a3, 1
#<---- ASSIGN Main@<1,9> = #T45@<1,9> ---->
addi $a3, $t0, 0
#<---- GEN_LABEL ifElse_end_label_3: ---->
#<---- Cancel $a2 for #T44 ---->
sw $a2, 80($sp)
#<---- Cancel $a3 for Main ---->
sw $a3, 68($sp)
#<---- Cancel $t0 for #T45 ---->
sw $t0, 84($sp)
ifElse_end_label_3:
#<---- SET #T46@<1,9> := 111 <= _Int@<1,9> ---->
lw $a3, 12($sp)
sge $a2, $a3, 111
#<---- JUMP_IF #T46@<1,9> == 0 ifElse_end_label_4 ---->
#<---- Cancel $a2 for #T46 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for _Int ---->
sw $a3, 12($sp)
lw $a2, 88($sp)
beq $a2, 0, ifElse_end_label_4
#<---- SET #T47@<1,9> := _2233@<1,9> != 2234 ---->
lw $t0, 8($sp)
sne $a3, $t0, 2234
#<---- JUMP_IF #T47@<1,9> == 0 Else_start_label_2 ---->
#<---- Cancel $a2 for #T46 ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for #T47 ---->
sw $a3, 92($sp)
#<---- Cancel $t0 for _2233 ---->
sw $t0, 8($sp)
lw $a2, 92($sp)
beq $a2, 0, Else_start_label_2
#<---- #T48@<1,9> = Main@<1,9> ADD 1 ---->
lw $a3, 68($sp)
addi $t0, $a3, 1
#<---- ASSIGN Main@<1,9> = #T48@<1,9> ---->
addi $a3, $t0, 0
#<---- JUMP ifElse_end_label_5 ---->
#<---- Cancel $a2 for #T47 ---->
sw $a2, 92($sp)
#<---- Cancel $a3 for Main ---->
sw $a3, 68($sp)
#<---- Cancel $t0 for #T48 ---->
sw $t0, 96($sp)
j ifElse_end_label_5
#<---- GEN_LABEL Else_start_label_2: ---->
Else_start_label_2:
#<---- #T49@<1,9> = Main@<1,9> ADD 2729 ---->
lw $a2, 68($sp)
addi $a3, $a2, 2729
#<---- ASSIGN Main@<1,9> = #T49@<1,9> ---->
addi $a2, $a3, 0
#<---- GEN_LABEL ifElse_end_label_5: ---->
#<---- Cancel $a2 for Main ---->
sw $a2, 68($sp)
#<---- Cancel $a3 for #T49 ---->
sw $a3, 100($sp)
ifElse_end_label_5:
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- var sum@<1,9> = 0 ---->
move $a2, $zero
#<---- var j@<1,9> = 0 ---->
move $a3, $zero
#<---- GEN_LABEL while_judge_label_1: ---->
#<---- Cancel $a2 for sum ---->
sw $a2, 104($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 108($sp)
while_judge_label_1:
#<---- NEW_BLOCK <2,7> ---->
#<---- LOAD #T50@<2,7> = aaa@<0,0>[j@<1,9>] ---->
lw $a3, 108($sp)
sll $a1, $a3, 2
lw $a2, array_aaa($a1)
#<---- #T51@<2,7> = sum@<1,9> ADD #T50@<2,7> ---->
lw $t0, 104($sp)
addu $t1, $t0, $a2
#<---- ASSIGN sum@<1,9> = #T51@<2,7> ---->
addi $t0, $t1, 0
#<---- #T52@<2,7> = j@<1,9> ADD 1 ---->
addi $t2, $a3, 1
#<---- ASSIGN j@<1,9> = #T52@<2,7> ---->
addi $a3, $t2, 0
#<---- SET #T53@<2,7> := 2 <= j@<1,9> ---->
sge $t3, $a3, 2
#<---- JUMP_IF #T53@<2,7> == 0 ifElse_end_label_6 ---->
#<---- Cancel $a2 for #T50 ---->
sw $a2, 328($sp)
#<---- Cancel $a3 for j ---->
sw $a3, 108($sp)
#<---- Cancel $t0 for sum ---->
sw $t0, 104($sp)
#<---- Cancel $t1 for #T51 ---->
sw $t1, 332($sp)
#<---- Cancel $t2 for #T52 ---->
sw $t2, 336($sp)
#<---- Cancel $t3 for #T53 ---->
sw $t3, 340($sp)
lw $a2, 340($sp)
beq $a2, 0, ifElse_end_label_6
#<---- NEW_BLOCK <3,1> ---->
#<---- JUMP while_end_label_1 ---->
#<---- Cancel $a2 for #T53 ---->
sw $a2, 340($sp)
j while_end_label_1
#<---- END_BLOCK <3,1> ---->
#<---- GEN_LABEL ifElse_end_label_6: ---->
ifElse_end_label_6:
#<---- END_BLOCK <2,7> ---->
#<---- JUMP while_judge_label_1 ---->
j while_judge_label_1
#<---- GEN_LABEL while_end_label_1: ---->
while_end_label_1:
#<---- var k@<1,9> = 0 ---->
move $a2, $zero
#<---- var array@<1,9> ---->
#<---- GEN_LABEL while_judge_label_2: ---->
#<---- Cancel $a2 for k ---->
sw $a2, 112($sp)
while_judge_label_2:
#<---- NEW_BLOCK <2,8> ---->
#<---- SAVE array@<1,9>[k@<1,9>] = 0 ---->
lw $a2, 112($sp)
sll $a1, $a2, 2
li $v1, 0
addi $v0, $sp, 116
add $v0, $v0, $a1
sw $v1, 0($v0)
#<---- SET #T54@<2,8> := k@<1,9> == 5 ---->
seq $a3, $a2, 5
#<---- JUMP_IF #T54@<2,8> == 0 ifElse_end_label_7 ---->
#<---- Cancel $a2 for k ---->
sw $a2, 112($sp)
#<---- Cancel $a3 for #T54 ---->
sw $a3, 344($sp)
lw $a2, 344($sp)
beq $a2, 0, ifElse_end_label_7
#<---- NEW_BLOCK <3,2> ---->
#<---- #T55@<3,2> = k@<1,9> ADD 1 ---->
lw $a3, 112($sp)
addi $t0, $a3, 1
#<---- ASSIGN k@<1,9> = #T55@<3,2> ---->
addi $a3, $t0, 0
#<---- JUMP while_judge_label_2 ---->
#<---- Cancel $a2 for #T54 ---->
sw $a2, 344($sp)
#<---- Cancel $a3 for k ---->
sw $a3, 112($sp)
#<---- Cancel $t0 for #T55 ---->
sw $t0, 368($sp)
j while_judge_label_2
#<---- END_BLOCK <3,2> ---->
#<---- GEN_LABEL ifElse_end_label_7: ---->
ifElse_end_label_7:
#<---- SET #T56@<2,8> := 10 < k@<1,9> ---->
lw $a3, 112($sp)
sgt $a2, $a3, 10
#<---- JUMP_IF #T56@<2,8> == 0 ifElse_end_label_8 ---->
#<---- Cancel $a2 for #T56 ---->
sw $a2, 348($sp)
#<---- Cancel $a3 for k ---->
sw $a3, 112($sp)
lw $a2, 348($sp)
beq $a2, 0, ifElse_end_label_8
#<---- NEW_BLOCK <3,3> ---->
#<---- JUMP while_end_label_2 ---->
#<---- Cancel $a2 for #T56 ---->
sw $a2, 348($sp)
j while_end_label_2
#<---- END_BLOCK <3,3> ---->
#<---- GEN_LABEL ifElse_end_label_8: ---->
ifElse_end_label_8:
#<---- SAVE array@<1,9>[k@<1,9>] = k@<1,9> ---->
lw $a2, 112($sp)
sll $a1, $a2, 2
addi $v1, $sp, 116
add $v1, $v1, $a1
sw $a2, 0($v1)
#<---- #T57@<2,8> = k@<1,9> ADD 1 ---->
addi $a3, $a2, 1
#<---- ASSIGN k@<1,9> = #T57@<2,8> ---->
addi $a2, $a3, 0
#<---- #T58@<2,8> = k@<1,9> MUL k@<1,9> ---->
mult $a2, $a2
mflo $t0
#<---- #T59@<2,8> = sum@<1,9> ADD #T58@<2,8> ---->
lw $t1, 104($sp)
addu $t2, $t1, $t0
#<---- ASSIGN sum@<1,9> = #T59@<2,8> ---->
addi $t1, $t2, 0
#<---- #T60@<2,8> = Main@<1,9> ADD 1 ---->
lw $t3, 68($sp)
addi $t4, $t3, 1
#<---- ASSIGN Main@<1,9> = #T60@<2,8> ---->
addi $t3, $t4, 0
#<---- END_BLOCK <2,8> ---->
#<---- JUMP while_judge_label_2 ---->
#<---- Cancel $a2 for k ---->
sw $a2, 112($sp)
#<---- Cancel $a3 for #T57 ---->
sw $a3, 352($sp)
#<---- Cancel $t0 for #T58 ---->
sw $t0, 356($sp)
#<---- Cancel $t1 for sum ---->
sw $t1, 104($sp)
#<---- Cancel $t2 for #T59 ---->
sw $t2, 360($sp)
#<---- Cancel $t3 for Main ---->
sw $t3, 68($sp)
#<---- Cancel $t4 for #T60 ---->
sw $t4, 364($sp)
j while_judge_label_2
#<---- GEN_LABEL while_end_label_2: ---->
while_end_label_2:
#<---- var temp@<1,9> = 0 ---->
move $a2, $zero
#<---- NEW_BLOCK <2,9> ---->
#<---- #T61@<2,9> = temp@<1,9> ADD 1 ---->
addi $a3, $a2, 1
#<---- ASSIGN temp@<1,9> = #T61@<2,9> ---->
addi $a2, $a3, 0
#<---- END_BLOCK <2,9> ---->
#<---- GEN_LABEL ifElse_end_label_9: ---->
#<---- Cancel $a2 for temp ---->
sw $a2, 164($sp)
#<---- Cancel $a3 for #T61 ---->
sw $a3, 372($sp)
ifElse_end_label_9:
#<---- JUMP ifElse_end_label_10 ---->
j ifElse_end_label_10
#<---- NEW_BLOCK <2,10> ---->
#<---- #T62@<2,10> = temp@<1,9> ADD 2 ---->
lw $a2, 164($sp)
addi $a3, $a2, 2
#<---- ASSIGN temp@<1,9> = #T62@<2,10> ---->
addi $a2, $a3, 0
#<---- END_BLOCK <2,10> ---->
#<---- GEN_LABEL ifElse_end_label_10: ---->
#<---- Cancel $a2 for temp ---->
sw $a2, 164($sp)
#<---- Cancel $a3 for #T62 ---->
sw $a3, 376($sp)
ifElse_end_label_10:
#<---- #T63@<1,9> = input() ---->
lw $a2, 168($sp)
li $v0, 5
syscall
move $a2, $v0
#<---- SAVE dijhw@<0,0>[0] = #T63@<1,9> ---->
sw $a2, array_dijhw+0
#<---- #T64@<1,9> = input() ---->
lw $a3, 172($sp)
li $v0, 5
syscall
move $a3, $v0
#<---- SAVE dijhw@<0,0>[2] = #T64@<1,9> ---->
sw $a3, array_dijhw+8
#<---- #T65@<1,9> = input() ---->
lw $t0, 176($sp)
li $v0, 5
syscall
move $t0, $v0
#<---- SAVE dijhw@<0,0>[4] = #T65@<1,9> ---->
sw $t0, array_dijhw+16
#<---- #T66@<1,9> = input() ---->
lw $t1, 180($sp)
li $v0, 5
syscall
move $t1, $v0
#<---- SAVE cdwuh@<0,0>[0] = #T66@<1,9> ---->
sw $t1, array_cdwuh+0
#<---- #T67@<1,9> = input() ---->
lw $t2, 184($sp)
li $v0, 5
syscall
move $t2, $v0
#<---- SAVE cdwuh@<0,0>[1] = #T67@<1,9> ---->
sw $t2, array_cdwuh+4
#<---- wuei@<0,0> = input() ---->
lw $t3, -40($gp)
li $v0, 5
syscall
move $t3, $v0
sw $v0, -40($gp)
#<---- LOAD #T68@<1,9> = cdwuh@<0,0>[0] ---->
lw $t4, array_cdwuh+0
#<---- LOAD #T69@<1,9> = cdwuh@<0,0>[1] ---->
lw $t5, array_cdwuh+4
#<---- #T70@<1,9> = #T68@<1,9> MUL #T69@<1,9> ---->
mult $t4, $t5
mflo $t6
#<---- #T71@<1,9> = wuei@<0,0> ADD #T70@<1,9> ---->
addu $t7, $t3, $t6
#<---- LOAD #T72@<1,9> = dijhw@<0,0>[1] ---->
lw $t8, array_dijhw+4
#<---- #T73@<1,9> = #T72@<1,9> DIV 2 ---->
addi $v1, $zero, 2
div $t8, $v1
mflo $t9
#<---- #T74@<1,9> = #T71@<1,9> ADD #T73@<1,9> ---->
addu $s0, $t7, $t9
#<---- ASSIGN wuei@<0,0> = #T74@<1,9> ---->
addi $t3, $s0, 0
#<---- Cancel $t3 for wuei ---->
sw $t3, -40($gp)
#<---- LOAD #T75@<1,9> = dijhw@<0,0>[4] ---->
lw $t3, array_dijhw+16
#<---- LOAD #T76@<1,9> = dijhw@<0,0>[2] ---->
lw $s1, array_dijhw+8
#<---- #T77@<1,9> = #T75@<1,9> MUL #T76@<1,9> ---->
mult $t3, $s1
mflo $s2
#<---- SAVE dijhw@<0,0>[5] = #T77@<1,9> ---->
sw $s2, array_dijhw+20
#<---- #T78@<1,9> = sum@<1,9> MUL sum@<1,9> ---->
lw $s3, 104($sp)
mult $s3, $s3
mflo $s4
#<---- PRE_CALL _add@0 ---->
#<---- PUSH_PARA 10 #function: _add@0 #arg: a ---->
li $v1, 10
sw $v1, -20($sp)
#<---- PUSH_PARA 20 #function: _add@0 #arg: b ---->
li $v1, 20
sw $v1, -16($sp)
#<---- PUSH_PARA 3 #function: _add@0 #arg: c ---->
li $v1, 3
sw $v1, -12($sp)
#<---- FUNC_CALL _add@0 ---->
#<---- Cancel $a2 for #T63 ---->
sw $a2, 168($sp)
#<---- Cancel $a3 for #T64 ---->
sw $a3, 172($sp)
#<---- Cancel $t0 for #T65 ---->
sw $t0, 176($sp)
#<---- Cancel $t1 for #T66 ---->
sw $t1, 180($sp)
#<---- Cancel $t2 for #T67 ---->
sw $t2, 184($sp)
#<---- Cancel $t3 for #T75 ---->
sw $t3, 216($sp)
#<---- Cancel $t4 for #T68 ---->
sw $t4, 188($sp)
#<---- Cancel $t5 for #T69 ---->
sw $t5, 192($sp)
#<---- Cancel $t6 for #T70 ---->
sw $t6, 196($sp)
#<---- Cancel $t7 for #T71 ---->
sw $t7, 200($sp)
#<---- Cancel $t8 for #T72 ---->
sw $t8, 204($sp)
#<---- Cancel $t9 for #T73 ---->
sw $t9, 208($sp)
#<---- Cancel $s0 for #T74 ---->
sw $s0, 212($sp)
#<---- Cancel $s1 for #T76 ---->
sw $s1, 220($sp)
#<---- Cancel $s2 for #T77 ---->
sw $s2, 224($sp)
#<---- Cancel $s3 for sum ---->
sw $s3, 104($sp)
#<---- Cancel $s4 for #T78 ---->
sw $s4, 228($sp)
addi $sp, $sp, -24
jal func_label__add
addi $sp, $sp, 24
#<---- ASSIGN #T79@<1,9> = %RTX ---->
move $a2, $v0
#<---- #T80@<1,9> = #T78@<1,9> ADD #T79@<1,9> ---->
lw $a3, 228($sp)
addu $t0, $a3, $a2
#<---- ASSIGN jdfo_@<0,0> = #T80@<1,9> ---->
addi $t1, $t0, 0
#<---- Cancel $t1 for jdfo_ ---->
sw $t1, -4($gp)
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- PRE_CALL _get_id@1 ---->
#<---- FUNC_CALL _get_id@1 ---->
#<---- Cancel $a2 for #T79 ---->
sw $a2, 232($sp)
#<---- Cancel $a3 for #T78 ---->
sw $a3, 228($sp)
#<---- Cancel $t0 for #T80 ---->
sw $t0, 236($sp)
addi $sp, $sp, -12
jal func_label__get_id
addi $sp, $sp, 12
#<---- ASSIGN #T81@<1,9> = %RTX ---->
move $a2, $v0
#<---- #T82@<1,9> = sum@<1,9> ADD #T81@<1,9> ---->
lw $a3, 104($sp)
addu $t0, $a3, $a2
#<---- PRE_CALL _add_fake@2 ---->
#<---- PUSH_PARA 123243 #function: _add_fake@2 #arg: a ---->
li $v1, 123243
sw $v1, -68($sp)
#<---- PUSH_PARA ___2_0_3_7_3_3_8_1___X___J___h_____@<1,9> #function: _add_fake@2 #arg: b ---->
lw $t1, 20($sp)
sw $t1, -64($sp)
#<---- FUNC_CALL _add_fake@2 ---->
#<---- Cancel $a2 for #T81 ---->
sw $a2, 240($sp)
#<---- Cancel $a3 for sum ---->
sw $a3, 104($sp)
#<---- Cancel $t0 for #T82 ---->
sw $t0, 244($sp)
#<---- Cancel $t1 for ___2_0_3_7_3_3_8_1___X___J___h_____ ---->
sw $t1, 20($sp)
addi $sp, $sp, -72
jal func_label__add_fake
addi $sp, $sp, 72
#<---- ASSIGN #T83@<1,9> = %RTX ---->
move $a2, $v0
#<---- #T84@<1,9> = #T82@<1,9> ADD #T83@<1,9> ---->
lw $a3, 244($sp)
addu $t0, $a3, $a2
#<---- ASSIGN sum@<1,9> = #T84@<1,9> ---->
addi $t1, $t0, 0
#<---- PRE_CALL ___@3 ---->
#<---- FUNC_CALL ___@3 ---->
#<---- Cancel $a2 for #T83 ---->
sw $a2, 248($sp)
#<---- Cancel $a3 for #T82 ---->
sw $a3, 244($sp)
#<---- Cancel $t0 for #T84 ---->
sw $t0, 252($sp)
#<---- Cancel $t1 for sum ---->
sw $t1, 104($sp)
addi $sp, $sp, -4
jal func_label____
addi $sp, $sp, 4
#<---- ASSIGN #T85@<1,9> = %RTX ---->
move $a2, $v0
#<---- PRE_CALL _Main@4 ---->
#<---- PUSH_PARA _3u22@<0,0> #function: _Main@4 #arg: _arr_Ay ---->
li $v1, 0x10010048
sw $v1, -12($sp)
#<---- FUNC_CALL _Main@4 ---->
#<---- Cancel $a2 for #T85 ---->
sw $a2, 256($sp)
addi $sp, $sp, -16
jal func_label__Main
addi $sp, $sp, 16
#<---- ASSIGN #T86@<1,9> = %RTX ---->
move $a2, $v0
#<---- PRE_CALL __@5 ---->
#<---- PUSH_PARA _23879@<0,0> #function: __@5 #arg: _arr_Ay ---->
li $v1, 0x10010038
sw $v1, -12($sp)
#<---- PUSH_PARA 3432 #function: __@5 #arg: useless ---->
li $v1, 3432
sw $v1, -8($sp)
#<---- FUNC_CALL __@5 ---->
#<---- Cancel $a2 for #T86 ---->
sw $a2, 260($sp)
addi $sp, $sp, -16
jal func_label___
addi $sp, $sp, 16
#<---- ASSIGN #T87@<1,9> = %RTX ---->
move $a2, $v0
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- print temp@<1,9> ---->
lw $a3, 164($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- PRE_CALL __my_Ha_s__h@6 ---->
#<---- PUSH_PARA array@<1,9> #function: __my_Ha_s__h@6 #arg: _ ---->
addi $v1, $sp, 116
sw $v1, -68($sp)
#<---- PUSH_PARA 12 #function: __my_Ha_s__h@6 #arg: len ---->
li $v1, 12
sw $v1, -64($sp)
#<---- FUNC_CALL __my_Ha_s__h@6 ---->
#<---- Cancel $a2 for #T87 ---->
sw $a2, 264($sp)
#<---- Cancel $a3 for temp ---->
sw $a3, 164($sp)
addi $sp, $sp, -72
jal func_label___my_Ha_s__h
addi $sp, $sp, 72
#<---- ASSIGN #T88@<1,9> = %RTX ---->
move $a2, $v0
#<---- LOAD #T89@<1,9> = dijhw@<0,0>[0] ---->
lw $a3, array_dijhw+0
#<---- LOAD #T90@<1,9> = dijhw@<0,0>[1] ---->
lw $t0, array_dijhw+4
#<---- LOAD #T91@<1,9> = dijhw@<0,0>[2] ---->
lw $t1, array_dijhw+8
#<---- LOAD #T92@<1,9> = dijhw@<0,0>[3] ---->
lw $t2, array_dijhw+12
#<---- LOAD #T93@<1,9> = dijhw@<0,0>[4] ---->
lw $t3, array_dijhw+16
#<---- LOAD #T94@<1,9> = dijhw@<0,0>[5] ---->
lw $t4, array_dijhw+20
#<---- LOAD #T95@<1,9> = cdwuh@<0,0>[0] ---->
lw $t5, array_cdwuh+0
#<---- LOAD #T96@<1,9> = cdwuh@<0,0>[1] ---->
lw $t6, array_cdwuh+4
#<---- PRE_CALL _M__a_G_I___c@7 ---->
#<---- PRE_CALL __my_Ha_s__h@8 ---->
#<---- PUSH_PARA cdwuh@<0,0> #function: __my_Ha_s__h@8 #arg: _ ---->
li $v1, 0x10010058
sw $v1, -96($sp)
#<---- PUSH_PARA 2 #function: __my_Ha_s__h@8 #arg: len ---->
li $v1, 2
sw $v1, -92($sp)
#<---- FUNC_CALL __my_Ha_s__h@8 ---->
#<---- Cancel $a2 for #T88 ---->
sw $a2, 268($sp)
#<---- Cancel $a3 for #T89 ---->
sw $a3, 272($sp)
#<---- Cancel $t0 for #T90 ---->
sw $t0, 276($sp)
#<---- Cancel $t1 for #T91 ---->
sw $t1, 280($sp)
#<---- Cancel $t2 for #T92 ---->
sw $t2, 284($sp)
#<---- Cancel $t3 for #T93 ---->
sw $t3, 288($sp)
#<---- Cancel $t4 for #T94 ---->
sw $t4, 292($sp)
#<---- Cancel $t5 for #T95 ---->
sw $t5, 296($sp)
#<---- Cancel $t6 for #T96 ---->
sw $t6, 300($sp)
addi $sp, $sp, -100
jal func_label___my_Ha_s__h
addi $sp, $sp, 100
#<---- ASSIGN #T97@<1,9> = %RTX ---->
move $a2, $v0
#<---- PUSH_PARA #T97@<1,9> #function: _M__a_G_I___c@7 #arg: num ---->
sw $a2, -24($sp)
#<---- FUNC_CALL _M__a_G_I___c@7 ---->
#<---- Cancel $a2 for #T97 ---->
sw $a2, 304($sp)
addi $sp, $sp, -28
jal func_label__M__a_G_I___c
addi $sp, $sp, 28
#<---- ASSIGN #T98@<1,9> = %RTX ---->
move $a2, $v0
#<---- PRE_CALL __my_Ha_s__h@9 ---->
#<---- PUSH_PARA _3u22@<0,0>[0] #function: __my_Ha_s__h@9 #arg: _ ---->
li $v1, 0x10010048
sw $v1, -68($sp)
#<---- PUSH_PARA 2 #function: __my_Ha_s__h@9 #arg: len ---->
li $v1, 2
sw $v1, -64($sp)
#<---- FUNC_CALL __my_Ha_s__h@9 ---->
#<---- Cancel $a2 for #T98 ---->
sw $a2, 308($sp)
addi $sp, $sp, -72
jal func_label___my_Ha_s__h
addi $sp, $sp, 72
#<---- ASSIGN #T99@<1,9> = %RTX ---->
move $a2, $v0
#<---- print #T88@<1,9> ---->
lw $a3, 268($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str14 ---->
la $a0, str14
li $v0, 4
syscall
#<---- print sum@<1,9> ---->
lw $t0, 104($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str15 ---->
la $a0, str15
li $v0, 4
syscall
#<---- print 1 ---->
li $a0, 1
li $v0, 1
syscall
#<---- print #str16 ---->
la $a0, str16
li $v0, 4
syscall
#<---- print 64 ---->
li $a0, 64
li $v0, 1
syscall
#<---- print #str17 ---->
la $a0, str17
li $v0, 4
syscall
#<---- print 24 ---->
li $a0, 24
li $v0, 1
syscall
#<---- print #str18 ---->
la $a0, str18
li $v0, 4
syscall
#<---- print 1040 ---->
li $a0, 1040
li $v0, 1
syscall
#<---- print #str19 ---->
la $a0, str19
li $v0, 4
syscall
#<---- print 10086 ---->
li $a0, 10086
li $v0, 1
syscall
#<---- print #str20 ---->
la $a0, str20
li $v0, 4
syscall
#<---- print 16 ---->
li $a0, 16
li $v0, 1
syscall
#<---- print #str21 ---->
la $a0, str21
li $v0, 4
syscall
#<---- print 212132 ---->
li $a0, 212132
li $v0, 1
syscall
#<---- print #str22 ---->
la $a0, str22
li $v0, 4
syscall
#<---- print 76 ---->
li $a0, 76
li $v0, 1
syscall
#<---- print #str23 ---->
la $a0, str23
li $v0, 4
syscall
#<---- print 308 ---->
li $a0, 308
li $v0, 1
syscall
#<---- print #str24 ---->
la $a0, str24
li $v0, 4
syscall
#<---- print 26 ---->
li $a0, 26
li $v0, 1
syscall
#<---- print #str25 ---->
la $a0, str25
li $v0, 4
syscall
#<---- print 57048 ---->
li $a0, 57048
li $v0, 1
syscall
#<---- print #str26 ---->
la $a0, str26
li $v0, 4
syscall
#<---- print 3194880 ---->
li $a0, 3194880
li $v0, 1
syscall
#<---- print #str27 ---->
la $a0, str27
li $v0, 4
syscall
#<---- print 8792 ---->
li $a0, 8792
li $v0, 1
syscall
#<---- print #str28 ---->
la $a0, str28
li $v0, 4
syscall
#<---- print -687331 ---->
li $a0, -687331
li $v0, 1
syscall
#<---- print #str29 ---->
la $a0, str29
li $v0, 4
syscall
#<---- print 908 ---->
li $a0, 908
li $v0, 1
syscall
#<---- print #str30 ---->
la $a0, str30
li $v0, 4
syscall
#<---- print 1040 ---->
li $a0, 1040
li $v0, 1
syscall
#<---- print #str31 ---->
la $a0, str31
li $v0, 4
syscall
#<---- print 136 ---->
li $a0, 136
li $v0, 1
syscall
#<---- print #str32 ---->
la $a0, str32
li $v0, 4
syscall
#<---- print 10104 ---->
li $a0, 10104
li $v0, 1
syscall
#<---- print #str33 ---->
la $a0, str33
li $v0, 4
syscall
#<---- print _3cg@<0,0> ---->
lw $t1, -84($gp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str34 ---->
la $a0, str34
li $v0, 4
syscall
#<---- print hdc33ec_dyu@<0,0> ---->
lw $t2, -88($gp)
move $a0, $t2
li $v0, 1
syscall
#<---- print #str35 ---->
la $a0, str35
li $v0, 4
syscall
#<---- print cdh3yi_23@<0,0> ---->
lw $t3, -60($gp)
move $a0, $t3
li $v0, 1
syscall
#<---- print #str36 ---->
la $a0, str36
li $v0, 4
syscall
#<---- print duhih2_23c@<0,0> ---->
lw $t4, -64($gp)
move $a0, $t4
li $v0, 1
syscall
#<---- print #str37 ---->
la $a0, str37
li $v0, 4
syscall
#<---- print #T89@<1,9> ---->
lw $t5, 272($sp)
move $a0, $t5
li $v0, 1
syscall
#<---- print #str38 ---->
la $a0, str38
li $v0, 4
syscall
#<---- print #T90@<1,9> ---->
lw $t6, 276($sp)
move $a0, $t6
li $v0, 1
syscall
#<---- print #str39 ---->
la $a0, str39
li $v0, 4
syscall
#<---- print #T91@<1,9> ---->
lw $t7, 280($sp)
move $a0, $t7
li $v0, 1
syscall
#<---- print #str40 ---->
la $a0, str40
li $v0, 4
syscall
#<---- print #T92@<1,9> ---->
lw $t8, 284($sp)
move $a0, $t8
li $v0, 1
syscall
#<---- print #str41 ---->
la $a0, str41
li $v0, 4
syscall
#<---- print #T93@<1,9> ---->
lw $t9, 288($sp)
move $a0, $t9
li $v0, 1
syscall
#<---- print #str42 ---->
la $a0, str42
li $v0, 4
syscall
#<---- print #T94@<1,9> ---->
lw $s0, 292($sp)
move $a0, $s0
li $v0, 1
syscall
#<---- print #str43 ---->
la $a0, str43
li $v0, 4
syscall
#<---- print #T95@<1,9> ---->
lw $s1, 296($sp)
move $a0, $s1
li $v0, 1
syscall
#<---- print #str44 ---->
la $a0, str44
li $v0, 4
syscall
#<---- print #T96@<1,9> ---->
lw $s2, 300($sp)
move $a0, $s2
li $v0, 1
syscall
#<---- print #str45 ---->
la $a0, str45
li $v0, 4
syscall
#<---- print wuei@<0,0> ---->
lw $s3, -40($gp)
move $a0, $s3
li $v0, 1
syscall
#<---- print #str46 ---->
la $a0, str46
li $v0, 4
syscall
#<---- print jdfo_@<0,0> ---->
lw $s4, -4($gp)
move $a0, $s4
li $v0, 1
syscall
#<---- print #str47 ---->
la $a0, str47
li $v0, 4
syscall
#<---- print #T98@<1,9> ---->
lw $s5, 308($sp)
move $a0, $s5
li $v0, 1
syscall
#<---- print #str48 ---->
la $a0, str48
li $v0, 4
syscall
#<---- print #T99@<1,9> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str49 ---->
la $a0, str49
li $v0, 4
syscall
#<---- print _main@<1,9> ---->
lw $s6, 72($sp)
move $a0, $s6
li $v0, 1
syscall
#<---- print #str50 ---->
la $a0, str50
li $v0, 4
syscall
#<---- print _0@<1,9> ---->
lw $s7, 64($sp)
move $a0, $s7
li $v0, 1
syscall
#<---- print #str51 ---->
la $a0, str51
li $v0, 4
syscall
#<---- print a10086__@<1,9> ---->
lw $fp, 4($sp)
move $a0, $fp
li $v0, 1
syscall
#<---- print #str52 ---->
la $a0, str52
li $v0, 4
syscall
#<---- print 3 ---->
li $a0, 3
li $v0, 1
syscall
#<---- print #str53 ---->
la $a0, str53
li $v0, 4
syscall
#<---- PRE_CALL ____@10 ---->
#<---- PUSH_PARA Main@<1,9> #function: ____@10 #arg: _arg ---->
#<---- Cancel $a2 for #T99 ---->
sw $a2, 312($sp)
lw $a2, 68($sp)
sw $a2, -16($sp)
#<---- FUNC_CALL ____@10 ---->
#<---- Cancel $a2 for Main ---->
sw $a2, 68($sp)
#<---- Cancel $a3 for #T88 ---->
sw $a3, 268($sp)
#<---- Cancel $t0 for sum ---->
sw $t0, 104($sp)
#<---- Cancel $t1 for _3cg ---->
sw $t1, -84($gp)
#<---- Cancel $t2 for hdc33ec_dyu ---->
sw $t2, -88($gp)
#<---- Cancel $t3 for cdh3yi_23 ---->
sw $t3, -60($gp)
#<---- Cancel $t4 for duhih2_23c ---->
sw $t4, -64($gp)
#<---- Cancel $t5 for #T89 ---->
sw $t5, 272($sp)
#<---- Cancel $t6 for #T90 ---->
sw $t6, 276($sp)
#<---- Cancel $t7 for #T91 ---->
sw $t7, 280($sp)
#<---- Cancel $t8 for #T92 ---->
sw $t8, 284($sp)
#<---- Cancel $t9 for #T93 ---->
sw $t9, 288($sp)
#<---- Cancel $s0 for #T94 ---->
sw $s0, 292($sp)
#<---- Cancel $s1 for #T95 ---->
sw $s1, 296($sp)
#<---- Cancel $s2 for #T96 ---->
sw $s2, 300($sp)
#<---- Cancel $s3 for wuei ---->
sw $s3, -40($gp)
#<---- Cancel $s4 for jdfo_ ---->
sw $s4, -4($gp)
#<---- Cancel $s5 for #T98 ---->
sw $s5, 308($sp)
#<---- Cancel $s6 for _main ---->
sw $s6, 72($sp)
#<---- Cancel $s7 for _0 ---->
sw $s7, 64($sp)
#<---- Cancel $fp for a10086__ ---->
sw $fp, 4($sp)
addi $sp, $sp, -20
jal func_label_____
addi $sp, $sp, 20
#<---- ASSIGN #T100@<1,9> = %RTX ---->
move $a2, $v0
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,9> ---->
