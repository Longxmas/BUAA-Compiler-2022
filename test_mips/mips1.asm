.data
array_c_06_: .space 12
array_c_07_: .space 16
array_v_06_: .space 12
array_v_07_: .space 16
str0: .asciiz "Hello World\n"
str1: .asciiz "vm_PE = "
str2: .asciiz "\n"
.text
addi $gp, $gp, 96
#<------- var c_01@<0,0> = 1 ------->
li $t0, 1
sw $t0, -96($gp)
#<------- var c_02@<0,0> = 2 ------->
li $t0, 2
sw $t0, -92($gp)
#<------- var c_03@<0,0> = 3 ------->
li $t0, 3
sw $t0, -88($gp)
#<------- var c_04@<0,0> = 4 ------->
li $t0, 4
sw $t0, -84($gp)
#<------- var c_05@<0,0> = 11 ------->
li $t0, 11
sw $t0, -80($gp)
#<------- var c_06@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_c_06_
#<------- var c_06@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_c_06_+4
#<------- var c_06@<0,0>[2] = 3 ------->
li $t0, 3
sw $t0, array_c_06_+8
#<------- var c_07@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_c_07_
#<------- var c_07@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_c_07_+4
#<------- var c_07@<0,0>[2] = 3 ------->
li $t0, 3
sw $t0, array_c_07_+8
#<------- var c_07@<0,0>[3] = 4 ------->
li $t0, 4
sw $t0, array_c_07_+12
#<------- var v_01@<0,0> = 1 ------->
li $t0, 1
sw $t0, -48($gp)
#<------- var v_02@<0,0> = 0 ------->
#<------- var v_03@<0,0> = 3 ------->
li $t0, 3
sw $t0, -40($gp)
#<------- var v_04@<0,0> = 0 ------->
#<------- var v_05@<0,0> = 2 ------->
li $t0, 2
sw $t0, -32($gp)
#<------- var v_06@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_v_06_
#<------- var v_06@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_v_06_+4
#<------- var v_06@<0,0>[2] = 3 ------->
li $t0, 3
sw $t0, array_v_06_+8
#<------- var v_07@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_v_07_
#<------- var v_07@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_v_07_+4
#<------- var v_07@<0,0>[2] = 3 ------->
li $t0, 3
sw $t0, array_v_07_+8
#<------- var v_07@<0,0>[3] = 4 ------->
li $t0, 4
sw $t0, array_v_07_+12
addiu $sp, $sp, -448
j func_label_main
#<--------------- FUNC func_01--------------->
func_label_func_01:
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- NEW_BLOCK <2,0> ---->
#<---- END_BLOCK <2,0> ---->
#<---- return  ---->
jr $ra
#<---- END_BLOCK <1,0> ---->
jr $ra
#<--------------- FUNC func_02--------------->
func_label_func_02:
#<---- v_01@<0,0> = v_01@<0,0> ADD 1 ---->
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
addiu $a2, $a2, 1
#<---- Cancel $a2 for v_01 ---->
sw $a2, -48($gp)
#<---- var y@<1,1> = 0 ---->
#<---- Alloc $a2 for y ---->
move $a2, $zero
#<---- var x@<1,1> = 1 ---->
#<---- Alloc $a3 for x ---->
addiu $a3, $zero, 1
#<---- NEW_BLOCK <2,1> ---->
#<---- var x@<2,1> = 2 ---->
#<---- Alloc $t0 for x ---->
addiu $t0, $zero, 2
#<---- NEW_BLOCK <3,0> ---->
#<---- var x@<3,0> = 3 ---->
#<---- Alloc $t1 for x ---->
addiu $t1, $zero, 3
#<---- NEW_BLOCK <4,0> ---->
#<---- ASSIGN y@<1,1> = 4 ---->
addiu $a2, $zero, 4
#<---- END_BLOCK <4,0> ---->
#<---- ASSIGN y@<1,1> = 7 ---->
addiu $a2, $zero, 7
#<---- END_BLOCK <3,0> ---->
#<---- ASSIGN y@<1,1> = 9 ---->
addiu $a2, $zero, 9
#<---- END_BLOCK <2,1> ---->
#<---- ASSIGN y@<1,1> = 10 ---->
addiu $a2, $zero, 10
#<---- ASSIGN #T5@<1,1> = 17 ---->
#<---- Alloc $t2 for #T5 ---->
addiu $t2, $zero, 17
#<---- ASSIGN #T6@<1,1> = 17 ---->
#<---- Alloc $t3 for #T6 ---->
addiu $t3, $zero, 17
#<---- ASSIGN #T7@<1,1> = 9 ---->
#<---- Alloc $t4 for #T7 ---->
addiu $t4, $zero, 9
#<---- return 9 ---->
li $v0, 9
jr $ra
#<---- END_BLOCK <1,1> ---->
#<--------------- FUNC func_03--------------->
func_label_func_03:
#<------- FORM_VAR_DEF a@<1,2> func_03 ------->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<---- var v_01@<1,2> = 1 ---->
#<---- Alloc $a3 for v_01 ---->
addiu $a3, $zero, 1
#<---- #T8@<1,2> = a@<1,2> MUL 1 ---->
#<---- Alloc $t0 for #T8 ---->
move $t0, $a2
#<---- #T9@<1,2> = #T8@<1,2> MUL v_05@<0,0> ---->
#<---- Alloc $t1 for v_05 ---->
lw $t1, -32($gp)
#<---- Alloc $t2 for #T9 ---->
mult $t0, $t1
mflo $t2
#<---- #T10@<1,2> = #T9@<1,2> DIV 123 ---->
#<---- Alloc $t3 for #T10 ---->
li $v1, 558694933
mult $t2, $v1
mfhi $v1
sra $v1, $v1, 4
sra $v0, $t2, 31
subu $t3, $v1, $v0
#<---- return #T10@<1,2> ---->
move $v0, $t3
jr $ra
#<---- END_BLOCK <1,2> ---->
#<--------------- FUNC func_04--------------->
func_label_func_04:
#<------- FORM_VAR_DEF a@<1,3> func_04 ------->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,3> func_04 ------->
#<---- Alloc $a3 for b ---->
lw $a3, 8($sp)
#<---- var v_01@<1,3> = 1 ---->
#<---- Alloc $t0 for v_01 ---->
addiu $t0, $zero, 1
#<---- var v_02@<1,3> = 2 ---->
#<---- Alloc $t1 for v_02 ---->
addiu $t1, $zero, 2
#<---- #T11@<1,3> = a@<1,3> MUL 1 ---->
#<---- Alloc $t2 for #T11 ---->
move $t2, $a2
#<---- #T12@<1,3> = b@<1,3> DIV 2 ---->
#<---- Alloc $t3 for #T12 ---->
sra $v1, $a3, 0
srl $v1, $v1, 31
addu $v1, $a3, $v1
sra $t3, $v1, 1
#<---- #T13@<1,3> = #T11@<1,3> ADD #T12@<1,3> ---->
#<---- Alloc $t4 for #T13 ---->
addu $t4, $t2, $t3
#<---- PRE_CALL func_02@0 ---->
#<---- FUNC_CALL func_02@0 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for v_01 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for v_02 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T11 ---->
#<---- Cancel $t3 for #T12 ---->
#<---- Cancel $t4 for #T13 ---->
sw $t4, 28($sp)
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
lw $ra, 0($sp)
#<---- ASSIGN #T14@<1,3> = %RTX ---->
#<---- Alloc $a2 for #T14 ---->
move $a2, $v0
#<---- #T15@<1,3> = #T13@<1,3> ADD #T14@<1,3> ---->
#<---- Alloc $a3 for #T13 ---->
lw $a3, 28($sp)
#<---- Alloc $t0 for #T15 ---->
addu $t0, $a3, $a2
#<---- PRE_CALL func_03@1 ---->
#<---- PUSH_PARA b@<1,3> #function: func_03@1 #arg: a ---->
#<---- Alloc $t1 for b ---->
lw $t1, 8($sp)
sw $t1, -20($sp)
#<---- FUNC_CALL func_03@1 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T14 ---->
#<---- Cancel $a3 for #T13 ---->
#<---- Cancel $t0 for #T15 ---->
sw $t0, 36($sp)
#<---- Cancel $t1 for b ---->
sw $t1, 8($sp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T16@<1,3> = %RTX ---->
#<---- Alloc $a2 for #T16 ---->
move $a2, $v0
#<---- #T17@<1,3> = #T15@<1,3> SUB #T16@<1,3> ---->
#<---- Alloc $a3 for #T15 ---->
lw $a3, 36($sp)
#<---- Alloc $t0 for #T17 ---->
subu $t0, $a3, $a2
#<---- return #T17@<1,3> ---->
move $v0, $t0
jr $ra
#<---- END_BLOCK <1,3> ---->
#<--------------- FUNC func_05--------------->
func_label_func_05:
#<------- FORM_VAR_DEF a@<1,4> func_05 ------->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<---- LOAD #T18@<1,4> = a@<1,4>[0] ---->
#<---- Alloc $a3 for #T18 ---->
lw $a3, 0($a2)
#<---- #T19@<1,4> = #T18@<1,4> MUL 100 ---->
#<---- Alloc $t0 for #T19 ---->
li $v1, 100
mult $a3, $v1
mflo $t0
#<---- return #T19@<1,4> ---->
move $v0, $t0
jr $ra
#<---- END_BLOCK <1,4> ---->
#<--------------- FUNC func_06--------------->
func_label_func_06:
#<------- FORM_VAR_DEF a@<1,5> func_06 ------->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<---- LOAD #T20@<1,5> = a@<1,5>[0] ---->
#<---- Alloc $a3 for #T20 ---->
lw $a3, 0($a2)
#<---- LOAD #T21@<1,5> = a@<1,5>[4] ---->
#<---- Alloc $t0 for #T21 ---->
lw $t0, 16($a2)
#<---- #T22@<1,5> = #T20@<1,5> ADD #T21@<1,5> ---->
#<---- Alloc $t1 for #T22 ---->
addu $t1, $a3, $t0
#<---- LOAD #T23@<1,5> = a@<1,5>[8] ---->
#<---- Alloc $t2 for #T23 ---->
lw $t2, 32($a2)
#<---- #T24@<1,5> = #T22@<1,5> ADD #T23@<1,5> ---->
#<---- Alloc $t3 for #T24 ---->
addu $t3, $t1, $t2
#<---- return #T24@<1,5> ---->
move $v0, $t3
jr $ra
#<---- END_BLOCK <1,5> ---->
#<--------------- FUNC func_07--------------->
func_label_func_07:
#<------- FORM_VAR_DEF a@<1,6> func_07 ------->
#<---- Alloc $a2 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,6> func_07 ------->
#<---- Alloc $a3 for b ---->
lw $a3, 8($sp)
#<------- FORM_VAR_DEF c@<1,6> func_07 ------->
#<---- Alloc $t0 for c ---->
lw $t0, 12($sp)
#<---- LOAD #T25@<1,6> = b@<1,6>[0] ---->
#<---- Alloc $t1 for #T25 ---->
lw $t1, 0($a3)
#<---- #T26@<1,6> = a@<1,6> ADD #T25@<1,6> ---->
#<---- Alloc $t2 for #T26 ---->
addu $t2, $a2, $t1
#<---- LOAD #T27@<1,6> = c@<1,6>[0] ---->
#<---- Alloc $t3 for #T27 ---->
lw $t3, 0($t0)
#<---- #T28@<1,6> = #T26@<1,6> ADD #T27@<1,6> ---->
#<---- Alloc $t4 for #T28 ---->
addu $t4, $t2, $t3
#<---- return #T28@<1,6> ---->
move $v0, $t4
jr $ra
#<---- END_BLOCK <1,6> ---->
#<--------------- FUNC test_if_and_while_01--------------->
func_label_test_if_and_while_01:
#<---- var t_01@<1,7> = -10 ---->
#<---- Alloc $a2 for t_01 ---->
addiu $a2, $zero, -10
#<---- var t_02@<1,7> = 0 ---->
#<---- Alloc $a3 for t_02 ---->
move $a3, $zero
#<---- var t_03@<1,7> = 1 ---->
#<---- Alloc $t0 for t_03 ---->
addiu $t0, $zero, 1
#<---- var t_04@<1,7> = 0 ---->
#<---- Alloc $t1 for t_04 ---->
move $t1, $zero
#<---- var i@<1,7> = 0 ---->
#<---- Alloc $t2 for i ---->
move $t2, $zero
#<---- var j@<1,7> = 100 ---->
#<---- Alloc $t3 for j ---->
addiu $t3, $zero, 100
#<---- ASSIGN #T29@<1,7> = 0 ---->
#<---- Alloc $t4 for #T29 ---->
move $t4, $zero
#<---- ASSIGN #T30@<1,7> = 1 ---->
#<---- Alloc $t5 for #T30 ---->
addiu $t5, $zero, 1
#<---- JUMP_IF 1 == 0 ifElse_end_label_0 ---->
#<---- Cancel $a2 for t_01 ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for t_02 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for t_03 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for t_04 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for i ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for j ---->
sw $t3, 24($sp)
#<---- Cancel $t4 for #T29 ---->
#<---- Cancel $t5 for #T30 ---->
#<---- NEW_BLOCK <2,2> ---->
#<---- ASSIGN t_03@<1,7> = 2 ---->
#<---- Alloc $a2 for t_03 ---->
addiu $a2, $zero, 2
#<---- ASSIGN t_04@<1,7> = -1 ---->
#<---- Alloc $a3 for t_04 ---->
addiu $a3, $zero, -1
#<---- END_BLOCK <2,2> ---->
#<---- GEN_LABEL ifElse_end_label_0: ---->
#<---- Cancel $a2 for t_03 ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
ifElse_end_label_0:
#<---- ASSIGN #T31@<1,7> = 0 ---->
#<---- Alloc $a2 for #T31 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 0 Else_start_label_0 ---->
#<---- Cancel $a2 for #T31 ---->
j Else_start_label_0
#<---- NEW_BLOCK <2,3> ---->
#<---- ASSIGN t_04@<1,7> = v_01@<0,0> ---->
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
#<---- Alloc $a3 for t_04 ---->
addiu $a3, $a2, 0
#<---- SET #T32@<2,3> := t_03@<1,7> == 1 ---->
#<---- Alloc $t0 for #T32 ---->
#<---- Alloc $t1 for t_03 ---->
lw $t1, 12($sp)
seq $t0, $t1, 1
#<---- JUMP_IF #T32@<2,3> == 0 Else_start_label_1 ---->
#<---- Cancel $a2 for v_01 ---->
sw $a2, -48($gp)
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
#<---- Cancel $t1 for t_03 ---->
sw $t1, 12($sp)
beq $t0, 0, Else_start_label_1
#<---- PRE_CALL func_02@2 ---->
#<---- FUNC_CALL func_02@2 ---->
sw $ra, 0($sp)
#<---- Cancel $t0 for #T32 ---->
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
lw $ra, 0($sp)
#<---- ASSIGN #T33@<2,3> = %RTX ---->
#<---- Alloc $a2 for #T33 ---->
move $a2, $v0
#<---- ASSIGN t_04@<1,7> = #T33@<2,3> ---->
#<---- Alloc $a3 for t_04 ---->
addiu $a3, $a2, 0
#<---- JUMP ifElse_end_label_2 ---->
#<---- Cancel $a2 for #T33 ---->
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
j ifElse_end_label_2
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- ASSIGN t_04@<1,7> = 56088 ---->
#<---- Alloc $a2 for t_04 ---->
addiu $a2, $zero, 56088
#<---- GEN_LABEL ifElse_end_label_2: ---->
#<---- Cancel $a2 for t_04 ---->
sw $a2, 16($sp)
ifElse_end_label_2:
#<---- END_BLOCK <2,3> ---->
#<---- JUMP ifElse_end_label_1 ---->
j ifElse_end_label_1
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- NEW_BLOCK <2,4> ---->
#<---- PRE_CALL func_04@3 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@3 #arg: b ---->
#<---- Alloc $a2 for v_05 ---->
lw $a2, -32($gp)
sw $a2, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@3 #arg: a ---->
#<---- Alloc $a3 for v_01 ---->
lw $a3, -48($gp)
sw $a3, -44($sp)
#<---- FUNC_CALL func_04@3 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for v_05 ---->
sw $a2, -32($gp)
#<---- Cancel $a3 for v_01 ---->
sw $a3, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
lw $ra, 0($sp)
#<---- ASSIGN #T34@<2,4> = %RTX ---->
#<---- Alloc $a2 for #T34 ---->
move $a2, $v0
#<---- t_04@<1,7> = 0 SUB #T34@<2,4> ---->
#<---- Alloc $a3 for t_04 ---->
li $v1, 0
subu $a3, $v1, $a2
#<---- END_BLOCK <2,4> ---->
#<---- GEN_LABEL ifElse_end_label_1: ---->
#<---- Cancel $a2 for #T34 ---->
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
ifElse_end_label_1:
#<---- GEN_LABEL while_judge_label_0: ---->
while_judge_label_0:
#<---- SET #T36@<1,7> := 0 < t_04@<1,7> ---->
#<---- Alloc $a2 for #T36 ---->
#<---- Alloc $a3 for t_04 ---->
lw $a3, 16($sp)
sgt $a2, $a3, 0
#<---- JUMP_IF #T36@<1,7> == 0 while_end_label_0 ---->
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
beq $a2, 0, while_end_label_0
#<---- t_04@<1,7> = t_04@<1,7> SUB 1 ---->
#<---- Alloc $a3 for t_04 ---->
lw $a3, 16($sp)
addiu $a3, $a3, -1
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 for #T36 ---->
#<---- Cancel $a3 for t_04 ---->
sw $a3, 16($sp)
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- GEN_LABEL while_judge_label_1: ---->
while_judge_label_1:
#<---- ASSIGN #T38@<1,7> = 1 ---->
#<---- Alloc $a2 for #T38 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 while_end_label_1 ---->
#<---- Cancel $a2 for #T38 ---->
#<---- NEW_BLOCK <2,5> ---->
#<---- i@<1,7> = i@<1,7> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 20($sp)
addiu $a2, $a2, 1
#<---- SET #T40@<2,5> := i@<1,7> <= 10 ---->
#<---- Alloc $a3 for #T40 ---->
sle $a3, $a2, 10
#<---- JUMP_IF #T40@<2,5> == 0 ifElse_end_label_3 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
beq $a3, 0, ifElse_end_label_3
#<---- JUMP while_judge_label_1 ---->
#<---- Cancel $a3 for #T40 ---->
j while_judge_label_1
#<---- GEN_LABEL ifElse_end_label_3: ---->
ifElse_end_label_3:
#<---- SET #T41@<2,5> := i@<1,7> == 12 ---->
#<---- Alloc $a2 for #T41 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 20($sp)
seq $a2, $a3, 12
#<---- JUMP_IF #T41@<2,5> == 0 ifElse_end_label_4 ---->
#<---- Cancel $a3 for i ---->
sw $a3, 20($sp)
beq $a2, 0, ifElse_end_label_4
#<---- JUMP while_end_label_1 ---->
#<---- Cancel $a2 for #T41 ---->
j while_end_label_1
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- END_BLOCK <2,5> ---->
#<---- JUMP while_judge_label_1 ---->
j while_judge_label_1
#<---- GEN_LABEL while_end_label_1: ---->
while_end_label_1:
#<---- ASSIGN #T42@<1,7> = 1 ---->
#<---- Alloc $a2 for #T42 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 Else_start_label_2 ---->
#<---- Cancel $a2 for #T42 ---->
#<---- NEW_BLOCK <2,6> ---->
#<---- ASSIGN #T43@<2,6> = 1 ---->
#<---- Alloc $a2 for #T43 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 Else_start_label_3 ---->
#<---- Cancel $a2 for #T43 ---->
#<---- NEW_BLOCK <3,1> ---->
#<---- ASSIGN #T44@<3,1> = 1 ---->
#<---- Alloc $a2 for #T44 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 Else_start_label_4 ---->
#<---- Cancel $a2 for #T44 ---->
#<---- NEW_BLOCK <4,1> ---->
#<---- ASSIGN #T45@<4,1> = 1 ---->
#<---- Alloc $a2 for #T45 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 Else_start_label_5 ---->
#<---- Cancel $a2 for #T45 ---->
#<---- NEW_BLOCK <5,0> ---->
#<---- ASSIGN i@<1,7> = 0 ---->
#<---- Alloc $a2 for i ---->
move $a2, $zero
#<---- END_BLOCK <5,0> ---->
#<---- JUMP ifElse_end_label_8 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
j ifElse_end_label_8
#<---- GEN_LABEL Else_start_label_5: ---->
Else_start_label_5:
#<---- ASSIGN i@<1,7> = -1 ---->
#<---- Alloc $a2 for i ---->
addiu $a2, $zero, -1
#<---- GEN_LABEL ifElse_end_label_8: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
ifElse_end_label_8:
#<---- END_BLOCK <4,1> ---->
#<---- JUMP ifElse_end_label_7 ---->
j ifElse_end_label_7
#<---- GEN_LABEL Else_start_label_4: ---->
Else_start_label_4:
#<---- ASSIGN i@<1,7> = -2 ---->
#<---- Alloc $a2 for i ---->
addiu $a2, $zero, -2
#<---- GEN_LABEL ifElse_end_label_7: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
ifElse_end_label_7:
#<---- END_BLOCK <3,1> ---->
#<---- JUMP ifElse_end_label_6 ---->
j ifElse_end_label_6
#<---- GEN_LABEL Else_start_label_3: ---->
Else_start_label_3:
#<---- ASSIGN i@<1,7> = -3 ---->
#<---- Alloc $a2 for i ---->
addiu $a2, $zero, -3
#<---- GEN_LABEL ifElse_end_label_6: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
ifElse_end_label_6:
#<---- END_BLOCK <2,6> ---->
#<---- JUMP ifElse_end_label_5 ---->
j ifElse_end_label_5
#<---- GEN_LABEL Else_start_label_2: ---->
Else_start_label_2:
#<---- ASSIGN i@<1,7> = -4 ---->
#<---- Alloc $a2 for i ---->
addiu $a2, $zero, -4
#<---- GEN_LABEL ifElse_end_label_5: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 20($sp)
ifElse_end_label_5:
#<---- return i@<1,7> ---->
#<---- Alloc $a2 for i ---->
lw $a2, 20($sp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,7> ---->
#<--------------- FUNC test_if_and_while_02--------------->
func_label_test_if_and_while_02:
#<---- var i@<1,8> = 0 ---->
#<---- Alloc $a2 for i ---->
move $a2, $zero
#<---- JUMP_IF v_01@<0,0> == 0 ifElse_end_label_9 ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
beq $a2, 0, ifElse_end_label_9
#<---- ASSIGN i@<1,8> = 1 ---->
#<---- Alloc $a3 for i ---->
addiu $a3, $zero, 1
#<---- GEN_LABEL ifElse_end_label_9: ---->
#<---- Cancel $a2 for v_01 ---->
sw $a2, -48($gp)
#<---- Cancel $a3 for i ---->
sw $a3, 4($sp)
ifElse_end_label_9:
#<---- SET #T47@<1,8> := 123 < v_01@<0,0> ---->
#<---- Alloc $a2 for #T47 ---->
#<---- Alloc $a3 for v_01 ---->
lw $a3, -48($gp)
sgt $a2, $a3, 123
#<---- JUMP_IF #T47@<1,8> == 0 ifElse_end_label_10 ---->
#<---- Cancel $a3 for v_01 ---->
sw $a3, -48($gp)
beq $a2, 0, ifElse_end_label_10
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a3 for i ---->
lw $a3, 4($sp)
addiu $a3, $a3, 1
#<---- GEN_LABEL ifElse_end_label_10: ---->
#<---- Cancel $a2 for #T47 ---->
#<---- Cancel $a3 for i ---->
sw $a3, 4($sp)
ifElse_end_label_10:
#<---- #T49@<1,8> = 114514 MUL v_01@<0,0> ---->
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
#<---- Alloc $a3 for #T49 ---->
li $v1, 114514
mult $a2, $v1
mflo $a3
#<---- PRE_CALL func_03@4 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@4 #arg: a ---->
sw $a2, -20($sp)
#<---- FUNC_CALL func_03@4 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for v_01 ---->
sw $a2, -48($gp)
#<---- Cancel $a3 for #T49 ---->
sw $a3, 20($sp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T50@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T50 ---->
move $a2, $v0
#<---- #T51@<1,8> = #T50@<1,8> ADD 6 ---->
#<---- Alloc $a3 for #T51 ---->
addiu $a3, $a2, 6
#<---- #T52@<1,8> = 1 DIV #T51@<1,8> ---->
#<---- Alloc $t0 for #T52 ---->
addiu $v1, $zero, 1
div $v1, $a3
mflo $t0
#<---- #T53@<1,8> = #T49@<1,8> ADD #T52@<1,8> ---->
#<---- Alloc $t1 for #T49 ---->
lw $t1, 20($sp)
#<---- Alloc $t2 for #T53 ---->
addu $t2, $t1, $t0
#<---- SET #T54@<1,8> := #T53@<1,8> < 1 ---->
#<---- Alloc $t3 for #T54 ---->
slti $t3, $t2, 1
#<---- JUMP_IF #T54@<1,8> == 0 ifElse_end_label_11 ---->
#<---- Cancel $a2 for #T50 ---->
#<---- Cancel $a3 for #T51 ---->
#<---- Cancel $t0 for #T52 ---->
#<---- Cancel $t1 for #T49 ---->
#<---- Cancel $t2 for #T53 ---->
beq $t3, 0, ifElse_end_label_11
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_11: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Cancel $t3 for #T54 ---->
ifElse_end_label_11:
#<---- PRE_CALL func_03@5 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@5 #arg: a ---->
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
sw $a2, -20($sp)
#<---- FUNC_CALL func_03@5 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for v_01 ---->
sw $a2, -48($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T56@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T56 ---->
move $a2, $v0
#<---- PRE_CALL func_04@6 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@6 #arg: b ---->
#<---- Alloc $a3 for v_05 ---->
lw $a3, -32($gp)
sw $a3, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@6 #arg: a ---->
#<---- Alloc $t0 for v_01 ---->
lw $t0, -48($gp)
sw $t0, -44($sp)
#<---- FUNC_CALL func_04@6 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T56 ---->
sw $a2, 48($sp)
#<---- Cancel $a3 for v_05 ---->
sw $a3, -32($gp)
#<---- Cancel $t0 for v_01 ---->
sw $t0, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
lw $ra, 0($sp)
#<---- ASSIGN #T57@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T57 ---->
move $a2, $v0
#<---- SET #T58@<1,8> := #T56@<1,8> <= #T57@<1,8> ---->
#<---- Alloc $a3 for #T58 ---->
#<---- Alloc $t0 for #T56 ---->
lw $t0, 48($sp)
sle $a3, $t0, $a2
#<---- JUMP_IF #T58@<1,8> == 0 ifElse_end_label_12 ---->
#<---- Cancel $a2 for #T57 ---->
#<---- Cancel $t0 for #T56 ---->
beq $a3, 0, ifElse_end_label_12
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_12: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T58 ---->
ifElse_end_label_12:
#<---- PRE_CALL func_03@7 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_03@7 #arg: a ---->
#<---- Alloc $a2 for v_05 ---->
lw $a2, -32($gp)
sw $a2, -20($sp)
#<---- FUNC_CALL func_03@7 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for v_05 ---->
sw $a2, -32($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T60@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T60 ---->
move $a2, $v0
#<---- SET #T61@<1,8> := #T60@<1,8> <= 123 ---->
#<---- Alloc $a3 for #T61 ---->
sle $a3, $a2, 123
#<---- JUMP_IF #T61@<1,8> == 0 ifElse_end_label_13 ---->
#<---- Cancel $a2 for #T60 ---->
beq $a3, 0, ifElse_end_label_13
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_13: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T61 ---->
ifElse_end_label_13:
#<---- SET #T63@<1,8> := 123 < v_01@<0,0> ---->
#<---- Alloc $a2 for #T63 ---->
#<---- Alloc $a3 for v_01 ---->
lw $a3, -48($gp)
sgt $a2, $a3, 123
#<---- PRE_CALL func_03@8 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@8 #arg: a ---->
sw $a3, -20($sp)
#<---- FUNC_CALL func_03@8 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T63 ---->
sw $a2, 76($sp)
#<---- Cancel $a3 for v_01 ---->
sw $a3, -48($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T64@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T64 ---->
move $a2, $v0
#<---- PRE_CALL func_04@9 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@9 #arg: b ---->
#<---- Alloc $a3 for v_05 ---->
lw $a3, -32($gp)
sw $a3, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@9 #arg: a ---->
#<---- Alloc $t0 for v_01 ---->
lw $t0, -48($gp)
sw $t0, -44($sp)
#<---- FUNC_CALL func_04@9 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T64 ---->
sw $a2, 80($sp)
#<---- Cancel $a3 for v_05 ---->
sw $a3, -32($gp)
#<---- Cancel $t0 for v_01 ---->
sw $t0, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
lw $ra, 0($sp)
#<---- ASSIGN #T65@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T65 ---->
move $a2, $v0
#<---- SET #T66@<1,8> := #T64@<1,8> <= #T65@<1,8> ---->
#<---- Alloc $a3 for #T66 ---->
#<---- Alloc $t0 for #T64 ---->
lw $t0, 80($sp)
sle $a3, $t0, $a2
#<---- SET #T67@<1,8> := #T63@<1,8> == #T66@<1,8> ---->
#<---- Alloc $t1 for #T67 ---->
#<---- Alloc $t2 for #T63 ---->
lw $t2, 76($sp)
seq $t1, $t2, $a3
#<---- JUMP_IF #T67@<1,8> == 0 ifElse_end_label_14 ---->
#<---- Cancel $a2 for #T65 ---->
#<---- Cancel $a3 for #T66 ---->
#<---- Cancel $t0 for #T64 ---->
#<---- Cancel $t2 for #T63 ---->
beq $t1, 0, ifElse_end_label_14
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_14: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Cancel $t1 for #T67 ---->
ifElse_end_label_14:
#<---- SET #T69@<1,8> := 123 < v_01@<0,0> ---->
#<---- Alloc $a2 for #T69 ---->
#<---- Alloc $a3 for v_01 ---->
lw $a3, -48($gp)
sgt $a2, $a3, 123
#<---- PRE_CALL func_03@10 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@10 #arg: a ---->
sw $a3, -20($sp)
#<---- FUNC_CALL func_03@10 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T69 ---->
sw $a2, 100($sp)
#<---- Cancel $a3 for v_01 ---->
sw $a3, -48($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
lw $ra, 0($sp)
#<---- ASSIGN #T70@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T70 ---->
move $a2, $v0
#<---- PRE_CALL func_04@11 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@11 #arg: b ---->
#<---- Alloc $a3 for v_05 ---->
lw $a3, -32($gp)
sw $a3, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@11 #arg: a ---->
#<---- Alloc $t0 for v_01 ---->
lw $t0, -48($gp)
sw $t0, -44($sp)
#<---- FUNC_CALL func_04@11 ---->
sw $ra, 0($sp)
#<---- Cancel $a2 for #T70 ---->
sw $a2, 104($sp)
#<---- Cancel $a3 for v_05 ---->
sw $a3, -32($gp)
#<---- Cancel $t0 for v_01 ---->
sw $t0, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
lw $ra, 0($sp)
#<---- ASSIGN #T71@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T71 ---->
move $a2, $v0
#<---- SET #T72@<1,8> := #T71@<1,8> <= #T70@<1,8> ---->
#<---- Alloc $a3 for #T72 ---->
#<---- Alloc $t0 for #T70 ---->
lw $t0, 104($sp)
sle $a3, $a2, $t0
#<---- SET #T73@<1,8> := #T69@<1,8> != #T72@<1,8> ---->
#<---- Alloc $t1 for #T73 ---->
#<---- Alloc $t2 for #T69 ---->
lw $t2, 100($sp)
sne $t1, $t2, $a3
#<---- JUMP_IF #T73@<1,8> == 0 ifElse_end_label_15 ---->
#<---- Cancel $a2 for #T71 ---->
#<---- Cancel $a3 for #T72 ---->
#<---- Cancel $t0 for #T70 ---->
#<---- Cancel $t2 for #T69 ---->
beq $t1, 0, ifElse_end_label_15
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_15: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
#<---- Cancel $t1 for #T73 ---->
ifElse_end_label_15:
#<---- var j@<1,8> = 1 ---->
#<---- Alloc $a2 for j ---->
addiu $a2, $zero, 1
#<---- var k@<1,8> = 2 ---->
#<---- Alloc $a3 for k ---->
addiu $a3, $zero, 2
#<---- ASSIGN #T75@<1,8> = 1 ---->
#<---- Alloc $t0 for #T75 ---->
addiu $t0, $zero, 1
#<---- JUMP_IF 1 == 0 ifElse_end_label_16 ---->
#<---- Cancel $a2 for j ---->
sw $a2, 124($sp)
#<---- Cancel $a3 for k ---->
sw $a3, 128($sp)
#<---- Cancel $t0 for #T75 ---->
#<---- PRE_CALL func_02@12 ---->
#<---- FUNC_CALL func_02@12 ---->
sw $ra, 0($sp)
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
lw $ra, 0($sp)
#<---- ASSIGN #T76@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T76 ---->
move $a2, $v0
#<---- JUMP_IF #T76@<1,8> == 0 ifElse_end_label_16 ---->
beq $a2, 0, ifElse_end_label_16
#<---- ASSIGN #T77@<1,8> = 0 ---->
#<---- Alloc $a3 for #T77 ---->
move $a3, $zero
#<---- JUMP_IF 0 == 0 ifElse_end_label_16 ---->
#<---- Cancel $a2 for #T76 ---->
#<---- Cancel $a3 for #T77 ---->
j ifElse_end_label_16
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_16: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
ifElse_end_label_16:
#<---- ASSIGN #T79@<1,8> = 0 ---->
#<---- Alloc $a2 for #T79 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 1 or_label_0 ---->
#<---- Cancel $a2 for #T79 ---->
#<---- PRE_CALL func_02@13 ---->
#<---- FUNC_CALL func_02@13 ---->
sw $ra, 0($sp)
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
lw $ra, 0($sp)
#<---- ASSIGN #T80@<1,8> = %RTX ---->
#<---- Alloc $a2 for #T80 ---->
move $a2, $v0
#<---- JUMP_IF #T80@<1,8> == 0 ifElse_end_label_17 ---->
beq $a2, 0, ifElse_end_label_17
#<---- GEN_LABEL or_label_0: ---->
#<---- Cancel $a2 for #T80 ---->
or_label_0:
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_17: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
ifElse_end_label_17:
#<---- ASSIGN #T82@<1,8> = 0 ---->
#<---- Alloc $a2 for #T82 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 1 or_label_1 ---->
#<---- Cancel $a2 for #T82 ---->
#<---- ASSIGN #T83@<1,8> = 0 ---->
#<---- Alloc $a2 for #T83 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 1 or_label_1 ---->
#<---- Cancel $a2 for #T83 ---->
#<---- ASSIGN #T84@<1,8> = 0 ---->
#<---- Alloc $a2 for #T84 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 1 or_label_1 ---->
#<---- Cancel $a2 for #T84 ---->
#<---- ASSIGN #T85@<1,8> = 0 ---->
#<---- Alloc $a2 for #T85 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 0 ifElse_end_label_18 ---->
#<---- Cancel $a2 for #T85 ---->
j ifElse_end_label_18
#<---- GEN_LABEL or_label_1: ---->
or_label_1:
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_18: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
ifElse_end_label_18:
#<---- ASSIGN #T87@<1,8> = 0 ---->
#<---- Alloc $a2 for #T87 ---->
move $a2, $zero
#<---- JUMP_IF 0 == 1 or_label_2 ---->
#<---- Cancel $a2 for #T87 ---->
#<---- ASSIGN #T88@<1,8> = 1 ---->
#<---- Alloc $a2 for #T88 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 ifElse_end_label_19 ---->
#<---- Cancel $a2 for #T88 ---->
#<---- ASSIGN #T89@<1,8> = 1 ---->
#<---- Alloc $a2 for #T89 ---->
addiu $a2, $zero, 1
#<---- JUMP_IF 1 == 0 ifElse_end_label_19 ---->
#<---- Cancel $a2 for #T89 ---->
#<---- GEN_LABEL or_label_2: ---->
or_label_2:
#<---- i@<1,8> = i@<1,8> ADD 1 ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
addiu $a2, $a2, 1
#<---- GEN_LABEL ifElse_end_label_19: ---->
#<---- Cancel $a2 for i ---->
sw $a2, 4($sp)
ifElse_end_label_19:
#<---- return i@<1,8> ---->
#<---- Alloc $a2 for i ---->
lw $a2, 4($sp)
move $v0, $a2
jr $ra
#<---- END_BLOCK <1,8> ---->
#<--------------- FUNC main--------------->
func_label_main:
#<---- var vc@<1,9> = 1 ---->
#<---- Alloc $a2 for vc ---->
addiu $a2, $zero, 1
#<---- var vc_2@<1,9> = 3 ---->
#<---- Alloc $a3 for vc_2 ---->
addiu $a3, $zero, 3
#<---- var c_01@<1,9> = 2 ---->
#<---- Alloc $t0 for c_01 ---->
addiu $t0, $zero, 2
#<---- var v_PE_01@<1,9> = 114514 ---->
#<---- Alloc $t1 for v_PE_01 ---->
addiu $t1, $zero, 114514
#<---- var v_PE_02@<1,9> = v_01@<0,0> ---->
#<---- Alloc $t2 for v_01 ---->
lw $t2, -48($gp)
#<---- Alloc $t3 for v_PE_02 ---->
addiu $t3, $t2, 0
#<---- var v_PE_03@<1,9> = 2 ---->
#<---- Alloc $t4 for v_PE_03 ---->
addiu $t4, $zero, 2
#<---- ASSIGN #T91@<1,9> = 62 ---->
#<---- Alloc $t5 for #T91 ---->
addiu $t5, $zero, 62
#<---- ASSIGN #T92@<1,9> = -4 ---->
#<---- Alloc $t6 for #T92 ---->
addiu $t6, $zero, -4
#<---- ASSIGN #T93@<1,9> = -81 ---->
#<---- Alloc $t7 for #T93 ---->
addiu $t7, $zero, -81
#<---- ASSIGN #T94@<1,9> = -169 ---->
#<---- Alloc $t8 for #T94 ---->
addiu $t8, $zero, -169
#<---- PRE_CALL func_02@14 ---->
#<---- FUNC_CALL func_02@14 ---->
#<---- Cancel $t8 for #T94 ---->
#<---- Cancel $a2 for vc ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for vc_2 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for c_01 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for v_PE_01 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for v_01 ---->
sw $t2, -48($gp)
#<---- Cancel $t3 for v_PE_02 ---->
sw $t3, 20($sp)
#<---- Cancel $t4 for v_PE_03 ---->
sw $t4, 24($sp)
#<---- Cancel $t5 for #T91 ---->
#<---- Cancel $t6 for #T92 ---->
#<---- Cancel $t7 for #T93 ---->
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
#<---- ASSIGN #T95@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T95 ---->
move $a2, $v0
#<---- #T96@<1,9> = -169 ADD #T95@<1,9> ---->
#<---- Alloc $a3 for #T96 ---->
addiu $a3, $a2, -169
#<---- var v_PE_04@<1,9> = #T96@<1,9> ---->
#<---- Alloc $t0 for v_PE_04 ---->
addiu $t0, $a3, 0
#<---- var v_UE_01@<1,9> = 114514 ---->
#<---- Alloc $t1 for v_UE_01 ---->
addiu $t1, $zero, 114514
#<---- PRE_CALL func_03@15 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@15 #arg: a ---->
#<---- Alloc $t2 for v_01 ---->
lw $t2, -48($gp)
sw $t2, -20($sp)
#<---- FUNC_CALL func_03@15 ---->
#<---- Cancel $a2 for #T95 ---->
#<---- Cancel $a3 for #T96 ---->
sw $a3, 48($sp)
#<---- Cancel $t0 for v_PE_04 ---->
sw $t0, 52($sp)
#<---- Cancel $t1 for v_UE_01 ---->
sw $t1, 56($sp)
#<---- Cancel $t2 for v_01 ---->
sw $t2, -48($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
#<---- ASSIGN #T97@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T97 ---->
move $a2, $v0
#<---- var v_UE_02@<1,9> = #T97@<1,9> ---->
#<---- Alloc $a3 for v_UE_02 ---->
addiu $a3, $a2, 0
#<---- var v_UE_03_1@<1,9> = -114514 ---->
#<---- Alloc $t0 for v_UE_03_1 ---->
addiu $t0, $zero, -114514
#<---- PRE_CALL func_04@16 ---->
#<---- PUSH_PARA v_03@<0,0> #function: func_04@16 #arg: b ---->
#<---- Alloc $t1 for v_03 ---->
lw $t1, -40($gp)
sw $t1, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@16 #arg: a ---->
#<---- Alloc $t2 for v_01 ---->
lw $t2, -48($gp)
sw $t2, -44($sp)
#<---- FUNC_CALL func_04@16 ---->
#<---- Cancel $a2 for #T97 ---->
sw $a2, 60($sp)
#<---- Cancel $a3 for v_UE_02 ---->
sw $a3, 64($sp)
#<---- Cancel $t0 for v_UE_03_1 ---->
sw $t0, 68($sp)
#<---- Cancel $t1 for v_03 ---->
sw $t1, -40($gp)
#<---- Cancel $t2 for v_01 ---->
sw $t2, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
#<---- ASSIGN #T98@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T98 ---->
move $a2, $v0
#<---- #T99@<1,9> = 0 SUB #T98@<1,9> ---->
#<---- Alloc $a3 for #T99 ---->
li $v1, 0
subu $a3, $v1, $a2
#<---- var v_UE_03_2@<1,9> = #T99@<1,9> ---->
#<---- Alloc $t0 for v_UE_03_2 ---->
addiu $t0, $a3, 0
#<---- var v_ME_01@<1,9> = 114514 ---->
#<---- Alloc $t1 for v_ME_01 ---->
addiu $t1, $zero, 114514
#<---- #T100@<1,9> = 10 MUL v_01@<0,0> ---->
#<---- Alloc $t2 for v_01 ---->
lw $t2, -48($gp)
#<---- Alloc $t3 for #T100 ---->
li $v1, 10
mult $t2, $v1
mflo $t3
#<---- var v_ME_02@<1,9> = #T100@<1,9> ---->
#<---- Alloc $t4 for v_ME_02 ---->
addiu $t4, $t3, 0
#<---- PRE_CALL func_03@17 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@17 #arg: a ---->
sw $t2, -20($sp)
#<---- FUNC_CALL func_03@17 ---->
#<---- Cancel $a2 for #T98 ---->
#<---- Cancel $a3 for #T99 ---->
sw $a3, 76($sp)
#<---- Cancel $t0 for v_UE_03_2 ---->
sw $t0, 80($sp)
#<---- Cancel $t1 for v_ME_01 ---->
sw $t1, 84($sp)
#<---- Cancel $t2 for v_01 ---->
sw $t2, -48($gp)
#<---- Cancel $t3 for #T100 ---->
sw $t3, 88($sp)
#<---- Cancel $t4 for v_ME_02 ---->
sw $t4, 92($sp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
#<---- ASSIGN #T101@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T101 ---->
move $a2, $v0
#<---- #T102@<1,9> = #T101@<1,9> DIV 2 ---->
#<---- Alloc $a3 for #T102 ---->
sra $v1, $a2, 0
srl $v1, $v1, 31
addu $v1, $a2, $v1
sra $a3, $v1, 1
#<---- var v_ME_03@<1,9> = #T102@<1,9> ---->
#<---- Alloc $t0 for v_ME_03 ---->
addiu $t0, $a3, 0
#<---- PRE_CALL func_04@18 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@18 #arg: b ---->
#<---- Alloc $t1 for v_05 ---->
lw $t1, -32($gp)
sw $t1, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@18 #arg: a ---->
#<---- Alloc $t2 for v_01 ---->
lw $t2, -48($gp)
sw $t2, -44($sp)
#<---- FUNC_CALL func_04@18 ---->
#<---- Cancel $a2 for #T101 ---->
#<---- Cancel $a3 for #T102 ---->
sw $a3, 100($sp)
#<---- Cancel $t0 for v_ME_03 ---->
sw $t0, 104($sp)
#<---- Cancel $t1 for v_05 ---->
sw $t1, -32($gp)
#<---- Cancel $t2 for v_01 ---->
sw $t2, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
#<---- ASSIGN #T103@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T103 ---->
move $a2, $v0
#<---- #T104@<1,9> = 0 SUB #T103@<1,9> ---->
#<---- Alloc $a3 for #T104 ---->
li $v1, 0
subu $a3, $v1, $a2
#<---- #T105@<1,9> = -1 MOD #T104@<1,9> ---->
#<---- Alloc $t0 for #T105 ---->
addiu $v1, $zero, -1
div $v1, $a3
mfhi $t0
#<---- var v_ME_04@<1,9> = #T105@<1,9> ---->
#<---- Alloc $t1 for v_ME_04 ---->
addiu $t1, $t0, 0
#<---- var v_AE_01@<1,9> = 114514 ---->
#<---- Alloc $t2 for v_AE_01 ---->
addiu $t2, $zero, 114514
#<---- #T106@<1,9> = 114514 MUL v_01@<0,0> ---->
#<---- Alloc $t3 for v_01 ---->
lw $t3, -48($gp)
#<---- Alloc $t4 for #T106 ---->
li $v1, 114514
mult $t3, $v1
mflo $t4
#<---- PRE_CALL func_03@19 ---->
#<---- PUSH_PARA v_01@<0,0> #function: func_03@19 #arg: a ---->
sw $t3, -20($sp)
#<---- FUNC_CALL func_03@19 ---->
#<---- Cancel $a2 for #T103 ---->
#<---- Cancel $a3 for #T104 ---->
#<---- Cancel $t0 for #T105 ---->
sw $t0, 116($sp)
#<---- Cancel $t1 for v_ME_04 ---->
sw $t1, 120($sp)
#<---- Cancel $t2 for v_AE_01 ---->
sw $t2, 124($sp)
#<---- Cancel $t3 for v_01 ---->
sw $t3, -48($gp)
#<---- Cancel $t4 for #T106 ---->
sw $t4, 128($sp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
#<---- ASSIGN #T107@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T107 ---->
move $a2, $v0
#<---- #T108@<1,9> = #T107@<1,9> ADD 6 ---->
#<---- Alloc $a3 for #T108 ---->
addiu $a3, $a2, 6
#<---- #T109@<1,9> = 2 DIV #T108@<1,9> ---->
#<---- Alloc $t0 for #T109 ---->
addiu $v1, $zero, 2
div $v1, $a3
mflo $t0
#<---- #T110@<1,9> = #T106@<1,9> ADD #T109@<1,9> ---->
#<---- Alloc $t1 for #T106 ---->
lw $t1, 128($sp)
#<---- Alloc $t2 for #T110 ---->
addu $t2, $t1, $t0
#<---- var v_AE_02@<1,9> = #T110@<1,9> ---->
#<---- Alloc $t3 for v_AE_02 ---->
addiu $t3, $t2, 0
#<---- PRE_CALL func_04@20 ---->
#<---- PUSH_PARA v_05@<0,0> #function: func_04@20 #arg: b ---->
#<---- Alloc $t4 for v_05 ---->
lw $t4, -32($gp)
sw $t4, -40($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_04@20 #arg: a ---->
#<---- Alloc $t5 for v_01 ---->
lw $t5, -48($gp)
sw $t5, -44($sp)
#<---- FUNC_CALL func_04@20 ---->
#<---- Cancel $a2 for #T107 ---->
#<---- Cancel $a3 for #T108 ---->
#<---- Cancel $t0 for #T109 ---->
#<---- Cancel $t1 for #T106 ---->
#<---- Cancel $t2 for #T110 ---->
sw $t2, 144($sp)
#<---- Cancel $t3 for v_AE_02 ---->
sw $t3, 148($sp)
#<---- Cancel $t4 for v_05 ---->
sw $t4, -32($gp)
#<---- Cancel $t5 for v_01 ---->
sw $t5, -48($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
#<---- ASSIGN #T111@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T111 ---->
move $a2, $v0
#<---- #T112@<1,9> = 0 SUB #T111@<1,9> ---->
#<---- Alloc $a3 for #T112 ---->
li $v1, 0
subu $a3, $v1, $a2
#<---- #T113@<1,9> = -1 MOD #T112@<1,9> ---->
#<---- Alloc $t0 for #T113 ---->
addiu $v1, $zero, -1
div $v1, $a3
mfhi $t0
#<---- #T114@<1,9> = #T113@<1,9> SUB 123 ---->
#<---- Alloc $t1 for #T114 ---->
addiu $t1, $t0, -123
#<---- var v_AE_03@<1,9> = #T114@<1,9> ---->
#<---- Alloc $t2 for v_AE_03 ---->
addiu $t2, $t1, 0
#<---- var vs_const@<1,9>[0] = 1 ---->
li $v1, 1
sw $v1, 172($sp)
#<---- var vs_const@<1,9>[1] = 1 ---->
li $v1, 1
sw $v1, 176($sp)
#<---- var vs_01@<1,9>[0] = 1 ---->
li $v1, 1
sw $v1, 180($sp)
#<---- var vs_01@<1,9>[1] = 2 ---->
li $v1, 2
sw $v1, 184($sp)
#<---- var vs_01@<1,9>[2] = 3 ---->
li $v1, 3
sw $v1, 188($sp)
#<---- var vs_02@<1,9>[0] = 11 ---->
li $v1, 11
sw $v1, 192($sp)
#<---- var vs_02@<1,9>[1] = 12 ---->
li $v1, 12
sw $v1, 196($sp)
#<---- var vs_02@<1,9>[2] = 13 ---->
li $v1, 13
sw $v1, 200($sp)
#<---- var vs_02@<1,9>[3] = 21 ---->
li $v1, 21
sw $v1, 204($sp)
#<---- var vs_02@<1,9>[4] = 22 ---->
li $v1, 22
sw $v1, 208($sp)
#<---- var vs_02@<1,9>[5] = 23 ---->
li $v1, 23
sw $v1, 212($sp)
#<---- var vs_02@<1,9>[6] = 31 ---->
li $v1, 31
sw $v1, 216($sp)
#<---- var vs_02@<1,9>[7] = 32 ---->
li $v1, 32
sw $v1, 220($sp)
#<---- var vs_02@<1,9>[8] = 33 ---->
li $v1, 33
sw $v1, 224($sp)
#<---- var vs_03@<1,9> ---->
#<---- var vs_04@<1,9> ---->
#<---- var vs_05@<1,9> = 1 ---->
#<---- Alloc $t3 for vs_05 ---->
addiu $t3, $zero, 1
#<---- LOAD #T115@<1,9> = vs_01@<1,9>[1] ---->
#<---- Alloc $t4 for #T115 ---->
lw $t4, 184($sp)
#<---- var vs_06@<1,9> = #T115@<1,9> ---->
#<---- Alloc $t5 for vs_06 ---->
addiu $t5, $t4, 0
#<---- LOAD #T116@<1,9> = vs_02@<1,9>[5] ---->
#<---- Alloc $t6 for #T116 ---->
lw $t6, 212($sp)
#<---- var vs_07@<1,9> = #T116@<1,9> ---->
#<---- Alloc $t7 for vs_07 ---->
addiu $t7, $t6, 0
#<---- SAVE vs_01@<1,9>[0] = 10 ---->
li $v1, 10
addiu $v0, $sp, 180
sw $v1, 0($v0)
#<---- SAVE vs_02@<1,9>[5] = 10 ---->
li $v1, 10
addiu $v0, $sp, 192
sw $v1, 20($v0)
#<---- #T117@<1,9> = 1 ADD #T115@<1,9> ---->
#<---- Alloc $t8 for #T117 ---->
addiu $t8, $t4, 1
#<---- #T118@<1,9> = #T117@<1,9> ADD #T116@<1,9> ---->
#<---- Alloc $t9 for #T118 ---->
addu $t9, $t8, $t6
#<---- PRE_CALL func_05@21 ---->
#<---- PUSH_PARA vs_02@<1,9>[0] #function: func_05@21 #arg: a ---->
addiu $v1, $sp, 192
sw $v1, -12($sp)
#<---- FUNC_CALL func_05@21 ---->
#<---- Cancel $a2 for #T111 ---->
#<---- Cancel $a3 for #T112 ---->
#<---- Cancel $t0 for #T113 ---->
#<---- Cancel $t1 for #T114 ---->
sw $t1, 164($sp)
#<---- Cancel $t2 for v_AE_03 ---->
sw $t2, 168($sp)
#<---- Cancel $t3 for vs_05 ---->
sw $t3, 276($sp)
#<---- Cancel $t4 for #T115 ---->
#<---- Cancel $t5 for vs_06 ---->
sw $t5, 284($sp)
#<---- Cancel $t6 for #T116 ---->
#<---- Cancel $t7 for vs_07 ---->
sw $t7, 292($sp)
#<---- Cancel $t8 for #T117 ---->
#<---- Cancel $t9 for #T118 ---->
sw $t9, 300($sp)
addiu $sp, $sp, -16
jal func_label_func_05
addiu $sp, $sp, 16
#<---- ASSIGN #T119@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T119 ---->
move $a2, $v0
#<---- #T120@<1,9> = #T118@<1,9> ADD #T119@<1,9> ---->
#<---- Alloc $a3 for #T118 ---->
lw $a3, 300($sp)
#<---- Alloc $t0 for #T120 ---->
addu $t0, $a3, $a2
#<---- PRE_CALL func_06@22 ---->
#<---- PUSH_PARA vs_02@<1,9> #function: func_06@22 #arg: a ---->
addiu $v1, $sp, 192
sw $v1, -24($sp)
#<---- FUNC_CALL func_06@22 ---->
#<---- Cancel $a2 for #T119 ---->
#<---- Cancel $a3 for #T118 ---->
#<---- Cancel $t0 for #T120 ---->
sw $t0, 308($sp)
addiu $sp, $sp, -28
jal func_label_func_06
addiu $sp, $sp, 28
#<---- ASSIGN #T121@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T121 ---->
move $a2, $v0
#<---- #T122@<1,9> = #T120@<1,9> ADD #T121@<1,9> ---->
#<---- Alloc $a3 for #T120 ---->
lw $a3, 308($sp)
#<---- Alloc $t0 for #T122 ---->
addu $t0, $a3, $a2
#<---- PRE_CALL func_07@23 ---->
#<---- PUSH_PARA vs_02@<1,9> #function: func_07@23 #arg: c ---->
addiu $v1, $sp, 192
sw $v1, -20($sp)
#<---- PUSH_PARA vs_01@<1,9> #function: func_07@23 #arg: b ---->
addiu $v1, $sp, 180
sw $v1, -24($sp)
#<---- PUSH_PARA v_01@<0,0> #function: func_07@23 #arg: a ---->
#<---- Alloc $t1 for v_01 ---->
lw $t1, -48($gp)
sw $t1, -28($sp)
#<---- FUNC_CALL func_07@23 ---->
#<---- Cancel $a2 for #T121 ---->
#<---- Cancel $a3 for #T120 ---->
#<---- Cancel $t0 for #T122 ---->
sw $t0, 316($sp)
#<---- Cancel $t1 for v_01 ---->
sw $t1, -48($gp)
addiu $sp, $sp, -32
jal func_label_func_07
addiu $sp, $sp, 32
#<---- ASSIGN #T123@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T123 ---->
move $a2, $v0
#<---- #T124@<1,9> = #T122@<1,9> ADD #T123@<1,9> ---->
#<---- Alloc $a3 for #T122 ---->
lw $a3, 316($sp)
#<---- Alloc $t0 for #T124 ---->
addu $t0, $a3, $a2
#<---- var vs_test@<1,9> = #T124@<1,9> ---->
#<---- Alloc $t1 for vs_test ---->
addiu $t1, $t0, 0
#<---- var vm@<1,9> ---->
#<---- Alloc $t2 for vm ---->
#<---- var v_02@<1,9> = 1 ---->
#<---- Alloc $t3 for v_02 ---->
addiu $t3, $zero, 1
#<---- var vm_01@<1,9> ---->
#<---- Alloc $t4 for vm_01 ---->
#<---- ASSIGN vm_01@<1,9> = 0 ---->
move $t4, $zero
#<---- PRE_CALL test_if_and_while_01@24 ---->
#<---- FUNC_CALL test_if_and_while_01@24 ---->
#<---- Cancel $a2 for #T123 ---->
#<---- Cancel $a3 for #T122 ---->
#<---- Cancel $t0 for #T124 ---->
#<---- Cancel $t1 for vs_test ---->
sw $t1, 328($sp)
#<---- Cancel $t2 for vm ---->
sw $t2, 332($sp)
#<---- Cancel $t3 for v_02 ---->
sw $t3, 336($sp)
#<---- Cancel $t4 for vm_01 ---->
sw $t4, 340($sp)
addiu $sp, $sp, -96
jal func_label_test_if_and_while_01
addiu $sp, $sp, 96
#<---- ASSIGN #T125@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T125 ---->
move $a2, $v0
#<---- var vm_i_1@<1,9> = #T125@<1,9> ---->
#<---- Alloc $a3 for vm_i_1 ---->
addiu $a3, $a2, 0
#<---- PRE_CALL test_if_and_while_02@25 ---->
#<---- FUNC_CALL test_if_and_while_02@25 ---->
#<---- Cancel $a2 for #T125 ---->
#<---- Cancel $a3 for vm_i_1 ---->
sw $a3, 348($sp)
addiu $sp, $sp, -196
jal func_label_test_if_and_while_02
addiu $sp, $sp, 196
#<---- ASSIGN #T126@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T126 ---->
move $a2, $v0
#<---- var vm_i_2@<1,9> = #T126@<1,9> ---->
#<---- Alloc $a3 for vm_i_2 ---->
addiu $a3, $a2, 0
#<---- PRE_CALL func_02@26 ---->
#<---- FUNC_CALL func_02@26 ---->
#<---- Cancel $a2 for #T126 ---->
#<---- Cancel $a3 for vm_i_2 ---->
sw $a3, 356($sp)
addiu $sp, $sp, -52
jal func_label_func_02
addiu $sp, $sp, 52
#<---- ASSIGN #T127@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T127 ---->
move $a2, $v0
#<---- var vm_02@<1,9> = #T127@<1,9> ---->
#<---- Alloc $a3 for vm_02 ---->
addiu $a3, $a2, 0
#<---- PRE_CALL func_03@27 ---->
#<---- PUSH_PARA v_03@<0,0> #function: func_03@27 #arg: a ---->
#<---- Alloc $t0 for v_03 ---->
lw $t0, -40($gp)
sw $t0, -20($sp)
#<---- FUNC_CALL func_03@27 ---->
#<---- Cancel $a2 for #T127 ---->
#<---- Cancel $a3 for vm_02 ---->
sw $a3, 364($sp)
#<---- Cancel $t0 for v_03 ---->
sw $t0, -40($gp)
addiu $sp, $sp, -24
jal func_label_func_03
addiu $sp, $sp, 24
#<---- ASSIGN #T128@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T128 ---->
move $a2, $v0
#<---- var vm_03@<1,9> = #T128@<1,9> ---->
#<---- Alloc $a3 for vm_03 ---->
addiu $a3, $a2, 0
#<---- PRE_CALL func_04@28 ---->
#<---- PUSH_PARA v_03@<0,0> #function: func_04@28 #arg: b ---->
#<---- Alloc $t0 for v_03 ---->
lw $t0, -40($gp)
sw $t0, -40($sp)
#<---- PUSH_PARA 1 #function: func_04@28 #arg: a ---->
li $v1, 1
sw $v1, -44($sp)
#<---- FUNC_CALL func_04@28 ---->
#<---- Cancel $a2 for #T128 ---->
#<---- Cancel $a3 for vm_03 ---->
sw $a3, 372($sp)
#<---- Cancel $t0 for v_03 ---->
sw $t0, -40($gp)
addiu $sp, $sp, -48
jal func_label_func_04
addiu $sp, $sp, 48
#<---- ASSIGN #T129@<1,9> = %RTX ---->
#<---- Alloc $a2 for #T129 ---->
move $a2, $v0
#<---- var vm_04@<1,9> = #T129@<1,9> ---->
#<---- Alloc $a3 for vm_04 ---->
addiu $a3, $a2, 0
#<---- #T130@<1,9> = 114514 DIV #T110@<1,9> ---->
#<---- Alloc $t0 for #T110 ---->
lw $t0, 144($sp)
#<---- Alloc $t1 for #T130 ---->
addiu $v1, $zero, 114514
div $v1, $t0
mflo $t1
#<---- #T131@<1,9> = #T130@<1,9> MOD #T114@<1,9> ---->
#<---- Alloc $t2 for #T114 ---->
lw $t2, 164($sp)
#<---- Alloc $t3 for #T131 ---->
div $t1, $t2
mfhi $t3
#<---- var vm_AE@<1,9> = #T131@<1,9> ---->
#<---- Alloc $t4 for vm_AE ---->
addiu $t4, $t3, 0
#<---- #T132@<1,9> = 114514 MUL #T100@<1,9> ---->
#<---- Alloc $t5 for #T100 ---->
lw $t5, 88($sp)
#<---- Alloc $t6 for #T132 ---->
li $v1, 114514
mult $t5, $v1
mflo $t6
#<---- #T133@<1,9> = #T102@<1,9> MUL #T105@<1,9> ---->
#<---- Alloc $t7 for #T105 ---->
lw $t7, 116($sp)
#<---- Alloc $t8 for #T102 ---->
lw $t8, 100($sp)
#<---- Alloc $t9 for #T133 ---->
mult $t8, $t7
mflo $t9
#<---- #T134@<1,9> = #T132@<1,9> ADD #T133@<1,9> ---->
#<---- Alloc $s0 for #T134 ---->
addu $s0, $t6, $t9
#<---- var vm_ME@<1,9> = #T134@<1,9> ---->
#<---- Alloc $s1 for vm_ME ---->
addiu $s1, $s0, 0
#<---- #T135@<1,9> = 114514 SUB #T97@<1,9> ---->
#<---- Alloc $s2 for #T97 ---->
lw $s2, 60($sp)
#<---- Alloc $s3 for #T135 ---->
li $v1, 114514
subu $s3, $v1, $s2
#<---- #T136@<1,9> = #T135@<1,9> SUB -114514 ---->
#<---- Alloc $s4 for #T136 ---->
addiu $s4, $s3, 114514
#<---- #T137@<1,9> = #T136@<1,9> SUB -114514 ---->
#<---- Alloc $s5 for #T137 ---->
addiu $s5, $s4, 114514
#<---- #T138@<1,9> = #T137@<1,9> SUB #T99@<1,9> ---->
#<---- Alloc $s6 for #T99 ---->
lw $s6, 76($sp)
#<---- Alloc $s7 for #T138 ---->
subu $s7, $s5, $s6
#<---- var vm_UE@<1,9> = #T138@<1,9> ---->
#<---- Alloc $fp for vm_UE ---->
addiu $fp, $s7, 0
#<---- #T139@<1,9> = 114514 ADD v_01@<0,0> ---->
#<---- Cancel $a2 for #T129 ---->
#<---- Alloc $a2 for v_01 ---->
lw $a2, -48($gp)
#<---- Cancel $a3 for vm_04 ---->
sw $a3, 380($sp)
#<---- Alloc $a3 for #T139 ---->
addiu $a3, $a2, 114514
#<---- #T140@<1,9> = #T139@<1,9> ADD 2 ---->
#<---- Cancel $t0 for #T110 ---->
#<---- Alloc $t0 for #T140 ---->
addiu $t0, $a3, 2
#<---- #T141@<1,9> = #T140@<1,9> ADD #T96@<1,9> ---->
#<---- Cancel $t1 for #T130 ---->
#<---- Alloc $t1 for #T96 ---->
lw $t1, 48($sp)
#<---- Cancel $t2 for #T114 ---->
#<---- Alloc $t2 for #T141 ---->
addu $t2, $t0, $t1
#<---- var vm_PE@<1,9> = #T141@<1,9> ---->
#<---- Cancel $t3 for #T131 ---->
#<---- Alloc $t3 for vm_PE ---->
addiu $t3, $t2, 0
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print #T141@<1,9> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,9> ---->
