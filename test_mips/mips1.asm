.data
array_fib_matrix_: .space 16
array___res_: .space 16
array___useless_: .space 16
str0: .asciiz "Error!\n"
str1: .asciiz " "
str2: .asciiz "\n"
str3: .asciiz " "
str4: .asciiz "\n"
str5: .asciiz "19373372\n"
str6: .asciiz "a[n] = a[n - 1] + a[n - 2] (for different init values)\n"
str7: .asciiz "/* ret1 = "
str8: .asciiz "*/\n"
str9: .asciiz "/* input = "
str10: .asciiz " */\n"
str11: .asciiz "/* ret2 = "
str12: .asciiz "*/\n"
str13: .asciiz "when a[0] = "
str14: .asciiz ", a[1] = "
str15: .asciiz " ==> a["
str16: .asciiz "] = "
str17: .asciiz "\n"
str18: .asciiz "//////////////////////////////////////\n"
str19: .asciiz "/****************** END ******************/\n"
.text
addi $gp, $gp, 48
#<------- var fib_matrix@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_fib_matrix_
#<------- var fib_matrix@<0,0>[1] = 1 ------->
li $t0, 1
sw $t0, array_fib_matrix_+4
#<------- var fib_matrix@<0,0>[2] = 1 ------->
li $t0, 1
sw $t0, array_fib_matrix_+8
#<------- var fib_matrix@<0,0>[3] = 0 ------->
#<------- var __res@<0,0>[0] = 5 ------->
li $t0, 5
sw $t0, array___res_
#<------- var __res@<0,0>[1] = 5 ------->
li $t0, 5
sw $t0, array___res_+4
#<------- var __res@<0,0>[2] = 2 ------->
li $t0, 2
sw $t0, array___res_+8
#<------- var __res@<0,0>[3] = 3 ------->
li $t0, 3
sw $t0, array___res_+12
#<------- var __useless@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array___useless_
#<------- var __useless@<0,0>[1] = 1 ------->
li $t0, 1
sw $t0, array___useless_+4
#<------- var __useless@<0,0>[2] = 1 ------->
li $t0, 1
sw $t0, array___useless_+8
#<------- var __useless@<0,0>[3] = 0 ------->
addiu $sp, $sp, -180
j func_label_main
#<--------------- FUNC __vec_mul--------------->
func_label___vec_mul:
#<------- FORM_VAR_DEF res@<1,0> __vec_mul ------->
#<---- Alloc $a2 which index is 0 for res ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF mat@<1,0> __vec_mul ------->
#<---- Alloc $a3 which index is 1 for mat ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF vec@<1,0> __vec_mul ------->
#<---- Alloc $t0 which index is 2 for vec ---->
lw $t0, 12($sp)
#<---- LOAD #T0@<1,0> = vec@<1,0>[0] ---->
#<---- Alloc $t1 which index is 3 for #T0 ---->
lw $t1, 0($t0)
#<---- LOAD #T1@<1,0> = mat@<1,0>[0] ---->
#<---- Alloc $t2 which index is 4 for #T1 ---->
lw $t2, 0($a3)
#<---- #T2@<1,0> = #T0@<1,0> MUL #T1@<1,0> ---->
#<---- Alloc $t3 which index is 5 for #T2 ---->
mult $t1, $t2
mflo $t3
#<---- LOAD #T3@<1,0> = vec@<1,0>[1] ---->
#<---- Alloc $t4 which index is 6 for #T3 ---->
lw $t4, 4($t0)
#<---- LOAD #T4@<1,0> = mat@<1,0>[1] ---->
#<---- Alloc $t5 which index is 7 for #T4 ---->
lw $t5, 4($a3)
#<---- #T5@<1,0> = #T3@<1,0> MUL #T4@<1,0> ---->
#<---- Alloc $t6 which index is 8 for #T5 ---->
mult $t4, $t5
mflo $t6
#<---- #T6@<1,0> = #T2@<1,0> ADD #T5@<1,0> ---->
#<---- Alloc $t7 which index is 9 for #T6 ---->
addu $t7, $t3, $t6
#<---- SAVE res@<1,0>[0] = #T6@<1,0> ---->
sw $t7, 0($a2)
#<---- LOAD #T7@<1,0> = vec@<1,0>[0] ---->
#<---- Alloc $t8 which index is 10 for #T7 ---->
lw $t8, 0($t0)
#<---- LOAD #T8@<1,0> = mat@<1,0>[2] ---->
#<---- Alloc $t9 which index is 11 for #T8 ---->
lw $t9, 8($a3)
#<---- #T9@<1,0> = #T7@<1,0> MUL #T8@<1,0> ---->
#<---- Alloc $s0 which index is 12 for #T9 ---->
mult $t8, $t9
mflo $s0
#<---- LOAD #T10@<1,0> = vec@<1,0>[1] ---->
#<---- Alloc $s1 which index is 13 for #T10 ---->
lw $s1, 4($t0)
#<---- LOAD #T11@<1,0> = mat@<1,0>[3] ---->
#<---- Alloc $s2 which index is 14 for #T11 ---->
lw $s2, 12($a3)
#<---- #T12@<1,0> = #T10@<1,0> MUL #T11@<1,0> ---->
#<---- Alloc $s3 which index is 15 for #T12 ---->
mult $s1, $s2
mflo $s3
#<---- #T13@<1,0> = #T9@<1,0> ADD #T12@<1,0> ---->
#<---- Alloc $s4 which index is 16 for #T13 ---->
addu $s4, $s0, $s3
#<---- SAVE res@<1,0>[1] = #T13@<1,0> ---->
sw $s4, 4($a2)
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,0> ---->
jr $ra
#<--------------- FUNC __mat_mul--------------->
func_label___mat_mul:
#<------- FORM_VAR_DEF res@<1,1> __mat_mul ------->
#<---- Alloc $a2 which index is 0 for res ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF x@<1,1> __mat_mul ------->
#<---- Alloc $a3 which index is 1 for x ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF y@<1,1> __mat_mul ------->
#<---- Alloc $t0 which index is 2 for y ---->
lw $t0, 12($sp)
#<---- LOAD #T14@<1,1> = x@<1,1>[0] ---->
#<---- Alloc $t1 which index is 3 for #T14 ---->
lw $t1, 0($a3)
#<---- LOAD #T15@<1,1> = y@<1,1>[0] ---->
#<---- Alloc $t2 which index is 4 for #T15 ---->
lw $t2, 0($t0)
#<---- #T16@<1,1> = #T14@<1,1> MUL #T15@<1,1> ---->
#<---- Alloc $t3 which index is 5 for #T16 ---->
mult $t1, $t2
mflo $t3
#<---- LOAD #T17@<1,1> = x@<1,1>[1] ---->
#<---- Alloc $t4 which index is 6 for #T17 ---->
lw $t4, 4($a3)
#<---- LOAD #T18@<1,1> = y@<1,1>[2] ---->
#<---- Alloc $t5 which index is 7 for #T18 ---->
lw $t5, 8($t0)
#<---- #T19@<1,1> = #T17@<1,1> MUL #T18@<1,1> ---->
#<---- Alloc $t6 which index is 8 for #T19 ---->
mult $t4, $t5
mflo $t6
#<---- #T20@<1,1> = #T16@<1,1> ADD #T19@<1,1> ---->
#<---- Alloc $t7 which index is 9 for #T20 ---->
addu $t7, $t3, $t6
#<---- SAVE res@<1,1>[0] = #T20@<1,1> ---->
sw $t7, 0($a2)
#<---- LOAD #T21@<1,1> = x@<1,1>[0] ---->
#<---- Alloc $t8 which index is 10 for #T21 ---->
lw $t8, 0($a3)
#<---- LOAD #T22@<1,1> = y@<1,1>[1] ---->
#<---- Alloc $t9 which index is 11 for #T22 ---->
lw $t9, 4($t0)
#<---- #T23@<1,1> = #T21@<1,1> MUL #T22@<1,1> ---->
#<---- Alloc $s0 which index is 12 for #T23 ---->
mult $t8, $t9
mflo $s0
#<---- LOAD #T24@<1,1> = x@<1,1>[1] ---->
#<---- Alloc $s1 which index is 13 for #T24 ---->
lw $s1, 4($a3)
#<---- LOAD #T25@<1,1> = y@<1,1>[3] ---->
#<---- Alloc $s2 which index is 14 for #T25 ---->
lw $s2, 12($t0)
#<---- #T26@<1,1> = #T24@<1,1> MUL #T25@<1,1> ---->
#<---- Alloc $s3 which index is 15 for #T26 ---->
mult $s1, $s2
mflo $s3
#<---- #T27@<1,1> = #T23@<1,1> ADD #T26@<1,1> ---->
#<---- Alloc $s4 which index is 16 for #T27 ---->
addu $s4, $s0, $s3
#<---- SAVE res@<1,1>[1] = #T27@<1,1> ---->
sw $s4, 4($a2)
#<---- LOAD #T28@<1,1> = x@<1,1>[2] ---->
#<---- Alloc $s5 which index is 17 for #T28 ---->
lw $s5, 8($a3)
#<---- LOAD #T29@<1,1> = y@<1,1>[0] ---->
#<---- Alloc $s6 which index is 18 for #T29 ---->
lw $s6, 0($t0)
#<---- #T30@<1,1> = #T28@<1,1> MUL #T29@<1,1> ---->
#<---- Alloc $s7 which index is 19 for #T30 ---->
mult $s5, $s6
mflo $s7
#<---- LOAD #T31@<1,1> = x@<1,1>[3] ---->
#<---- Alloc $k0 which index is 20 for #T31 ---->
lw $k0, 12($a3)
#<---- LOAD #T32@<1,1> = y@<1,1>[2] ---->
#<---- Alloc $k1 which index is 21 for #T32 ---->
lw $k1, 8($t0)
#<---- #T33@<1,1> = #T31@<1,1> MUL #T32@<1,1> ---->
#<---- Alloc $fp which index is 22 for #T33 ---->
mult $k0, $k1
mflo $fp
#<---- #T34@<1,1> = #T30@<1,1> ADD #T33@<1,1> ---->
#<---- Cancel $a3 which index is 1 for x ---->
#<---- Alloc $a3 which index is 1 for #T34 ---->
addu $a3, $s7, $fp
#<---- SAVE res@<1,1>[2] = #T34@<1,1> ---->
sw $a3, 8($a2)
#<---- LOAD #T35@<1,1> = x@<1,1>[2] ---->
#<---- Cancel $t0 which index is 2 for y ---->
#<---- Alloc $t0 which index is 2 for #T35 ---->
#<---- Cancel $t1 which index is 3 for #T14 ---->
#<---- Alloc $t1 which index is 3 for x ---->
lw $t1, 8($sp)
lw $t0, 8($t1)
#<---- LOAD #T36@<1,1> = y@<1,1>[1] ---->
#<---- Cancel $t2 which index is 4 for #T15 ---->
#<---- Alloc $t2 which index is 4 for #T36 ---->
#<---- Cancel $t3 which index is 5 for #T16 ---->
#<---- Alloc $t3 which index is 5 for y ---->
lw $t3, 12($sp)
lw $t2, 4($t3)
#<---- #T37@<1,1> = #T35@<1,1> MUL #T36@<1,1> ---->
#<---- Cancel $t4 which index is 6 for #T17 ---->
#<---- Alloc $t4 which index is 6 for #T37 ---->
mult $t0, $t2
mflo $t4
#<---- LOAD #T38@<1,1> = x@<1,1>[3] ---->
#<---- Cancel $t5 which index is 7 for #T18 ---->
#<---- Alloc $t5 which index is 7 for #T38 ---->
lw $t5, 12($t1)
#<---- LOAD #T39@<1,1> = y@<1,1>[3] ---->
#<---- Cancel $t6 which index is 8 for #T19 ---->
#<---- Alloc $t6 which index is 8 for #T39 ---->
lw $t6, 12($t3)
#<---- #T40@<1,1> = #T38@<1,1> MUL #T39@<1,1> ---->
#<---- Cancel $t7 which index is 9 for #T20 ---->
#<---- Alloc $t7 which index is 9 for #T40 ---->
mult $t5, $t6
mflo $t7
#<---- #T41@<1,1> = #T37@<1,1> ADD #T40@<1,1> ---->
#<---- Cancel $t8 which index is 10 for #T21 ---->
#<---- Alloc $t8 which index is 10 for #T41 ---->
addu $t8, $t4, $t7
#<---- SAVE res@<1,1>[3] = #T41@<1,1> ---->
sw $t8, 12($a2)
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,1> ---->
jr $ra
#<--------------- FUNC __power--------------->
func_label___power:
#<------- FORM_VAR_DEF n@<1,2> __power ------->
#<---- Alloc $a2 which index is 0 for n ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF cur@<1,2> __power ------->
#<---- Alloc $a3 which index is 1 for cur ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF res@<1,2> __power ------->
#<---- Alloc $t0 which index is 2 for res ---->
lw $t0, 12($sp)
#<---- GEN_LABEL ifElse_begin_label_0: ---->
ifElse_begin_label_0:
#<---- SET #T42@<1,2> := n@<1,2> == 1 ---->
#<---- Alloc $t1 which index is 3 for #T42 ---->
seq $t1, $a2, 1
#<---- JUMP_IF #T42@<1,2> == 0 Else_start_label_0 ---->
#<---- Cancel $a2 which index is 0 for n ---->
sw $a2, 4($sp)
#<---- Cancel $a3 which index is 1 for cur ---->
#<---- Cancel $t0 which index is 2 for res ---->
beq $t1, 0, Else_start_label_0
#<---- NEW_BLOCK <2,0> ---->
#<---- LOAD #T43@<2,0> = cur@<1,2>[0] ---->
#<---- Alloc $a2 which index is 0 for #T43 ---->
#<---- Alloc $a3 which index is 1 for cur ---->
lw $a3, 8($sp)
lw $a2, 0($a3)
#<---- SAVE res@<1,2>[0] = #T43@<2,0> ---->
#<---- Alloc $t0 which index is 2 for res ---->
lw $t0, 12($sp)
sw $a2, 0($t0)
#<---- LOAD #T44@<2,0> = cur@<1,2>[1] ---->
#<---- Alloc $t2 which index is 4 for #T44 ---->
lw $t2, 4($a3)
#<---- SAVE res@<1,2>[1] = #T44@<2,0> ---->
sw $t2, 4($t0)
#<---- LOAD #T45@<2,0> = cur@<1,2>[2] ---->
#<---- Alloc $t3 which index is 5 for #T45 ---->
lw $t3, 8($a3)
#<---- SAVE res@<1,2>[2] = #T45@<2,0> ---->
sw $t3, 8($t0)
#<---- LOAD #T46@<2,0> = cur@<1,2>[3] ---->
#<---- Alloc $t4 which index is 6 for #T46 ---->
lw $t4, 12($a3)
#<---- SAVE res@<1,2>[3] = #T46@<2,0> ---->
sw $t4, 12($t0)
#<---- return 0 ---->
li $v0, 0
jr $ra
#<---- END_BLOCK <2,0> ---->
#<---- JUMP ifElse_end_label_0 ---->
#<---- Cancel $a2 which index is 0 for #T43 ---->
#<---- Cancel $a3 which index is 1 for cur ---->
#<---- Cancel $t0 which index is 2 for res ---->
#<---- Cancel $t1 which index is 3 for #T42 ---->
#<---- Cancel $t2 which index is 4 for #T44 ---->
#<---- Cancel $t3 which index is 5 for #T45 ---->
#<---- Cancel $t4 which index is 6 for #T46 ---->
j ifElse_end_label_0
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- NEW_BLOCK <2,1> ---->
#<---- PRE_CALL __mat_mul@0 ---->
#<---- PUSH_PARA fib_matrix@<0,0> #function: __mat_mul@0 #arg: y ---->
li $v1, 0x10010000
sw $v1, -116($sp)
#<---- PUSH_PARA cur@<1,2> #function: __mat_mul@0 #arg: x ---->
#<---- Alloc $a2 which index is 0 for cur ---->
lw $a2, 8($sp)
sw $a2, -120($sp)
#<---- PUSH_PARA res@<1,2> #function: __mat_mul@0 #arg: res ---->
#<---- Alloc $a3 which index is 1 for res ---->
lw $a3, 12($sp)
sw $a3, -124($sp)
#<---- FUNC_CALL __mat_mul@0 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 which index is 0 for cur ---->
#<---- Cancel $a3 which index is 1 for res ---->
addiu $sp, $sp, -128
jal func_label___mat_mul
addiu $sp, $sp, 128
lw $ra, 0($sp)
#<---- LOAD #T48@<2,1> = res@<1,2>[0] ---->
#<---- Alloc $a2 which index is 0 for #T48 ---->
#<---- Alloc $a3 which index is 1 for res ---->
lw $a3, 12($sp)
lw $a2, 0($a3)
#<---- SAVE cur@<1,2>[0] = #T48@<2,1> ---->
#<---- Alloc $t0 which index is 2 for cur ---->
lw $t0, 8($sp)
sw $a2, 0($t0)
#<---- LOAD #T49@<2,1> = res@<1,2>[1] ---->
#<---- Alloc $t1 which index is 3 for #T49 ---->
lw $t1, 4($a3)
#<---- SAVE cur@<1,2>[1] = #T49@<2,1> ---->
sw $t1, 4($t0)
#<---- LOAD #T50@<2,1> = res@<1,2>[2] ---->
#<---- Alloc $t2 which index is 4 for #T50 ---->
lw $t2, 8($a3)
#<---- SAVE cur@<1,2>[2] = #T50@<2,1> ---->
sw $t2, 8($t0)
#<---- LOAD #T51@<2,1> = res@<1,2>[3] ---->
#<---- Alloc $t3 which index is 5 for #T51 ---->
lw $t3, 12($a3)
#<---- SAVE cur@<1,2>[3] = #T51@<2,1> ---->
sw $t3, 12($t0)
#<---- PRE_CALL __power@1 ---->
#<---- PUSH_PARA res@<1,2> #function: __power@1 #arg: res ---->
sw $a3, -52($sp)
#<---- PUSH_PARA cur@<1,2> #function: __power@1 #arg: cur ---->
sw $t0, -56($sp)
#<---- #T52@<2,1> = n@<1,2> SUB 1 ---->
#<---- Alloc $t4 which index is 6 for n ---->
lw $t4, 4($sp)
#<---- Alloc $t5 which index is 7 for #T52 ---->
addiu $t5, $t4, -1
#<---- PUSH_PARA #T52@<2,1> #function: __power@1 #arg: n ---->
sw $t5, -60($sp)
#<---- FUNC_CALL __power@1 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 which index is 0 for #T48 ---->
sw $a2, 40($sp)
#<---- Cancel $a3 which index is 1 for res ---->
sw $a3, 12($sp)
#<---- Cancel $t0 which index is 2 for cur ---->
sw $t0, 8($sp)
#<---- Cancel $t1 which index is 3 for #T49 ---->
sw $t1, 44($sp)
#<---- Cancel $t2 which index is 4 for #T50 ---->
sw $t2, 48($sp)
#<---- Cancel $t3 which index is 5 for #T51 ---->
sw $t3, 52($sp)
#<---- Cancel $t4 which index is 6 for n ---->
sw $t4, 4($sp)
#<---- Cancel $t5 which index is 7 for #T52 ---->
sw $t5, 56($sp)
addiu $sp, $sp, -64
jal func_label___power
addiu $sp, $sp, 64
lw $ra, 0($sp)
#<---- ASSIGN #T53@<2,1> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T53 ---->
move $a2, $v0
#<---- return #T53@<2,1> ---->
move $v0, $a2
jr $ra
#<---- END_BLOCK <2,1> ---->
#<---- GEN_LABEL ifElse_end_label_0: ---->
#<---- Cancel $a2 which index is 0 for #T53 ---->
sw $a2, 60($sp)
ifElse_end_label_0:
#<---- return 0 ---->
li $v0, 0
jr $ra
#<---- END_BLOCK <1,2> ---->
#<--------------- FUNC power--------------->
func_label_power:
#<------- FORM_VAR_DEF n@<1,3> power ------->
#<---- Alloc $a2 which index is 0 for n ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF res@<1,3> power ------->
#<---- Alloc $a3 which index is 1 for res ---->
lw $a3, 8($sp)
#<---- GEN_LABEL ifElse_begin_label_1: ---->
ifElse_begin_label_1:
#<---- SET #T54@<1,3> := n@<1,3> <= 0 ---->
#<---- Alloc $t0 which index is 2 for #T54 ---->
sle $t0, $a2, 0
#<---- JUMP_IF #T54@<1,3> == 0 ifElse_end_label_1 ---->
#<---- Cancel $a2 which index is 0 for n ---->
sw $a2, 4($sp)
#<---- Cancel $a3 which index is 1 for res ---->
beq $t0, 0, ifElse_end_label_1
#<---- return -1 ---->
li $v0, -1
jr $ra
#<---- GEN_LABEL ifElse_end_label_1: ---->
#<---- Cancel $t0 which index is 2 for #T54 ---->
ifElse_end_label_1:
#<---- var temp@<1,3>[0] = 1 ---->
li $v1, 1
sw $v1, 16($sp)
#<---- var temp@<1,3>[1] = 1 ---->
li $v1, 1
sw $v1, 20($sp)
#<---- var temp@<1,3>[2] = 1 ---->
li $v1, 1
sw $v1, 24($sp)
#<---- var temp@<1,3>[3] = 0 ---->
li $v1, 0
sw $v1, 28($sp)
#<---- PRE_CALL __power@2 ---->
#<---- PUSH_PARA res@<1,3> #function: __power@2 #arg: res ---->
#<---- Alloc $a2 which index is 0 for res ---->
lw $a2, 8($sp)
sw $a2, -52($sp)
#<---- PUSH_PARA temp@<1,3> #function: __power@2 #arg: cur ---->
addiu $v1, $sp, 16
sw $v1, -56($sp)
#<---- PUSH_PARA n@<1,3> #function: __power@2 #arg: n ---->
#<---- Alloc $a3 which index is 1 for n ---->
lw $a3, 4($sp)
sw $a3, -60($sp)
#<---- FUNC_CALL __power@2 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 which index is 0 for res ---->
sw $a2, 8($sp)
#<---- Cancel $a3 which index is 1 for n ---->
sw $a3, 4($sp)
addiu $sp, $sp, -64
jal func_label___power
addiu $sp, $sp, 64
lw $ra, 0($sp)
#<---- ASSIGN #T55@<1,3> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T55 ---->
move $a2, $v0
#<---- return #T55@<1,3> ---->
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,3> ---->
#<--------------- FUNC error--------------->
func_label_error:
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- return 1 ---->
li $v0, 1
jr $ra
#<---- END_BLOCK <1,4> ---->
#<--------------- FUNC out--------------->
func_label_out:
#<------- FORM_VAR_DEF r@<1,5> out ------->
#<---- Alloc $a2 which index is 0 for r ---->
lw $a2, 4($sp)
#<---- LOAD #T56@<1,5> = r@<1,5>[3] ---->
#<---- Alloc $a3 which index is 1 for #T56 ---->
lw $a3, 12($a2)
#<---- LOAD #T57@<1,5> = r@<1,5>[2] ---->
#<---- Alloc $t0 which index is 2 for #T57 ---->
lw $t0, 8($a2)
#<---- LOAD #T58@<1,5> = r@<1,5>[1] ---->
#<---- Alloc $t1 which index is 3 for #T58 ---->
lw $t1, 4($a2)
#<---- LOAD #T59@<1,5> = r@<1,5>[0] ---->
#<---- Alloc $t2 which index is 4 for #T59 ---->
lw $t2, 0($a2)
#<---- print #T59@<1,5> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print #T58@<1,5> ---->
move $a0, $t1
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- print #T57@<1,5> ---->
move $a0, $t0
li $v0, 1
syscall
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- print #T56@<1,5> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- return 1 ---->
li $v0, 1
jr $ra
#<---- END_BLOCK <1,5> ---->
#<--------------- FUNC main--------------->
func_label_main:
#<---- var down@<1,6> = 0 ---->
#<---- Alloc $a2 which index is 0 for down ---->
move $a2, $zero
#<---- var n@<1,6> ---->
#<---- Alloc $a3 which index is 1 for n ---->
#<---- n@<1,6> = input() ---->
li $v0, 5
syscall
move $a3, $v0
#<---- var tmp@<1,6>[0] = 0 ---->
li $v1, 0
sw $v1, 12($sp)
#<---- var tmp@<1,6>[1] = 0 ---->
li $v1, 0
sw $v1, 16($sp)
#<---- var res@<1,6> ---->
#<---- var vec_list@<1,6>[0] = 1 ---->
li $v1, 1
sw $v1, 36($sp)
#<---- var vec_list@<1,6>[1] = 0 ---->
li $v1, 0
sw $v1, 40($sp)
#<---- var vec_list@<1,6>[2] = 1 ---->
li $v1, 1
sw $v1, 44($sp)
#<---- var vec_list@<1,6>[3] = 1 ---->
li $v1, 1
sw $v1, 48($sp)
#<---- var vec_list@<1,6>[4] = 2 ---->
li $v1, 2
sw $v1, 52($sp)
#<---- var vec_list@<1,6>[5] = 1 ---->
li $v1, 1
sw $v1, 56($sp)
#<---- var vec_list@<1,6>[6] = 3 ---->
li $v1, 3
sw $v1, 60($sp)
#<---- var vec_list@<1,6>[7] = 1 ---->
li $v1, 1
sw $v1, 64($sp)
#<---- var vec_list@<1,6>[8] = 4 ---->
li $v1, 4
sw $v1, 68($sp)
#<---- var vec_list@<1,6>[9] = 3 ---->
li $v1, 3
sw $v1, 72($sp)
#<---- var vec_list@<1,6>[10] = -1 ---->
li $v1, -1
sw $v1, 76($sp)
#<---- var vec_list@<1,6>[11] = 1 ---->
li $v1, 1
sw $v1, 80($sp)
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a2 which index is 0 for down ---->
#<---- Cancel $a3 which index is 1 for n ---->
sw $a3, 8($sp)
while_judge_label_0:
#<---- SET #T60@<1,6> := 0 < n@<1,6> ---->
#<---- Alloc $a2 which index is 0 for #T60 ---->
#<---- Alloc $a3 which index is 1 for n ---->
lw $a3, 8($sp)
sgt $a2, $a3, 0
#<---- JUMP_IF #T60@<1,6> == 0 while_end_label_0 ---->
#<---- Cancel $a3 which index is 1 for n ---->
sw $a3, 8($sp)
beq $a2, 0, while_end_label_0
#<---- GEN_LABEL while_start_label_0: ---->
#<---- Cancel $a2 which index is 0 for #T60 ---->
while_start_label_0:
#<---- NEW_BLOCK <2,2> ---->
#<---- var p@<2,2> ---->
#<---- Alloc $a2 which index is 0 for p ---->
#<---- p@<2,2> = input() ---->
li $v0, 5
syscall
move $a2, $v0
#<---- PRE_CALL power@3 ---->
#<---- PUSH_PARA res@<1,6> #function: power@3 #arg: res ---->
addiu $v1, $sp, 20
sw $v1, -28($sp)
#<---- PUSH_PARA p@<2,2> #function: power@3 #arg: n ---->
sw $a2, -32($sp)
#<---- FUNC_CALL power@3 ---->
#<---- Cancel $a2 which index is 0 for p ---->
sw $a2, 92($sp)
addiu $sp, $sp, -36
jal func_label_power
addiu $sp, $sp, 36
#<---- ASSIGN #T61@<2,2> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T61 ---->
move $a2, $v0
#<---- var ret@<2,2> = #T61@<2,2> ---->
#<---- Alloc $a3 which index is 1 for ret ---->
addiu $a3, $a2, 0
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- print #T61@<2,2> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- print p@<2,2> ---->
#<---- Alloc $t0 which index is 2 for p ---->
lw $t0, 92($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_begin_label_2: ---->
ifElse_begin_label_2:
#<---- JUMP_IF ret@<2,2> == 0 ifElse_end_label_2 ---->
#<---- Cancel $a2 which index is 0 for #T61 ---->
#<---- Cancel $t0 which index is 2 for p ---->
sw $t0, 92($sp)
beq $a3, 0, ifElse_end_label_2
#<---- PRE_CALL error@4 ---->
#<---- FUNC_CALL error@4 ---->
#<---- Cancel $a3 which index is 1 for ret ---->
sw $a3, 100($sp)
addiu $sp, $sp, -4
jal func_label_error
addiu $sp, $sp, 4
#<---- ASSIGN #T62@<2,2> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T62 ---->
move $a2, $v0
#<---- JUMP_IF #T62@<2,2> == 0 ifElse_end_label_2 ---->
beq $a2, 0, ifElse_end_label_2
#<---- NEW_BLOCK <3,0> ---->
#<---- n@<1,6> = n@<1,6> SUB 1 ---->
#<---- Alloc $a3 which index is 1 for n ---->
lw $a3, 8($sp)
addiu $a3, $a3, -1
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 which index is 0 for #T62 ---->
#<---- Cancel $a3 which index is 1 for n ---->
sw $a3, 8($sp)
j while_judge_label_0
#<---- END_BLOCK <3,0> ---->
#<---- GEN_LABEL ifElse_end_label_2: ---->
ifElse_end_label_2:
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- print ret@<2,2> ---->
#<---- Alloc $a2 which index is 0 for ret ---->
lw $a2, 100($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_begin_label_3: ---->
ifElse_begin_label_3:
#<---- JUMP_IF ret@<2,2> != 0 or_label_0 ---->
bne $a2, 0, or_label_0
#<---- PRE_CALL out@5 ---->
#<---- PUSH_PARA res@<1,6> #function: out@5 #arg: r ---->
addiu $v1, $sp, 20
sw $v1, -20($sp)
#<---- FUNC_CALL out@5 ---->
#<---- Cancel $a2 which index is 0 for ret ---->
addiu $sp, $sp, -24
jal func_label_out
addiu $sp, $sp, 24
#<---- ASSIGN #T64@<2,2> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T64 ---->
move $a2, $v0
#<---- JUMP_IF #T64@<2,2> == 0 ifElse_end_label_3 ---->
beq $a2, 0, ifElse_end_label_3
#<---- GEN_LABEL or_label_0: ---->
#<---- Cancel $a2 which index is 0 for #T64 ---->
or_label_0:
#<---- NEW_BLOCK <3,1> ---->
#<---- var i@<3,1> = 0 ---->
#<---- Alloc $a2 which index is 0 for i ---->
move $a2, $zero
#<---- GEN_LABEL while_judge_label_1: ---->
#<---- Cancel $a2 which index is 0 for i ---->
sw $a2, 124($sp)
while_judge_label_1:
#<---- SET #T65@<3,1> := i@<3,1> < 6 ---->
#<---- Alloc $a2 which index is 0 for #T65 ---->
#<---- Alloc $a3 which index is 1 for i ---->
lw $a3, 124($sp)
slti $a2, $a3, 6
#<---- JUMP_IF #T65@<3,1> != 0 or_label_1 ---->
#<---- Cancel $a3 which index is 1 for i ---->
sw $a3, 124($sp)
bne $a2, 0, or_label_1
#<---- GEN_LABEL or_label_1: ---->
#<---- Cancel $a2 which index is 0 for #T65 ---->
or_label_1:
#<---- GEN_LABEL while_start_label_1: ---->
while_start_label_1:
#<---- NEW_BLOCK <4,0> ---->
#<---- PRE_CALL __vec_mul@6 ---->
#<---- #T66@<4,0> = i@<3,1> MUL 2 ---->
#<---- Alloc $a2 which index is 0 for i ---->
lw $a2, 124($sp)
#<---- Alloc $a3 which index is 1 for #T66 ---->
sll $a3, $a2, 1
#<---- PUSH_PARA vec_list@<1,6>[#T66@<4,0>] #function: __vec_mul@6 #arg: vec ---->
sll $a1, $a3, 2
addiu $v1, $sp, 36
addu $v1, $v1, $a1
sw $v1, -60($sp)
#<---- PUSH_PARA res@<1,6> #function: __vec_mul@6 #arg: mat ---->
addiu $v1, $sp, 20
sw $v1, -64($sp)
#<---- PUSH_PARA tmp@<1,6> #function: __vec_mul@6 #arg: res ---->
addiu $v1, $sp, 12
sw $v1, -68($sp)
#<---- FUNC_CALL __vec_mul@6 ---->
#<---- Cancel $a2 which index is 0 for i ---->
sw $a2, 124($sp)
#<---- Cancel $a3 which index is 1 for #T66 ---->
addiu $sp, $sp, -72
jal func_label___vec_mul
addiu $sp, $sp, 72
#<---- LOAD #T68@<4,0> = tmp@<1,6>[1] ---->
#<---- Alloc $a2 which index is 0 for #T68 ---->
lw $a2, 16($sp)
#<---- #T69@<4,0> = i@<3,1> MUL 2 ---->
#<---- Alloc $a3 which index is 1 for i ---->
lw $a3, 124($sp)
#<---- Alloc $t0 which index is 2 for #T69 ---->
sll $t0, $a3, 1
#<---- #T70@<4,0> = #T69@<4,0> ADD 0 ---->
#<---- Alloc $t1 which index is 3 for #T70 ---->
addiu $t1, $t0, 0
#<---- LOAD #T71@<4,0> = vec_list@<1,6>[#T70@<4,0>] ---->
#<---- Alloc $t2 which index is 4 for #T71 ---->
sll $a1, $t1, 2
addiu $v1, $sp, 36
addu $v1, $v1, $a1
lw $t2, 0($v1)
#<---- #T72@<4,0> = i@<3,1> MUL 2 ---->
#<---- Alloc $t3 which index is 5 for #T72 ---->
sll $t3, $a3, 1
#<---- #T73@<4,0> = #T72@<4,0> ADD 1 ---->
#<---- Alloc $t4 which index is 6 for #T73 ---->
addiu $t4, $t3, 1
#<---- LOAD #T74@<4,0> = vec_list@<1,6>[#T73@<4,0>] ---->
#<---- Alloc $t5 which index is 7 for #T74 ---->
sll $a1, $t4, 2
addiu $v1, $sp, 36
addu $v1, $v1, $a1
lw $t5, 0($v1)
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- print #T74@<4,0> ---->
move $a0, $t5
li $v0, 1
syscall
#<---- print #str14 ---->
la $a0, str14
li $v0, 4
syscall
#<---- print #T71@<4,0> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str15 ---->
la $a0, str15
li $v0, 4
syscall
#<---- print p@<2,2> ---->
#<---- Alloc $t6 which index is 8 for p ---->
lw $t6, 92($sp)
move $a0, $t6
li $v0, 1
syscall
#<---- print #str16 ---->
la $a0, str16
li $v0, 4
syscall
#<---- print #T68@<4,0> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str17 ---->
la $a0, str17
li $v0, 4
syscall
#<---- i@<3,1> = i@<3,1> ADD 1 ---->
addiu $a3, $a3, 1
#<---- GEN_LABEL ifElse_begin_label_4: ---->
ifElse_begin_label_4:
#<---- SET #T76@<4,0> := 6 <= i@<3,1> ---->
#<---- Alloc $t7 which index is 9 for #T76 ---->
sge $t7, $a3, 6
#<---- JUMP_IF #T76@<4,0> == 0 Else_start_label_1 ---->
#<---- Cancel $a2 which index is 0 for #T68 ---->
#<---- Cancel $a3 which index is 1 for i ---->
sw $a3, 124($sp)
#<---- Cancel $t0 which index is 2 for #T69 ---->
#<---- Cancel $t1 which index is 3 for #T70 ---->
#<---- Cancel $t2 which index is 4 for #T71 ---->
#<---- Cancel $t3 which index is 5 for #T72 ---->
#<---- Cancel $t4 which index is 6 for #T73 ---->
#<---- Cancel $t5 which index is 7 for #T74 ---->
#<---- Cancel $t6 which index is 8 for p ---->
sw $t6, 92($sp)
beq $t7, 0, Else_start_label_1
#<---- JUMP while_end_label_1 ---->
#<---- Cancel $t7 which index is 9 for #T76 ---->
j while_end_label_1
#<---- JUMP ifElse_end_label_4 ---->
j ifElse_end_label_4
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- JUMP while_judge_label_1 ---->
j while_judge_label_1
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- END_BLOCK <4,0> ---->
#<---- SET #T77@<3,1> := i@<3,1> < 6 ---->
#<---- Alloc $a2 which index is 0 for #T77 ---->
#<---- Alloc $a3 which index is 1 for i ---->
lw $a3, 124($sp)
slti $a2, $a3, 6
#<---- JUMP_IF #T77@<3,1> != 0 while_start_label_1 ---->
#<---- Cancel $a3 which index is 1 for i ---->
sw $a3, 124($sp)
bne $a2, 0, while_start_label_1
#<---- JUMP while_start_label_1 ---->
#<---- Cancel $a2 which index is 0 for #T77 ---->
j while_start_label_1
#<---- GEN_LABEL while_end_label_1: ---->
while_end_label_1:
#<---- END_BLOCK <3,1> ---->
#<---- GEN_LABEL ifElse_end_label_3: ---->
ifElse_end_label_3:
#<---- print #str18 ---->
la $a0, str18
li $v0, 4
syscall
#<---- #T78@<2,2> = 1 SUB n@<1,6> ---->
#<---- Alloc $a2 which index is 0 for n ---->
lw $a2, 8($sp)
#<---- Alloc $a3 which index is 1 for #T78 ---->
li $v1, 1
subu $a3, $v1, $a2
#<---- n@<1,6> = 0 SUB #T78@<2,2> ---->
li $v1, 0
subu $a2, $v1, $a3
#<---- END_BLOCK <2,2> ---->
#<---- SET #T80@<1,6> := 0 < n@<1,6> ---->
#<---- Alloc $t0 which index is 2 for #T80 ---->
sgt $t0, $a2, 0
#<---- JUMP_IF #T80@<1,6> != 0 while_start_label_0 ---->
#<---- Cancel $a2 which index is 0 for n ---->
sw $a2, 8($sp)
#<---- Cancel $a3 which index is 1 for #T78 ---->
bne $t0, 0, while_start_label_0
#<---- GEN_LABEL while_end_label_0: ---->
#<---- Cancel $t0 which index is 2 for #T80 ---->
sw $t0, 88($sp)
while_end_label_0:
#<---- print #str19 ---->
la $a0, str19
li $v0, 4
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,6> ---->
