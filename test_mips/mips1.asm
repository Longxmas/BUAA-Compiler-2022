.data
array_carray1_: .space 8
array_carray2_: .space 8
array_carray3_: .space 8
array_carrays1_: .space 16
array_carrays2_: .space 16
array_carrays3_: .space 16
str0: .asciiz "19373749\n"
str1: .asciiz "\n"
str2: .asciiz "\n"
str3: .asciiz "yes\n"
str4: .asciiz "no\n"
str5: .asciiz "\n"
str6: .asciiz "\n"
str7: .asciiz "\n"
str8: .asciiz "\n"
str9: .asciiz "\n"
str10: .asciiz "\n"
.text
addi $gp, $gp, 84
#<------- var cnum1@<0,0> = 1 ------->
li $t0, 1
sw $t0, -84($gp)
#<------- var cnum2@<0,0> = 2 ------->
li $t0, 2
sw $t0, -80($gp)
#<------- var cnum3@<0,0> = 3 ------->
li $t0, 3
sw $t0, -76($gp)
#<------- var carray1@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_carray1_
#<------- var carray1@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_carray1_+4
#<------- var carray2@<0,0>[0] = 3 ------->
li $t0, 3
sw $t0, array_carray2_
#<------- var carray2@<0,0>[1] = 4 ------->
li $t0, 4
sw $t0, array_carray2_+4
#<------- var carray3@<0,0>[0] = 5 ------->
li $t0, 5
sw $t0, array_carray3_
#<------- var carray3@<0,0>[1] = 6 ------->
li $t0, 6
sw $t0, array_carray3_+4
#<------- var carrays1@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_carrays1_
#<------- var carrays1@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_carrays1_+4
#<------- var carrays1@<0,0>[2] = 3 ------->
li $t0, 3
sw $t0, array_carrays1_+8
#<------- var carrays1@<0,0>[3] = 4 ------->
li $t0, 4
sw $t0, array_carrays1_+12
#<------- var carrays2@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_carrays2_
#<------- var carrays2@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_carrays2_+4
#<------- var carrays2@<0,0>[2] = 5 ------->
li $t0, 5
sw $t0, array_carrays2_+8
#<------- var carrays2@<0,0>[3] = 6 ------->
li $t0, 6
sw $t0, array_carrays2_+12
#<------- var carrays3@<0,0>[0] = 1 ------->
li $t0, 1
sw $t0, array_carrays3_
#<------- var carrays3@<0,0>[1] = 2 ------->
li $t0, 2
sw $t0, array_carrays3_+4
#<------- var carrays3@<0,0>[2] = 7 ------->
li $t0, 7
sw $t0, array_carrays3_+8
#<------- var carrays3@<0,0>[3] = 8 ------->
li $t0, 8
sw $t0, array_carrays3_+12
addiu $sp, $sp, -216
j func_label_main
#<--------------- FUNC vfun1--------------->
func_label_vfun1:
#<---- END_BLOCK <1,0> ---->
jr $ra
#<--------------- FUNC vfun2--------------->
func_label_vfun2:
#<------- FORM_VAR_DEF a@<1,1> vfun2 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- END_BLOCK <1,1> ---->
jr $ra
#<--------------- FUNC vfun3--------------->
func_label_vfun3:
#<------- FORM_VAR_DEF a@<1,2> vfun3 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,2> vfun3 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- END_BLOCK <1,2> ---->
jr $ra
#<--------------- FUNC vfun4--------------->
func_label_vfun4:
#<------- FORM_VAR_DEF a@<1,3> vfun4 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- END_BLOCK <1,3> ---->
jr $ra
#<--------------- FUNC vfun5--------------->
func_label_vfun5:
#<------- FORM_VAR_DEF a@<1,4> vfun5 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,4> vfun5 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- END_BLOCK <1,4> ---->
jr $ra
#<--------------- FUNC vfun6--------------->
func_label_vfun6:
#<------- FORM_VAR_DEF a@<1,5> vfun6 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- END_BLOCK <1,5> ---->
jr $ra
#<--------------- FUNC vfun7--------------->
func_label_vfun7:
#<------- FORM_VAR_DEF a@<1,6> vfun7 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,6> vfun7 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- END_BLOCK <1,6> ---->
jr $ra
#<--------------- FUNC ifun1--------------->
func_label_ifun1:
#<---- return 0 ---->
li $v0, 0
jr $ra
#<---- END_BLOCK <1,7> ---->
#<--------------- FUNC ifun2--------------->
func_label_ifun2:
#<------- FORM_VAR_DEF a@<1,8> ifun2 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- #T0@<1,8> = a@<1,8> ADD a@<1,8> ---->
#<---- Alloc $a3 which index is 1 for #T0 ---->
addu $a3, $a2, $a2
#<---- return #T0@<1,8> ---->
move $v0, $a3
jr $ra
#<---- END_BLOCK <1,8> ---->
#<--------------- FUNC ifun3--------------->
func_label_ifun3:
#<------- FORM_VAR_DEF a@<1,9> ifun3 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,9> ifun3 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- #T1@<1,9> = a@<1,9> ADD b@<1,9> ---->
#<---- Alloc $t0 which index is 2 for #T1 ---->
addu $t0, $a2, $a3
#<---- return #T1@<1,9> ---->
move $v0, $t0
jr $ra
#<---- END_BLOCK <1,9> ---->
#<--------------- FUNC ifun4--------------->
func_label_ifun4:
#<------- FORM_VAR_DEF a@<1,10> ifun4 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- LOAD #T2@<1,10> = a@<1,10>[0] ---->
#<---- Alloc $a3 which index is 1 for #T2 ---->
lw $a3, 0($a2)
#<---- return #T2@<1,10> ---->
move $v0, $a3
jr $ra
#<---- END_BLOCK <1,10> ---->
#<--------------- FUNC ifun5--------------->
func_label_ifun5:
#<------- FORM_VAR_DEF a@<1,11> ifun5 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,11> ifun5 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- LOAD #T3@<1,11> = a@<1,11>[0] ---->
#<---- Alloc $t0 which index is 2 for #T3 ---->
lw $t0, 0($a2)
#<---- LOAD #T4@<1,11> = b@<1,11>[0] ---->
#<---- Alloc $t1 which index is 3 for #T4 ---->
lw $t1, 0($a3)
#<---- #T5@<1,11> = #T3@<1,11> ADD #T4@<1,11> ---->
#<---- Alloc $t2 which index is 4 for #T5 ---->
addu $t2, $t0, $t1
#<---- return #T5@<1,11> ---->
move $v0, $t2
jr $ra
#<---- END_BLOCK <1,11> ---->
#<--------------- FUNC ifun6--------------->
func_label_ifun6:
#<------- FORM_VAR_DEF a@<1,12> ifun6 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<---- LOAD #T6@<1,12> = a@<1,12>[0] ---->
#<---- Alloc $a3 which index is 1 for #T6 ---->
lw $a3, 0($a2)
#<---- return #T6@<1,12> ---->
move $v0, $a3
jr $ra
#<---- END_BLOCK <1,12> ---->
#<--------------- FUNC ifun7--------------->
func_label_ifun7:
#<------- FORM_VAR_DEF a@<1,13> ifun7 ------->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
#<------- FORM_VAR_DEF b@<1,13> ifun7 ------->
#<---- Alloc $a3 which index is 1 for b ---->
lw $a3, 8($sp)
#<---- LOAD #T7@<1,13> = a@<1,13>[0] ---->
#<---- Alloc $t0 which index is 2 for #T7 ---->
lw $t0, 0($a2)
#<---- LOAD #T8@<1,13> = b@<1,13>[0] ---->
#<---- Alloc $t1 which index is 3 for #T8 ---->
lw $t1, 0($a3)
#<---- #T9@<1,13> = #T7@<1,13> ADD #T8@<1,13> ---->
#<---- Alloc $t2 which index is 4 for #T9 ---->
addu $t2, $t0, $t1
#<---- return #T9@<1,13> ---->
move $v0, $t2
jr $ra
#<---- END_BLOCK <1,13> ---->
#<--------------- FUNC main--------------->
func_label_main:
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- var array1@<1,14>[0] = 1 ---->
li $v1, 1
sw $v1, 16($sp)
#<---- var array1@<1,14>[1] = 2 ---->
li $v1, 2
sw $v1, 20($sp)
#<---- var array2@<1,14>[0] = 3 ---->
li $v1, 3
sw $v1, 24($sp)
#<---- var array2@<1,14>[1] = 4 ---->
li $v1, 4
sw $v1, 28($sp)
#<---- var array3@<1,14>[0] = 5 ---->
li $v1, 5
sw $v1, 32($sp)
#<---- var array3@<1,14>[1] = 6 ---->
li $v1, 6
sw $v1, 36($sp)
#<---- var arrays1@<1,14>[0] = 1 ---->
li $v1, 1
sw $v1, 40($sp)
#<---- var arrays1@<1,14>[1] = 2 ---->
li $v1, 2
sw $v1, 44($sp)
#<---- var arrays1@<1,14>[2] = 3 ---->
li $v1, 3
sw $v1, 48($sp)
#<---- var arrays1@<1,14>[3] = 4 ---->
li $v1, 4
sw $v1, 52($sp)
#<---- var arrays2@<1,14>[0] = 1 ---->
li $v1, 1
sw $v1, 56($sp)
#<---- var arrays2@<1,14>[1] = 2 ---->
li $v1, 2
sw $v1, 60($sp)
#<---- var arrays2@<1,14>[2] = 5 ---->
li $v1, 5
sw $v1, 64($sp)
#<---- var arrays2@<1,14>[3] = 6 ---->
li $v1, 6
sw $v1, 68($sp)
#<---- var arrays3@<1,14>[0] = 1 ---->
li $v1, 1
sw $v1, 72($sp)
#<---- var arrays3@<1,14>[1] = 2 ---->
li $v1, 2
sw $v1, 76($sp)
#<---- var arrays3@<1,14>[2] = 7 ---->
li $v1, 7
sw $v1, 80($sp)
#<---- var arrays3@<1,14>[3] = 8 ---->
li $v1, 8
sw $v1, 84($sp)
#<---- ASSIGN a@<1,14> = 1 ---->
#<---- Alloc $a2 which index is 0 for a ---->
addiu $a2, $zero, 1
#<---- ASSIGN #T10@<1,14> = 1 ---->
#<---- Alloc $a3 which index is 1 for #T10 ---->
addiu $a3, $zero, 1
#<---- SAVE array1@<1,14>[#T10@<1,14>] = 3 ---->
sll $a1, $a3, 2
li $v1, 3
addiu $v0, $sp, 16
addu $v0, $v0, $a1
sw $v1, 0($v0)
#<---- LOAD #T11@<1,14> = array1@<1,14>[1] ---->
#<---- Alloc $t0 which index is 2 for #T11 ---->
lw $t0, 20($sp)
#<---- LOAD #T12@<1,14> = array1@<1,14>[0] ---->
#<---- Alloc $t1 which index is 3 for #T12 ---->
lw $t1, 16($sp)
#<---- #T13@<1,14> = #T11@<1,14> ADD #T12@<1,14> ---->
#<---- Alloc $t2 which index is 4 for #T13 ---->
addu $t2, $t0, $t1
#<---- print #T13@<1,14> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- NEW_BLOCK <2,0> ---->
#<---- END_BLOCK <2,0> ---->
#<---- GEN_LABEL ifElse_begin_label_0: ---->
#<---- Cancel $a2 which index is 0 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 which index is 1 for #T10 ---->
#<---- Cancel $t0 which index is 2 for #T11 ---->
#<---- Cancel $t1 which index is 3 for #T12 ---->
#<---- Cancel $t2 which index is 4 for #T13 ---->
ifElse_begin_label_0:
#<---- NEW_BLOCK <2,1> ---->
#<---- ASSIGN 1 = 1 ---->
#<---- END_BLOCK <2,1> ---->
#<---- GEN_LABEL ifElse_end_label_0: ---->
ifElse_end_label_0:
#<---- GEN_LABEL ifElse_begin_label_1: ---->
ifElse_begin_label_1:
#<---- JUMP ifElse_end_label_1 ---->
j ifElse_end_label_1
#<---- NEW_BLOCK <2,2> ---->
#<---- ASSIGN a@<1,14> = 1 ---->
#<---- Alloc $a2 which index is 0 for a ---->
addiu $a2, $zero, 1
#<---- END_BLOCK <2,2> ---->
#<---- GEN_LABEL ifElse_end_label_1: ---->
#<---- Cancel $a2 which index is 0 for a ---->
sw $a2, 4($sp)
ifElse_end_label_1:
#<---- GEN_LABEL ifElse_begin_label_2: ---->
ifElse_begin_label_2:
#<---- JUMP ifElse_end_label_2 ---->
j ifElse_end_label_2
#<---- NEW_BLOCK <2,3> ---->
#<---- ASSIGN a@<1,14> = 1 ---->
#<---- Alloc $a2 which index is 0 for a ---->
addiu $a2, $zero, 1
#<---- END_BLOCK <2,3> ---->
#<---- GEN_LABEL ifElse_end_label_2: ---->
#<---- Cancel $a2 which index is 0 for a ---->
sw $a2, 4($sp)
ifElse_end_label_2:
#<---- GEN_LABEL ifElse_begin_label_3: ---->
ifElse_begin_label_3:
#<---- JUMP ifElse_end_label_3 ---->
j ifElse_end_label_3
#<---- NEW_BLOCK <2,4> ---->
#<---- ASSIGN a@<1,14> = 1 ---->
#<---- Alloc $a2 which index is 0 for a ---->
addiu $a2, $zero, 1
#<---- END_BLOCK <2,4> ---->
#<---- GEN_LABEL ifElse_end_label_3: ---->
#<---- Cancel $a2 which index is 0 for a ---->
sw $a2, 4($sp)
ifElse_end_label_3:
#<---- GEN_LABEL ifElse_begin_label_4: ---->
ifElse_begin_label_4:
#<---- SET #T15@<1,14> := 0 <= a@<1,14> ---->
#<---- Alloc $a2 which index is 0 for #T15 ---->
#<---- Alloc $a3 which index is 1 for a ---->
lw $a3, 4($sp)
sge $a2, $a3, 0
#<---- JUMP_IF #T15@<1,14> == 0 Else_start_label_0 ---->
#<---- Cancel $a3 which index is 1 for a ---->
sw $a3, 4($sp)
beq $a2, 0, Else_start_label_0
#<---- NEW_BLOCK <2,5> ---->
#<---- a@<1,14> = a@<1,14> ADD a@<1,14> ---->
#<---- Alloc $a3 which index is 1 for a ---->
lw $a3, 4($sp)
addu $a3, $a3, $a3
#<---- END_BLOCK <2,5> ---->
#<---- JUMP ifElse_end_label_4 ---->
#<---- Cancel $a2 which index is 0 for #T15 ---->
#<---- Cancel $a3 which index is 1 for a ---->
sw $a3, 4($sp)
j ifElse_end_label_4
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- NEW_BLOCK <2,6> ---->
#<---- END_BLOCK <2,6> ---->
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- print a@<1,14> ---->
#<---- Alloc $a2 which index is 0 for a ---->
lw $a2, 4($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_begin_label_5: ---->
#<---- Cancel $a2 which index is 0 for a ---->
sw $a2, 4($sp)
ifElse_begin_label_5:
#<---- SET #T18@<1,14> := a@<1,14> == 0 ---->
#<---- Alloc $a2 which index is 0 for #T18 ---->
#<---- Alloc $a3 which index is 1 for a ---->
lw $a3, 4($sp)
seq $a2, $a3, 0
#<---- JUMP_IF #T18@<1,14> == 0 ifElse_end_label_5 ---->
#<---- Cancel $a3 which index is 1 for a ---->
sw $a3, 4($sp)
beq $a2, 0, ifElse_end_label_5
#<---- NEW_BLOCK <2,7> ---->
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- END_BLOCK <2,7> ---->
#<---- GEN_LABEL ifElse_end_label_5: ---->
#<---- Cancel $a2 which index is 0 for #T18 ---->
ifElse_end_label_5:
#<---- GEN_LABEL ifElse_begin_label_6: ---->
ifElse_begin_label_6:
#<---- SET #T19@<1,14> := a@<1,14> != 0 ---->
#<---- Alloc $a2 which index is 0 for #T19 ---->
#<---- Alloc $a3 which index is 1 for a ---->
lw $a3, 4($sp)
sne $a2, $a3, 0
#<---- JUMP_IF #T19@<1,14> == 0 ifElse_end_label_6 ---->
#<---- Cancel $a3 which index is 1 for a ---->
sw $a3, 4($sp)
beq $a2, 0, ifElse_end_label_6
#<---- NEW_BLOCK <2,8> ---->
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- END_BLOCK <2,8> ---->
#<---- GEN_LABEL ifElse_end_label_6: ---->
#<---- Cancel $a2 which index is 0 for #T19 ---->
sw $a2, 116($sp)
ifElse_end_label_6:
#<---- var i@<1,14> = 2 ---->
#<---- Alloc $a2 which index is 0 for i ---->
addiu $a2, $zero, 2
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a2 which index is 0 for i ---->
sw $a2, 120($sp)
while_judge_label_0:
#<---- NEW_BLOCK <2,9> ---->
#<---- GEN_LABEL ifElse_begin_label_7: ---->
ifElse_begin_label_7:
#<---- SET #T20@<2,9> := i@<1,14> != 0 ---->
#<---- Alloc $a2 which index is 0 for #T20 ---->
#<---- Alloc $a3 which index is 1 for i ---->
lw $a3, 120($sp)
sne $a2, $a3, 0
#<---- JUMP_IF #T20@<2,9> == 0 ifElse_end_label_7 ---->
#<---- Cancel $a3 which index is 1 for i ---->
sw $a3, 120($sp)
beq $a2, 0, ifElse_end_label_7
#<---- NEW_BLOCK <3,0> ---->
#<---- i@<1,14> = i@<1,14> SUB 1 ---->
#<---- Alloc $a3 which index is 1 for i ---->
lw $a3, 120($sp)
addiu $a3, $a3, -1
#<---- JUMP while_judge_label_0 ---->
#<---- Cancel $a2 which index is 0 for #T20 ---->
#<---- Cancel $a3 which index is 1 for i ---->
sw $a3, 120($sp)
j while_judge_label_0
#<---- END_BLOCK <3,0> ---->
#<---- GEN_LABEL ifElse_end_label_7: ---->
ifElse_end_label_7:
#<---- JUMP while_end_label_0 ---->
j while_end_label_0
#<---- END_BLOCK <2,9> ---->
#<---- JUMP while_judge_label_0 ---->
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- PRE_CALL ifun1@0 ---->
#<---- FUNC_CALL ifun1@0 ---->
addiu $sp, $sp, -4
jal func_label_ifun1
addiu $sp, $sp, 4
#<---- ASSIGN #T24@<1,14> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T24 ---->
move $a2, $v0
#<---- PRE_CALL ifun2@1 ---->
#<---- PUSH_PARA 0 #function: ifun2@1 #arg: a ---->
li $v1, 0
sw $v1, -8($sp)
#<---- FUNC_CALL ifun2@1 ---->
#<---- Cancel $a2 which index is 0 for #T24 ---->
sw $a2, 132($sp)
addiu $sp, $sp, -12
jal func_label_ifun2
addiu $sp, $sp, 12
#<---- ASSIGN #T25@<1,14> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T25 ---->
move $a2, $v0
#<---- SAVE array1@<1,14>[1] = #T25@<1,14> ---->
addiu $v1, $sp, 16
sw $a2, 4($v1)
#<---- LOAD #T26@<1,14> = array1@<1,14>[1] ---->
#<---- Alloc $a3 which index is 1 for #T26 ---->
lw $a3, 20($sp)
#<---- print #T26@<1,14> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- PRE_CALL ifun3@2 ---->
#<---- PUSH_PARA 0 #function: ifun3@2 #arg: b ---->
li $v1, 0
sw $v1, -8($sp)
#<---- PUSH_PARA #T24@<1,14> #function: ifun3@2 #arg: a ---->
#<---- Alloc $t0 which index is 2 for #T24 ---->
lw $t0, 132($sp)
sw $t0, -12($sp)
#<---- FUNC_CALL ifun3@2 ---->
#<---- Cancel $a2 which index is 0 for #T25 ---->
#<---- Cancel $a3 which index is 1 for #T26 ---->
#<---- Cancel $t0 which index is 2 for #T24 ---->
sw $t0, 132($sp)
addiu $sp, $sp, -16
jal func_label_ifun3
addiu $sp, $sp, 16
#<---- ASSIGN #T27@<1,14> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T27 ---->
move $a2, $v0
#<---- SAVE arrays1@<1,14>[0] = #T27@<1,14> ---->
addiu $v1, $sp, 40
sw $a2, 0($v1)
#<---- LOAD #T28@<1,14> = arrays1@<1,14>[0] ---->
#<---- Alloc $a3 which index is 1 for #T28 ---->
lw $a3, 40($sp)
#<---- print #T28@<1,14> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- LOAD #T29@<1,14> = arrays1@<1,14>[3] ---->
#<---- Alloc $t0 which index is 2 for #T29 ---->
lw $t0, 52($sp)
#<---- a@<1,14> = #T24@<1,14> MUL #T29@<1,14> ---->
#<---- Alloc $t1 which index is 3 for #T24 ---->
lw $t1, 132($sp)
#<---- Alloc $t2 which index is 4 for a ---->
mult $t1, $t0
mflo $t2
#<---- LOAD #T31@<1,14> = arrays2@<1,14>[2] ---->
#<---- Alloc $t3 which index is 5 for #T31 ---->
lw $t3, 64($sp)
#<---- a@<1,14> = a@<1,14> DIV #T31@<1,14> ---->
div $t2, $t3
mflo $t2
#<---- LOAD #T33@<1,14> = arrays3@<1,14>[1] ---->
#<---- Alloc $t4 which index is 6 for #T33 ---->
lw $t4, 76($sp)
#<---- a@<1,14> = a@<1,14> MOD #T33@<1,14> ---->
div $t2, $t4
mfhi $t2
#<---- print a@<1,14> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- PRE_CALL ifun4@3 ---->
#<---- PUSH_PARA arrays3@<1,14>[0] #function: ifun4@3 #arg: a ---->
addiu $v1, $sp, 72
sw $v1, -8($sp)
#<---- FUNC_CALL ifun4@3 ---->
#<---- Cancel $a2 which index is 0 for #T27 ---->
sw $a2, 144($sp)
#<---- Cancel $a3 which index is 1 for #T28 ---->
sw $a3, 148($sp)
#<---- Cancel $t0 which index is 2 for #T29 ---->
sw $t0, 152($sp)
#<---- Cancel $t1 which index is 3 for #T24 ---->
sw $t1, 132($sp)
#<---- Cancel $t2 which index is 4 for a ---->
sw $t2, 4($sp)
#<---- Cancel $t3 which index is 5 for #T31 ---->
sw $t3, 160($sp)
#<---- Cancel $t4 which index is 6 for #T33 ---->
sw $t4, 168($sp)
addiu $sp, $sp, -12
jal func_label_ifun4
addiu $sp, $sp, 12
#<---- ASSIGN #T35@<1,14> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T35 ---->
move $a2, $v0
#<---- print #T35@<1,14> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- PRE_CALL ifun7@4 ---->
#<---- PUSH_PARA arrays2@<1,14> #function: ifun7@4 #arg: b ---->
addiu $v1, $sp, 56
sw $v1, -16($sp)
#<---- PUSH_PARA arrays1@<1,14> #function: ifun7@4 #arg: a ---->
addiu $v1, $sp, 40
sw $v1, -20($sp)
#<---- FUNC_CALL ifun7@4 ---->
#<---- Cancel $a2 which index is 0 for #T35 ---->
sw $a2, 176($sp)
addiu $sp, $sp, -24
jal func_label_ifun7
addiu $sp, $sp, 24
#<---- ASSIGN #T36@<1,14> = %RTX ---->
#<---- Alloc $a2 which index is 0 for #T36 ---->
move $a2, $v0
#<---- print #T36@<1,14> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- LOAD #T37@<1,14> = array1@<1,14>[0] ---->
#<---- Alloc $a3 which index is 1 for #T37 ---->
lw $a3, 16($sp)
#<---- #T38@<1,14> = #T36@<1,14> ADD #T37@<1,14> ---->
#<---- Alloc $t0 which index is 2 for #T38 ---->
addu $t0, $a2, $a3
#<---- LOAD #T39@<1,14> = array2@<1,14>[0] ---->
#<---- Alloc $t1 which index is 3 for #T39 ---->
lw $t1, 24($sp)
#<---- a@<1,14> = #T38@<1,14> SUB #T39@<1,14> ---->
#<---- Alloc $t2 which index is 4 for a ---->
subu $t2, $t0, $t1
#<---- print a@<1,14> ---->
move $a0, $t2
li $v0, 1
syscall
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK <1,14> ---->
