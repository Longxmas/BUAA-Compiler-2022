.data
array_aaa_: .space 8
array_A_: .space 48
array__23879_: .space 16
array_dijhw_: .space 24
array_cdwuh_: .space 8
array__3u22_: .space 16
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
str11: .asciiz "temp: "
str12: .asciiz "\n"
str13: .asciiz "my_hash = "
str14: .asciiz "\n"
str15: .asciiz "magic = "
str16: .asciiz "\n"
str17: .asciiz "magic_first = "
str18: .asciiz "\n"
str19: .asciiz "magic_second = "
str20: .asciiz "\n"
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
sw $t0, array_aaa_
#<------- var aaa@<0,0>[1] = 16 ------->
li $t0, 16
sw $t0, array_aaa_+4
#<------- var A@<0,0>[0] = 212132 ------->
li $t0, 212132
sw $t0, array_A_
#<------- var A@<0,0>[1] = 76 ------->
li $t0, 76
sw $t0, array_A_+4
#<------- var A@<0,0>[2] = 308 ------->
li $t0, 308
sw $t0, array_A_+8
#<------- var A@<0,0>[3] = 26 ------->
li $t0, 26
sw $t0, array_A_+12
#<------- var A@<0,0>[4] = 57048 ------->
li $t0, 57048
sw $t0, array_A_+16
#<------- var A@<0,0>[5] = 3194880 ------->
li $t0, 3194880
sw $t0, array_A_+20
#<------- var A@<0,0>[6] = 8792 ------->
li $t0, 8792
sw $t0, array_A_+24
#<------- var A@<0,0>[7] = -687331 ------->
li $t0, -687331
sw $t0, array_A_+28
#<------- var A@<0,0>[8] = 908 ------->
li $t0, 908
sw $t0, array_A_+32
#<------- var A@<0,0>[9] = 1040 ------->
li $t0, 1040
sw $t0, array_A_+36
#<------- var A@<0,0>[10] = 136 ------->
li $t0, 136
sw $t0, array_A_+40
#<------- var A@<0,0>[11] = 10104 ------->
li $t0, 10104
sw $t0, array_A_+44
#<------- var _3cg@<0,0> = 4491858 ------->
li $t0, 4491858
sw $t0, -88($gp)
#<------- var hdc33ec_dyu@<0,0> = -597 ------->
li $t0, -597
sw $t0, -84($gp)
#<------- var cdh3yi_23@<0,0> = 0 ------->
#<------- var duhih2_23c@<0,0> = 1983 ------->
li $t0, 1983
sw $t0, -76($gp)
#<------- var _23879@<0,0>[0] = 2323 ------->
li $t0, 2323
sw $t0, array__23879_
#<------- var _23879@<0,0>[1] = 9254 ------->
li $t0, 9254
sw $t0, array__23879_+4
#<------- var _23879@<0,0>[2] = 0 ------->
#<------- var _23879@<0,0>[3] = -1269906 ------->
li $t0, -1269906
sw $t0, array__23879_+12
#<------- var dijhw@<0,0> ------->
#<------- var cdwuh@<0,0> ------->
#<------- var wuei@<0,0> = 0 ------->
#<------- var _3u22@<0,0>[0] = 287 ------->
li $t0, 287
sw $t0, array__3u22_
#<------- var _3u22@<0,0>[1] = -98662 ------->
li $t0, -98662
sw $t0, array__3u22_+4
#<------- var _3u22@<0,0>[2] = 287 ------->
li $t0, 287
sw $t0, array__3u22_+8
#<------- var _3u22@<0,0>[3] = 11505 ------->
li $t0, 11505
sw $t0, array__3u22_+12
#<------- var jdfo_@<0,0> = 0 ------->
addiu $sp, $sp, -20
j func_label_main
#<--------------- FUNC __my_Ha_s__h--------------->
func_label___my_Ha_s__h:
#<------- FORM_VAR_DEF _@<1,0> __my_Ha_s__h ------->
#<---- Alloc $a2 for _ ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF len@<1,0> __my_Ha_s__h ------->
#<---- Alloc $a3 for len ---->
lw $a3, 8($sp)
#<---- var __@<1,0> ---->
#<---- Alloc $t0 for __ ---->
#<---- var I@<1,0> ---->
#<---- Alloc $t1 for I ---->
#<---- ASSIGN __@<1,0> = len@<1,0> ---->
addiu $t0, $a3, 0
#<---- ASSIGN I@<1,0> = 0 ---->
move $t1, $zero
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a2 for _ ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for len ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for __ ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for I ---->
sw $t1, 16($sp)
while_judge_label_0:
#<---- SET #T0@<1,0> := I@<1,0> < len@<1,0> ---->
#<---- Alloc $a2 for #T0 ---->
#<---- Alloc $a3 for I ---->
lw $a3, 16($sp)
#<---- Alloc $t0 for len ---->
lw $t0, 8($sp)
slt $a2, $a3, $t0
#<---- JUMP_IF #T0@<1,0> == 0 while_end_label_0 ---->
#<---- Cancel $a3 for I ---->
sw $a3, 16($sp)
#<---- Cancel $t0 for len ---->
sw $t0, 8($sp)
beq $a2, 0, while_end_label_0
#<---- NEW_BLOCK <2,0> ---->
#<---- #T1@<2,0> = __@<1,0> ADD 98326464 ---->
#<---- Alloc $a3 for __ ---->
lw $a3, 12($sp)
#<---- Alloc $t0 for #T1 ---->
addiu $t0, $a3, 98326464
#<---- ASSIGN __@<1,0> = #T1@<2,0> ---->
addiu $a3, $t0, 0
#<---- #T2@<2,0> = __@<1,0> MUL 20373381 ---->
#<---- Alloc $t1 for #T2 ---->
li $v1, 20373381
mult $a3, $v1
mflo $t1
#<---- ASSIGN __@<1,0> = #T2@<2,0> ---->
addiu $a3, $t1, 0
#<---- #T3@<2,0> = __@<1,0> ADD 23667832 ---->
#<---- Alloc $t2 for #T3 ---->
addiu $t2, $a3, 23667832
#<---- ASSIGN __@<1,0> = #T3@<2,0> ---->
addiu $a3, $t2, 0
#<---- #T4@<2,0> = __@<1,0> DIV 133 ---->
#<---- Alloc $t3 for #T4 ---->
li $v1, -161464935
mult $a3, $v1
mfhi $v1
addu $v1, $v1, $a3
sra $v1, $v1, 7
sra $v0, $a3, 31
subu $t3, $v1, $v0
#<---- ASSIGN __@<1,0> = #T4@<2,0> ---->
addiu $a3, $t3, 0
#<---- #T5@<2,0> = __@<1,0> ADD 1347887899 ---->
#<---- Alloc $t4 for #T5 ---->
addiu $t4, $a3, 1347887899
#<---- ASSIGN __@<1,0> = #T5@<2,0> ---->
addiu $a3, $t4, 0
#<---- #T6@<2,0> = __@<1,0> MOD 99998099 ---->
#<---- Alloc $t5 for #T6 ---->
li $v1, 720589639
mult $a3, $v1
mfhi $v1
sra $v1, $v1, 24
sra $v0, $a3, 31
subu $t5, $v1, $v0
li $v0, 99998099
mult $t5, $v0
mflo $v0
subu $t5, $a3, $v0
#<---- ASSIGN __@<1,0> = #T6@<2,0> ---->
addiu $a3, $t5, 0
#<---- #T7@<2,0> = __@<1,0> MUL 123671861 ---->
#<---- Alloc $t6 for #T7 ---->
li $v1, 123671861
mult $a3, $v1
mflo $t6
#<---- #T8@<2,0> = #T7@<2,0> SUB 236234 ---->
#<---- Alloc $t7 for #T8 ---->
addiu $t7, $t6, -236234
#<---- #T9@<2,0> = __@<1,0> ADD 135632 ---->
#<---- Alloc $t8 for #T9 ---->
addiu $t8, $a3, 135632
#<---- #T10@<2,0> = #T8@<2,0> MUL #T9@<2,0> ---->
#<---- Alloc $t9 for #T10 ---->
mult $t7, $t8
mflo $t9
#<---- #T11@<2,0> = #T10@<2,0> DIV 7 ---->
#<---- Alloc $s0 for #T11 ---->
li $v1, -1840700269
mult $t9, $v1
mfhi $v1
addu $v1, $v1, $t9
sra $v1, $v1, 2
sra $v0, $t9, 31
subu $s0, $v1, $v0
#<---- ASSIGN __@<1,0> = #T11@<2,0> ---->
addiu $a3, $s0, 0
#<---- #T12@<2,0> = I@<1,0> ADD 1 ---->
#<---- Alloc $s1 for I ---->
lw $s1, 16($sp)
#<---- Alloc $s2 for #T12 ---->
addiu $s2, $s1, 1
#<---- ASSIGN I@<1,0> = #T12@<2,0> ---->
addiu $s1, $s2, 0
#<---- END_BLOCK <2,0> ---->
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 for #T0 ---->
#<---- Cancel $a3 for __ ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for #T1 ---->
#<---- Cancel $t1 for #T2 ---->
#<---- Cancel $t2 for #T3 ---->
#<---- Cancel $t3 for #T4 ---->
#<---- Cancel $t4 for #T5 ---->
#<---- Cancel $t5 for #T6 ---->
#<---- Cancel $t6 for #T7 ---->
#<---- Cancel $t7 for #T8 ---->
#<---- Cancel $t8 for #T9 ---->
#<---- Cancel $t9 for #T10 ---->
#<---- Cancel $s0 for #T11 ---->
#<---- Cancel $s1 for I ---->
sw $s1, 16($sp)
#<---- Cancel $s2 for #T12 ---->
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- return __@<1,0> ---->
#<---- Alloc $a2 for __ ---->
lw $a2, 12($sp)
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
#<---- Alloc $a2 for _arg ---->
lw $a2, 4($sp)
#<---- #T13@<1,2> = _arg@<1,2> MUL 2 ---->
#<---- Alloc $a3 for #T13 ---->
sll $a3, $a2, 1
#<---- #T14@<1,2> = #T13@<1,2> MUL 3 ---->
#<---- Alloc $t0 for #T14 ---->
li $v1, 3
mult $a3, $v1
mflo $t0
#<---- #T15@<1,2> = #T14@<1,2> DIV 6 ---->
#<---- Alloc $t1 for #T15 ---->
li $v1, 715827883
mult $t0, $v1
mfhi $v1
sra $v0, $t0, 31
subu $t1, $v1, $v0
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
#<---- Alloc $a2 for _arr_Ay ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF useless@<1,3> __ ------->
#<---- Alloc $a3 for useless ---->
lw $a3, 8($sp)
#<---- LOAD #T16@<1,3> = _arr_Ay@<1,3>[0] ---->
#<---- Alloc $t0 for #T16 ---->
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
#<---- Alloc $a2 for _arr_Ay ---->
lw $a2, 4($sp)
#<---- LOAD #T17@<1,4> = _arr_Ay@<1,4>[0] ---->
#<---- Alloc $a3 for #T17 ---->
lw $a3, 0($a2)
#<---- LOAD #T18@<1,4> = _arr_Ay@<1,4>[1] ---->
#<---- Alloc $t0 for #T18 ---->
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
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,5> _add_fake ------->
#<---- Alloc $a3 for b ---->
lw $a3, 8($sp)
#<---- #T19@<1,5> = a@<1,5> ADD b@<1,5> ---->
#<---- Alloc $t0 for #T19 ---->
addu $t0, $a2, $a3
#<---- SET #T20@<1,5> := 10186 <= #T19@<1,5> ---->
#<---- Alloc $t1 for #T20 ---->
sge $t1, $t0, 10186
#<---- JUMP_IF #T20@<1,5> == 0 Else_start_label_0 ---->
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for #T19 ---->
beq $t1, 0, Else_start_label_0
#<---- NEW_BLOCK <2,1> ---->
#<---- #T21@<2,1> = 203 MUL b@<1,5> ---->
#<---- Alloc $a2 for b ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for #T21 ---->
li $v1, 203
mult $a2, $v1
mflo $a3
#<---- #T22@<2,1> = #T21@<2,1> DIV 201 ---->
#<---- Alloc $t0 for #T22 ---->
li $v1, 42735993
mult $a3, $v1
mfhi $v1
sra $v1, $v1, 1
sra $v0, $a3, 31
subu $t0, $v1, $v0
#<---- #T23@<2,1> = a@<1,5> ADD #T22@<2,1> ---->
#<---- Alloc $t2 for a ---->
lw $t2, 4($sp)
#<---- Alloc $t3 for #T23 ---->
addu $t3, $t2, $t0
#<---- return #T23@<2,1> ---->
move $v0, $t3
jr $ra
#<---- END_BLOCK <2,1> ---->
#<---- JUMP ifElse_end_label_0 ---->
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T21 ---->
#<---- Cancel $t0 for #T22 ---->
#<---- Cancel $t1 for #T20 ---->
#<---- Cancel $t2 for a ---->
sw $t2, 4($sp)
#<---- Cancel $t3 for #T23 ---->
j ifElse_end_label_0
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- #T24@<1,5> = a@<1,5> ADD b@<1,5> ---->
#<---- Alloc $a2 for b ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for a ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T24 ---->
addu $t0, $a3, $a2
#<---- #T25@<1,5> = #T24@<1,5> SUB 10086 ---->
#<---- Alloc $t1 for #T25 ---->
addiu $t1, $t0, -10086
#<---- SET #T26@<1,5> := #T25@<1,5> < 12345678 ---->
#<---- Alloc $t2 for #T26 ---->
li $v1, , 12345678
slt $t2, $t1, $v1
#<---- JUMP_IF #T26@<1,5> == 0 Else_start_label_1 ---->
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T24 ---->
#<---- Cancel $t1 for #T25 ---->
beq $t2, 0, Else_start_label_1
#<---- NEW_BLOCK <2,2> ---->
#<---- #T27@<2,2> = 1003 MUL a@<1,5> ---->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<---- Alloc $a3 for #T27 ---->
li $v1, 1003
mult $a2, $v1
mflo $a3
#<---- #T28@<2,2> = #T27@<2,2> DIV 1009 ---->
#<---- Alloc $t0 for #T28 ---->
li $v1, -2115558717
mult $a3, $v1
mfhi $v1
addu $v1, $v1, $a3
sra $v1, $v1, 9
sra $v0, $a3, 31
subu $t0, $v1, $v0
#<---- #T29@<2,2> = 2022 MUL b@<1,5> ---->
#<---- Alloc $t1 for b ---->
lw $t1, 8($sp)
#<---- Alloc $t3 for #T29 ---->
li $v1, 2022
mult $t1, $v1
mflo $t3
#<---- #T30@<2,2> = #T29@<2,2> DIV 2019 ---->
#<---- Alloc $t4 for #T30 ---->
li $v1, -2116638167
mult $t3, $v1
mfhi $v1
addu $v1, $v1, $t3
sra $v1, $v1, 10
sra $v0, $t3, 31
subu $t4, $v1, $v0
#<---- #T31@<2,2> = #T28@<2,2> ADD #T30@<2,2> ---->
#<---- Alloc $t5 for #T31 ---->
addu $t5, $t0, $t4
#<---- return #T31@<2,2> ---->
move $v0, $t5
jr $ra
#<---- END_BLOCK <2,2> ---->
#<---- JUMP ifElse_end_label_1 ---->
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T27 ---->
#<---- Cancel $t0 for #T28 ---->
#<---- Cancel $t1 for b ---->
sw $t1, 8($sp)
#<---- Cancel $t2 for #T26 ---->
#<---- Cancel $t3 for #T29 ---->
#<---- Cancel $t4 for #T30 ---->
#<---- Cancel $t5 for #T31 ---->
j ifElse_end_label_1
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- NEW_BLOCK <2,3> ---->
#<---- #T32@<2,3> = a@<1,5> ADD b@<1,5> ---->
#<---- Alloc $a2 for b ---->
lw $a2, 8($sp)
#<---- Alloc $a3 for a ---->
lw $a3, 4($sp)
#<---- Alloc $t0 for #T32 ---->
addu $t0, $a3, $a2
#<---- #T33@<2,3> = #T32@<2,3> SUB 233 ---->
#<---- Alloc $t1 for #T33 ---->
addiu $t1, $t0, -233
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
#<---- Cancel $t1 for #T33 ---->
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
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,6> _add ------->
#<---- Alloc $a3 for b ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF c@<1,6> _add ------->
#<---- Alloc $t0 for c ---->
lw $t0, 12($sp)
#<---- #T34@<1,6> = a@<1,6> ADD b@<1,6> ---->
#<---- Alloc $t1 for #T34 ---->
addu $t1, $a2, $a3
#<---- #T35@<1,6> = #T34@<1,6> ADD c@<1,6> ---->
#<---- Alloc $t2 for #T35 ---->
addu $t2, $t1, $t0
#<---- return #T35@<1,6> ---->
move $v0, $t2
jr $ra
#<---- END_BLOCK <1,6> ---->
jr $ra
#<--------------- FUNC _get_id--------------->
func_label__get_id:
#<---- var _2_wj5qhidw_@<1,7> ---->
#<---- Alloc $a2 for _2_wj5qhidw_ ---->
#<---- ASSIGN _2_wj5qhidw_@<1,7> = 76 ---->
addiu $a2, $zero, 76
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
addiu $a2, $zero, 10086
#<---- print _2_wj5qhidw_@<1,7> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- var _2_wj5qhidw_@<2,4> = -10 ---->
#<---- Alloc $a3 for _2_wj5qhidw_ ---->
addiu $a3, $zero, -10
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
#<---- Alloc $a2 for num ---->
lw $a2, 4($sp)
#<---- #T36@<1,8> = num@<1,8> ADD -763835168 ---->
#<---- Alloc $a3 for #T36 ---->
addiu $a3, $a2, -763835168
#<---- #T37@<1,8> = #T36@<1,8> MOD 1996325548 ---->
#<---- Alloc $t0 for #T37 ---->
li $v1, 1155043581
mult $a3, $v1
mfhi $v1
sra $v1, $v1, 29
sra $v0, $a3, 31
subu $t0, $v1, $v0
li $v0, 1996325548
mult $t0, $v0
mflo $v0
subu $t0, $a3, $v0
#<---- #T38@<1,8> = #T37@<1,8> MUL 1881457024 ---->
#<---- Alloc $t1 for #T38 ---->
li $v1, 1881457024
mult $t0, $v1
mflo $t1
#<---- #T39@<1,8> = #T38@<1,8> DIV 11 ---->
#<---- Alloc $t2 for #T39 ---->
li $v1, 780903145
mult $t1, $v1
mfhi $v1
sra $v1, $v1, 1
sra $v0, $t1, 31
subu $t2, $v1, $v0
#<---- #T40@<1,8> = #T39@<1,8> MUL 540488577 ---->
#<---- Alloc $t3 for #T40 ---->
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
#<---- var a@<1,9> = 17 ---->
#<---- Alloc $a2 for a ---->
addiu $a2, $zero, 17
#<---- #T41@<1,9> = a@<1,9> DIV 1996325548 ---->
#<---- Alloc $a3 for #T41 ---->
li $v1, 1155043581
mult $a2, $v1
mfhi $v1
sra $v1, $v1, 29
sra $v0, $a2, 31
subu $a3, $v1, $v0
#<---- ASSIGN a@<1,9> = #T41@<1,9> ---->
addiu $a2, $a3, 0
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- print 0 ---->
li $a0, 0
li $v0, 1
syscall
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- PRE_CALL __my_Ha_s__h@0 ---->
#<---- PUSH_PARA 2 #function: __my_Ha_s__h@0 #arg: len ---->
li $v1, 2
sw $v1, -64($sp)
#<---- PUSH_PARA cdwuh@<0,0> #function: __my_Ha_s__h@0 #arg: _ ---->
li $v1, 0x10010060
sw $v1, -68($sp)
#<---- FUNC_CALL __my_Ha_s__h@0 ---->
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T41 ---->
addiu $sp, $sp, -72
jal func_label___my_Ha_s__h
addiu $sp, $sp, 72
#<---- ASSIGN #T42@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T42 ---->
move $a2, $v0
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- print #T42@<1,9> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str14 ---->
la $a0, str14
li $v0, 4
syscall
#<---- PRE_CALL _M__a_G_I___c@1 ---->
#<---- PUSH_PARA 245512106 #function: _M__a_G_I___c@1 #arg: num ---->
li $v1, 245512106
sw $v1, -24($sp)
#<---- FUNC_CALL _M__a_G_I___c@1 ---->
#<---- Cancel $a2 for #T42 ---->
addiu $sp, $sp, -28
jal func_label__M__a_G_I___c
addiu $sp, $sp, 28
#<---- ASSIGN #T43@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T43 ---->
move $a2, $v0
#<---- print #str15 ---->
la $a0, str15
li $v0, 4
syscall
#<---- print #T43@<1,9> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str16 ---->
la $a0, str16
li $v0, 4
syscall
#<---- print #str17 ---->
la $a0, str17
li $v0, 4
syscall
#<---- print -518323062 ---->
li $a0, -518323062
li $v0, 1
syscall
#<---- print #str18 ---->
la $a0, str18
li $v0, 4
syscall
#<---- print #str19 ---->
la $a0, str19
li $v0, 4
syscall
#<---- print -518323062 ---->
li $a0, -518323062
li $v0, 1
syscall
#<---- print #str20 ---->
la $a0, str20
li $v0, 4
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,9> ---->
