.data
str0: .asciiz "funcTest: move disk from "
str1: .asciiz " to "
str2: .asciiz "\n"
str3: .asciiz "blockTest: 7 == "
str4: .asciiz ", 8 == "
str5: .asciiz "\n"
str6: .asciiz "blockTest: 5 == "
str7: .asciiz ", 12 == "
str8: .asciiz "\n"
str9: .asciiz "Exptest: "
str10: .asciiz " "
str11: .asciiz " "
str12: .asciiz " "
str13: .asciiz " "
str14: .asciiz " "
str15: .asciiz " "
str16: .asciiz " "
str17: .asciiz "\n"
str18: .asciiz "20373569 the mafia~\n"
str19: .asciiz "Exptest: "
str20: .asciiz "\n"
.text
addi $gp, $gp, 20
#<------- var Mod@<0,0> = 389 ------->
li $t0, 389
sw $t0, -20($gp)
#<------- var N@<0,0> = 100005 ------->
li $t0, 100005
sw $t0, -16($gp)
#<------- var a_to_the_a@<0,0> ------->
#<------- var cnt@<0,0> = 0 ------->
#<------- var n@<0,0> ------->
addi $sp, $sp, -104
j func_label_main
#<--------------- FUNC move--------------->
func_label_move:
#<------- FORM_VAR_DEF a@<1,0> move ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF b@<1,0> move ------->
lw $a2, 8($sp)
#<---- #T0 = cnt@<0,0> ADD 1 ---->
lw $a3, -8($gp)
addi $t0, $a3, 1
#<---- ASSIGN cnt@<0,0> = #T0 ---->
addi $a3, $t0, 0
#<---- Cancel $a3 for cnt ---->
sw $a3, -8($gp)
#<---- #T1 = cnt@<0,0> MOD 389 ---->
lw $a3, -8($gp)
addi $v1, $zero, 389
div $a3, $v1
mfhi $t1
#<---- SET #T2 := #T1 == 0 ---->
seq $t2, $t1, 0
#<---- JUMP_IF #T2 == 1 or_label_0 ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for cnt ---->
sw $a3, -8($gp)
#<---- Cancel $t0 for #T0 ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T1 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T2 ---->
sw $t2, 20($sp)
lw $a1, 20($sp)
beq $a1, 1, or_label_0
#<---- JUMP_IF #T2 == 0 ifElse_end_label_0 ---->
#<---- Cancel $a1 for #T2 ---->
sw $a1, 20($sp)
lw $a1, 20($sp)
beq $a1, 0, ifElse_end_label_0
#<---- GEN_LABEL or_label_0: ---->
#<---- Cancel $a1 for #T2 ---->
sw $a1, 20($sp)
or_label_0:
#<---- NEW_BLOCK [2, 0] ---->
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- print a@<1,0> ---->
lw $a1, 4($sp)
move $a0, $a1
li $v0, 1
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print b@<1,0> ---->
lw $a2, 8($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- END_BLOCK [2, 0] ---->
#<---- GEN_LABEL ifElse_end_label_0: ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
ifElse_end_label_0:
#<---- END_BLOCK [1, 0] ---->
jr $ra
#<--------------- FUNC hanoi--------------->
func_label_hanoi:
#<------- FORM_VAR_DEF n@<1,1> hanoi ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF a@<1,1> hanoi ------->
lw $a2, 8($sp)
#<------- FORM_VAR_DEF b@<1,1> hanoi ------->
lw $a3, 12($sp)
#<------- FORM_VAR_DEF c@<1,1> hanoi ------->
lw $t0, 16($sp)
#<---- SET #T3 := n@<1,1> == 1 ---->
seq $t1, $a1, 1
#<---- JUMP_IF #T3 == 1 or_label_1 ---->
#<---- Cancel $a1 for n ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for a ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for c ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for #T3 ---->
sw $t1, 20($sp)
lw $a1, 20($sp)
beq $a1, 1, or_label_1
#<---- JUMP_IF #T3 == 0 ifElse_end_label_1 ---->
#<---- Cancel $a1 for #T3 ---->
sw $a1, 20($sp)
lw $a1, 20($sp)
beq $a1, 0, ifElse_end_label_1
#<---- GEN_LABEL or_label_1: ---->
#<---- Cancel $a1 for #T3 ---->
sw $a1, 20($sp)
or_label_1:
#<---- NEW_BLOCK [2, 1] ---->
#<---- PRE_CALL move ---->
#<---- PUSH_PARA a@<1,1> #function: move #arg: a ---->
lw $a1, 8($sp)
sw $a1, -112($sp)
#<---- PUSH_PARA c@<1,1> #function: move #arg: b ---->
lw $a2, 16($sp)
sw $a2, -108($sp)
#<---- FUNC_CALL move ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for a ---->
sw $a1, 8($sp)
#<---- Cancel $a2 for c ---->
sw $a2, 16($sp)
addi $sp, $sp, -116
jal func_label_move
addi $sp, $sp, 116
lw $ra, 0($sp)
#<---- ASSIGN #T4 = %RTX ---->
move $a1, $v0
#<---- return  ---->
jr $ra
#<---- END_BLOCK [2, 1] ---->
#<---- GEN_LABEL ifElse_end_label_1: ---->
#<---- Cancel $a1 for #T4 ---->
sw $a1, 44($sp)
ifElse_end_label_1:
#<---- PRE_CALL hanoi ---->
#<---- #T5 = n@<1,1> SUB 1 ---->
lw $a1, 4($sp)
addi $a2, $a1, -1
#<---- PUSH_PARA #T5 #function: hanoi #arg: n ---->
sw $a2, -136($sp)
#<---- PUSH_PARA a@<1,1> #function: hanoi #arg: a ---->
lw $a3, 8($sp)
sw $a3, -132($sp)
#<---- PUSH_PARA c@<1,1> #function: hanoi #arg: b ---->
lw $t0, 16($sp)
sw $t0, -128($sp)
#<---- PUSH_PARA b@<1,1> #function: hanoi #arg: c ---->
lw $t1, 12($sp)
sw $t1, -124($sp)
#<---- FUNC_CALL hanoi ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for n ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for #T5 ---->
sw $a2, 24($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for c ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for b ---->
sw $t1, 12($sp)
addi $sp, $sp, -140
jal func_label_hanoi
addi $sp, $sp, 140
lw $ra, 0($sp)
#<---- ASSIGN #T6 = %RTX ---->
move $a1, $v0
#<---- PRE_CALL move ---->
#<---- PUSH_PARA a@<1,1> #function: move #arg: a ---->
lw $a2, 8($sp)
sw $a2, -112($sp)
#<---- PUSH_PARA c@<1,1> #function: move #arg: b ---->
lw $a3, 16($sp)
sw $a3, -108($sp)
#<---- FUNC_CALL move ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for #T6 ---->
sw $a1, 28($sp)
#<---- Cancel $a2 for a ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for c ---->
sw $a3, 16($sp)
addi $sp, $sp, -116
jal func_label_move
addi $sp, $sp, 116
lw $ra, 0($sp)
#<---- ASSIGN #T7 = %RTX ---->
move $a1, $v0
#<---- PRE_CALL hanoi ---->
#<---- #T8 = n@<1,1> SUB 1 ---->
lw $a2, 4($sp)
addi $a3, $a2, -1
#<---- PUSH_PARA #T8 #function: hanoi #arg: n ---->
sw $a3, -136($sp)
#<---- PUSH_PARA b@<1,1> #function: hanoi #arg: a ---->
lw $t0, 12($sp)
sw $t0, -132($sp)
#<---- PUSH_PARA a@<1,1> #function: hanoi #arg: b ---->
lw $t1, 8($sp)
sw $t1, -128($sp)
#<---- PUSH_PARA c@<1,1> #function: hanoi #arg: c ---->
lw $t2, 16($sp)
sw $t2, -124($sp)
#<---- FUNC_CALL hanoi ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for #T7 ---->
sw $a1, 32($sp)
#<---- Cancel $a2 for n ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T8 ---->
sw $a3, 36($sp)
#<---- Cancel $t0 for b ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for a ---->
sw $t1, 8($sp)
#<---- Cancel $t2 for c ---->
sw $t2, 16($sp)
addi $sp, $sp, -140
jal func_label_hanoi
addi $sp, $sp, 140
lw $ra, 0($sp)
#<---- ASSIGN #T9 = %RTX ---->
move $a1, $v0
#<---- END_BLOCK [1, 1] ---->
jr $ra
#<--------------- FUNC qpow--------------->
func_label_qpow:
#<------- FORM_VAR_DEF a@<1,2> qpow ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF b@<1,2> qpow ------->
lw $a2, 8($sp)
#<---- var ans@<1,2> = 1 ---->
addi $a3, $zero, 1
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for ans ---->
sw $a3, 12($sp)
while_judge_label_0:
#<---- JUMP_IF b@<1,2> == 1 or_label_2 ---->
lw $a1, 8($sp)
beq $a1, 1, or_label_2
#<---- JUMP_IF b@<1,2> == 0 while_end_label_0 ---->
#<---- Cancel $a1 for b ---->
sw $a1, 8($sp)
lw $a1, 8($sp)
beq $a1, 0, while_end_label_0
#<---- GEN_LABEL or_label_2: ---->
#<---- Cancel $a1 for b ---->
sw $a1, 8($sp)
or_label_2:
#<---- NEW_BLOCK [2, 2] ---->
#<---- #T10 = b@<1,2> DIV 2 ---->
lw $a1, 8($sp)
addi $v1, $zero, 2
div $a1, $v1
mflo $a2
#<---- ASSIGN b@<1,2> = #T10 ---->
addi $a1, $a2, 0
#<---- #T11 = a@<1,2> MUL a@<1,2> ---->
lw $a3, 4($sp)
mult $a3, $a3
mflo $t0
#<---- #T12 = #T11 MOD 389 ---->
addi $v1, $zero, 389
div $t0, $v1
mfhi $t1
#<---- ASSIGN a@<1,2> = #T12 ---->
addi $a3, $t1, 0
#<---- #T13 = b@<1,2> MOD 2 ---->
addi $v1, $zero, 2
div $a1, $v1
mfhi $t2
#<---- JUMP_IF #T13 == 1 or_label_3 ---->
#<---- Cancel $a1 for b ---->
sw $a1, 8($sp)
#<---- Cancel $a2 for #T10 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for a ---->
sw $a3, 4($sp)
#<---- Cancel $t0 for #T11 ---->
sw $t0, 20($sp)
#<---- Cancel $t1 for #T12 ---->
sw $t1, 24($sp)
#<---- Cancel $t2 for #T13 ---->
sw $t2, 28($sp)
lw $a1, 28($sp)
beq $a1, 1, or_label_3
#<---- JUMP_IF #T13 == 0 ifElse_end_label_2 ---->
#<---- Cancel $a1 for #T13 ---->
sw $a1, 28($sp)
lw $a1, 28($sp)
beq $a1, 0, ifElse_end_label_2
#<---- GEN_LABEL or_label_3: ---->
#<---- Cancel $a1 for #T13 ---->
sw $a1, 28($sp)
or_label_3:
#<---- NEW_BLOCK [3, 0] ---->
#<---- #T14 = ans@<1,2> MUL a@<1,2> ---->
lw $a1, 4($sp)
lw $a2, 12($sp)
mult $a2, $a1
mflo $a3
#<---- #T15 = #T14 MOD 389 ---->
addi $v1, $zero, 389
div $a3, $v1
mfhi $t0
#<---- ASSIGN ans@<1,2> = #T15 ---->
addi $a2, $t0, 0
#<---- END_BLOCK [3, 0] ---->
#<---- GEN_LABEL ifElse_end_label_2: ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for ans ---->
sw $a2, 12($sp)
#<---- Cancel $a3 for #T14 ---->
sw $a3, 32($sp)
#<---- Cancel $t0 for #T15 ---->
sw $t0, 36($sp)
ifElse_end_label_2:
#<---- END_BLOCK [2, 2] ---->
#<---- JUMP while_judge_label_0 ---->
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- return ans@<1,2> ---->
lw $a1, 12($sp)
move $v0, $a1
jr $ra
#<---- END_BLOCK [1, 2] ---->
jr $ra
#<--------------- FUNC gcd--------------->
func_label_gcd:
#<------- FORM_VAR_DEF a@<1,3> gcd ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF b@<1,3> gcd ------->
lw $a2, 8($sp)
#<---- SET #T16 := b@<1,3> == 0 ---->
seq $a3, $a2, 0
#<---- JUMP_IF #T16 == 1 or_label_4 ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T16 ---->
sw $a3, 12($sp)
lw $a1, 12($sp)
beq $a1, 1, or_label_4
#<---- JUMP_IF #T16 == 0 ifElse_end_label_3 ---->
#<---- Cancel $a1 for #T16 ---->
sw $a1, 12($sp)
lw $a1, 12($sp)
beq $a1, 0, ifElse_end_label_3
#<---- GEN_LABEL or_label_4: ---->
#<---- Cancel $a1 for #T16 ---->
sw $a1, 12($sp)
or_label_4:
#<---- NEW_BLOCK [2, 3] ---->
#<---- return a@<1,3> ---->
lw $a1, 4($sp)
move $v0, $a1
jr $ra
#<---- END_BLOCK [2, 3] ---->
#<---- GEN_LABEL ifElse_end_label_3: ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
ifElse_end_label_3:
#<---- PRE_CALL gcd ---->
#<---- PUSH_PARA b@<1,3> #function: gcd #arg: a ---->
lw $a1, 8($sp)
sw $a1, -112($sp)
#<---- #T17 = a@<1,3> MOD b@<1,3> ---->
lw $a2, 4($sp)
div $a2, $a1
mfhi $a3
#<---- PUSH_PARA #T17 #function: gcd #arg: b ---->
sw $a3, -108($sp)
#<---- FUNC_CALL gcd ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for b ---->
sw $a1, 8($sp)
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T17 ---->
sw $a3, 16($sp)
addi $sp, $sp, -116
jal func_label_gcd
addi $sp, $sp, 116
lw $ra, 0($sp)
#<---- ASSIGN #T18 = %RTX ---->
move $a1, $v0
#<---- return #T18 ---->
move $v0, $a1
jr $ra
#<---- END_BLOCK [1, 3] ---->
jr $ra
#<--------------- FUNC testExp--------------->
func_label_testExp:
#<---- #T19 = n@<0,0> MUL n@<0,0> ---->
lw $a1, -4($gp)
mult $a1, $a1
mflo $a2
#<---- ASSIGN a_to_the_a@<0,0> = #T19 ---->
addi $a3, $a2, 0
#<---- Cancel $a3 for a_to_the_a ---->
sw $a3, -12($gp)
#<---- #T20 = 100005 DIV n@<0,0> ---->
addi $v1, $zero, 100005
div $v1, $a1
mflo $a3
#<---- var k@<1,4> = #T20 ---->
addi $t0, $a3, 0
#<---- #T21 = n@<0,0> MUL n@<0,0> ---->
mult $a1, $a1
mflo $t1
#<---- #T22 = #T21 DIV n@<0,0> ---->
div $t1, $a1
mflo $t2
#<---- #T23 = #T22 ADD n@<0,0> ---->
addu $t3, $t2, $a1
#<---- #T24 = #T23 SUB n@<0,0> ---->
subu $t4, $t3, $a1
#<---- #T25 = a_to_the_a@<0,0> ADD 1 ---->
lw $t5, -12($gp)
addi $t6, $t5, 1
#<---- var b@<1,4> = #T25 ---->
addi $t7, $t6, 0
#<---- var c@<1,4> = 2147483647 ---->
addi $t8, $zero, 2147483647
#<---- #T26 = -1 SUB c@<1,4> ---->
li $v1, -1
sub $t9, $v1, $t8
#<---- var d@<1,4> = #T26 ---->
addi $s0, $t9, 0
#<---- #T27 = 0 SUB a_to_the_a@<0,0> ---->
li $v1, 0
sub $s1, $v1, $t5
#<---- #T28 = 1 SUB #T27 ---->
li $v1, 1
sub $s2, $v1, $s1
#<---- #T29 = #T28 MUL b@<1,4> ---->
mult $s2, $t7
mflo $s3
#<---- #T30 = #T29 DIV 3 ---->
addi $v1, $zero, 3
div $s3, $v1
mflo $s4
#<---- #T31 = #T30 SUB 2 ---->
addi $s5, $s4, -2
#<---- #T32 = #T31 ADD 100005 ---->
addi $s6, $s5, 100005
#<---- #T33 = #T32 MOD 389 ---->
addi $v1, $zero, 389
div $s6, $v1
mfhi $s7
#<---- var t@<1,4> = #T33 ---->
addi $fp, $s7, 0
#<---- PRE_CALL qpow ---->
#<---- PUSH_PARA a_to_the_a@<0,0> #function: qpow #arg: a ---->
sw $t5, -128($sp)
#<---- PUSH_PARA b@<1,4> #function: qpow #arg: b ---->
sw $t7, -124($sp)
#<---- FUNC_CALL qpow ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for n ---->
sw $a1, -4($gp)
#<---- Cancel $a2 for #T19 ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T20 ---->
sw $a3, 8($sp)
#<---- Cancel $t0 for k ---->
sw $t0, 12($sp)
#<---- Cancel $t1 for #T21 ---->
sw $t1, 16($sp)
#<---- Cancel $t2 for #T22 ---->
sw $t2, 20($sp)
#<---- Cancel $t3 for #T23 ---->
sw $t3, 24($sp)
#<---- Cancel $t4 for #T24 ---->
sw $t4, 28($sp)
#<---- Cancel $t5 for a_to_the_a ---->
sw $t5, -12($gp)
#<---- Cancel $t6 for #T25 ---->
sw $t6, 32($sp)
#<---- Cancel $t7 for b ---->
sw $t7, 36($sp)
#<---- Cancel $t8 for c ---->
sw $t8, 40($sp)
#<---- Cancel $t9 for #T26 ---->
sw $t9, 44($sp)
#<---- Cancel $s0 for d ---->
sw $s0, 48($sp)
#<---- Cancel $s1 for #T27 ---->
sw $s1, 52($sp)
#<---- Cancel $s2 for #T28 ---->
sw $s2, 56($sp)
#<---- Cancel $s3 for #T29 ---->
sw $s3, 60($sp)
#<---- Cancel $s4 for #T30 ---->
sw $s4, 64($sp)
#<---- Cancel $s5 for #T31 ---->
sw $s5, 68($sp)
#<---- Cancel $s6 for #T32 ---->
sw $s6, 72($sp)
#<---- Cancel $s7 for #T33 ---->
sw $s7, 76($sp)
#<---- Cancel $fp for t ---->
sw $fp, 80($sp)
addi $sp, $sp, -132
jal func_label_qpow
addi $sp, $sp, 132
lw $ra, 0($sp)
#<---- ASSIGN #T34 = %RTX ---->
move $a1, $v0
#<---- var e@<1,4> = #T34 ---->
addi $a2, $a1, 0
#<---- NEW_BLOCK [2, 4] ---->
#<---- ASSIGN b@<1,4> = 10 ---->
addi $a3, $zero, 10
#<---- ASSIGN c@<1,4> = 0 ---->
move $t0, $zero
#<---- NEW_BLOCK [3, 1] ---->
#<---- ASSIGN b@<1,4> = 7 ---->
addi $a3, $zero, 7
#<---- ASSIGN c@<1,4> = 8 ---->
addi $t0, $zero, 8
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- print b@<1,4> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- print c@<1,4> ---->
move $a0, $t0
li $v0, 1
syscall
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- END_BLOCK [3, 1] ---->
#<---- var i@<2,4> = 0 ---->
move $t1, $zero
#<---- GEN_LABEL while_judge_label_1: ---->
#<---- Cancel $a1 for #T34 ---->
sw $a1, 84($sp)
#<---- Cancel $a2 for e ---->
sw $a2, 88($sp)
#<---- Cancel $a3 for b ---->
sw $a3, 36($sp)
#<---- Cancel $t0 for c ---->
sw $t0, 40($sp)
#<---- Cancel $t1 for i ---->
sw $t1, 112($sp)
while_judge_label_1:
#<---- NEW_BLOCK [3, 2] ---->
#<---- #T35 = i@<2,4> ADD 1 ---->
lw $a1, 112($sp)
addi $a2, $a1, 1
#<---- ASSIGN i@<2,4> = #T35 ---->
addi $a1, $a2, 0
#<---- #T36 = i@<2,4> MOD 2 ---->
addi $v1, $zero, 2
div $a1, $v1
mfhi $a3
#<---- SET #T37 := #T36 != 0 ---->
sne $t0, $a3, 0
#<---- JUMP_IF #T37 == 1 or_label_5 ---->
#<---- Cancel $a1 for i ---->
sw $a1, 112($sp)
#<---- Cancel $a2 for #T35 ---->
sw $a2, 116($sp)
#<---- Cancel $a3 for #T36 ---->
sw $a3, 120($sp)
#<---- Cancel $t0 for #T37 ---->
sw $t0, 124($sp)
lw $a1, 124($sp)
beq $a1, 1, or_label_5
#<---- JUMP_IF #T37 == 0 ifElse_end_label_4 ---->
#<---- Cancel $a1 for #T37 ---->
sw $a1, 124($sp)
lw $a1, 124($sp)
beq $a1, 0, ifElse_end_label_4
#<---- GEN_LABEL or_label_5: ---->
#<---- Cancel $a1 for #T37 ---->
sw $a1, 124($sp)
or_label_5:
#<---- NEW_BLOCK [4, 0] ---->
#<---- JUMP while_judge_label_1 ---->
j while_judge_label_1
#<---- END_BLOCK [4, 0] ---->
#<---- GEN_LABEL ifElse_end_label_4: ---->
ifElse_end_label_4:
#<---- SET #T38 := b@<1,4> <= i@<2,4> ---->
lw $a2, 36($sp)
lw $a3, 112($sp)
sle $a1, $a2, $a3
#<---- JUMP_IF #T38 == 1 or_label_6 ---->
#<---- Cancel $a1 for #T38 ---->
sw $a1, 128($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for i ---->
sw $a3, 112($sp)
lw $a1, 128($sp)
beq $a1, 1, or_label_6
#<---- JUMP_IF #T38 == 0 Else_start_label_0 ---->
#<---- Cancel $a1 for #T38 ---->
sw $a1, 128($sp)
lw $a1, 128($sp)
beq $a1, 0, Else_start_label_0
#<---- GEN_LABEL or_label_6: ---->
#<---- Cancel $a1 for #T38 ---->
sw $a1, 128($sp)
or_label_6:
#<---- NEW_BLOCK [4, 1] ---->
#<---- JUMP while_end_label_1 ---->
j while_end_label_1
#<---- END_BLOCK [4, 1] ---->
#<---- JUMP ifElse_end_label_5 ---->
j ifElse_end_label_5
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- NEW_BLOCK [4, 2] ---->
#<---- SET #T39 := c@<1,4> < 10 ---->
lw $a2, 40($sp)
slti $a1, $a2, 10
#<---- JUMP_IF #T39 == 1 or_label_7 ---->
#<---- Cancel $a1 for #T39 ---->
sw $a1, 132($sp)
#<---- Cancel $a2 for c ---->
sw $a2, 40($sp)
lw $a1, 132($sp)
beq $a1, 1, or_label_7
#<---- JUMP_IF #T39 == 0 Else_start_label_1 ---->
#<---- Cancel $a1 for #T39 ---->
sw $a1, 132($sp)
lw $a1, 132($sp)
beq $a1, 0, Else_start_label_1
#<---- GEN_LABEL or_label_7: ---->
#<---- Cancel $a1 for #T39 ---->
sw $a1, 132($sp)
or_label_7:
#<---- NEW_BLOCK [5, 0] ---->
#<---- #T40 = c@<1,4> ADD i@<2,4> ---->
lw $a1, 112($sp)
lw $a2, 40($sp)
addu $a3, $a2, $a1
#<---- ASSIGN c@<1,4> = #T40 ---->
addi $a2, $a3, 0
#<---- END_BLOCK [5, 0] ---->
#<---- JUMP ifElse_end_label_6 ---->
#<---- Cancel $a1 for i ---->
sw $a1, 112($sp)
#<---- Cancel $a2 for c ---->
sw $a2, 40($sp)
#<---- Cancel $a3 for #T40 ---->
sw $a3, 136($sp)
j ifElse_end_label_6
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- NEW_BLOCK [5, 1] ---->
#<---- #T41 = c@<1,4> SUB i@<2,4> ---->
lw $a1, 112($sp)
lw $a2, 40($sp)
subu $a3, $a2, $a1
#<---- ASSIGN c@<1,4> = #T41 ---->
addi $a2, $a3, 0
#<---- END_BLOCK [5, 1] ---->
#<---- GEN_LABEL ifElse_end_label_6: ---->
#<---- Cancel $a1 for i ---->
sw $a1, 112($sp)
#<---- Cancel $a2 for c ---->
sw $a2, 40($sp)
#<---- Cancel $a3 for #T41 ---->
sw $a3, 140($sp)
ifElse_end_label_6:
#<---- END_BLOCK [4, 2] ---->
#<---- GEN_LABEL ifElse_end_label_5: ---->
ifElse_end_label_5:
#<---- END_BLOCK [3, 2] ---->
#<---- JUMP while_judge_label_1 ---->
j while_judge_label_1
#<---- GEN_LABEL while_end_label_1: ---->
while_end_label_1:
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- print b@<1,4> ---->
lw $a1, 36($sp)
move $a0, $a1
li $v0, 1
syscall
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- print c@<1,4> ---->
lw $a2, 40($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- END_BLOCK [2, 4] ---->
#<---- var f@<1,4> = n@<0,0> ---->
lw $t0, -4($gp)
addi $a3, $t0, 0
#<---- var g@<1,4> = 0 ---->
move $t1, $zero
#<---- SET #T42 := f@<1,4> < 0 ---->
slti $t2, $a3, 0
#<---- JUMP_IF #T42 == 1 or_label_8 ---->
#<---- Cancel $a1 for b ---->
sw $a1, 36($sp)
#<---- Cancel $a2 for c ---->
sw $a2, 40($sp)
#<---- Cancel $a3 for f ---->
sw $a3, 92($sp)
#<---- Cancel $t0 for n ---->
sw $t0, -4($gp)
#<---- Cancel $t1 for g ---->
sw $t1, 96($sp)
#<---- Cancel $t2 for #T42 ---->
sw $t2, 100($sp)
lw $a1, 100($sp)
beq $a1, 1, or_label_8
#<---- JUMP_IF #T42 == 0 Else_start_label_2 ---->
#<---- Cancel $a1 for #T42 ---->
sw $a1, 100($sp)
lw $a1, 100($sp)
beq $a1, 0, Else_start_label_2
#<---- GEN_LABEL or_label_8: ---->
#<---- Cancel $a1 for #T42 ---->
sw $a1, 100($sp)
or_label_8:
#<---- NEW_BLOCK [2, 5] ---->
#<---- ASSIGN g@<1,4> = 10 ---->
addi $a1, $zero, 10
#<---- END_BLOCK [2, 5] ---->
#<---- JUMP ifElse_end_label_7 ---->
#<---- Cancel $a1 for g ---->
sw $a1, 96($sp)
j ifElse_end_label_7
#<---- GEN_LABEL Else_start_label_2: ---->
Else_start_label_2:
#<---- NEW_BLOCK [2, 6] ---->
#<---- SET #T43 := 10 < f@<1,4> ---->
lw $a2, 92($sp)
sgt $a1, $a2, 10
#<---- JUMP_IF #T43 == 1 or_label_9 ---->
#<---- Cancel $a1 for #T43 ---->
sw $a1, 144($sp)
#<---- Cancel $a2 for f ---->
sw $a2, 92($sp)
lw $a1, 144($sp)
beq $a1, 1, or_label_9
#<---- JUMP_IF #T43 == 0 Else_start_label_3 ---->
#<---- Cancel $a1 for #T43 ---->
sw $a1, 144($sp)
lw $a1, 144($sp)
beq $a1, 0, Else_start_label_3
#<---- GEN_LABEL or_label_9: ---->
#<---- Cancel $a1 for #T43 ---->
sw $a1, 144($sp)
or_label_9:
#<---- NEW_BLOCK [3, 3] ---->
#<---- ASSIGN g@<1,4> = 20 ---->
addi $a1, $zero, 20
#<---- END_BLOCK [3, 3] ---->
#<---- JUMP ifElse_end_label_8 ---->
#<---- Cancel $a1 for g ---->
sw $a1, 96($sp)
j ifElse_end_label_8
#<---- GEN_LABEL Else_start_label_3: ---->
Else_start_label_3:
#<---- NEW_BLOCK [3, 4] ---->
#<---- SET #T44 := f@<1,4> == n@<0,0> ---->
lw $a2, 92($sp)
lw $a3, -4($gp)
seq $a1, $a2, $a3
#<---- JUMP_IF #T44 == 1 or_label_10 ---->
#<---- Cancel $a1 for #T44 ---->
sw $a1, 148($sp)
#<---- Cancel $a2 for f ---->
sw $a2, 92($sp)
#<---- Cancel $a3 for n ---->
sw $a3, -4($gp)
lw $a1, 148($sp)
beq $a1, 1, or_label_10
#<---- JUMP_IF #T44 == 0 ifElse_end_label_9 ---->
#<---- Cancel $a1 for #T44 ---->
sw $a1, 148($sp)
lw $a1, 148($sp)
beq $a1, 0, ifElse_end_label_9
#<---- GEN_LABEL or_label_10: ---->
#<---- Cancel $a1 for #T44 ---->
sw $a1, 148($sp)
or_label_10:
#<---- NEW_BLOCK [4, 3] ---->
#<---- ASSIGN g@<1,4> = 30 ---->
addi $a1, $zero, 30
#<---- END_BLOCK [4, 3] ---->
#<---- GEN_LABEL ifElse_end_label_9: ---->
#<---- Cancel $a1 for g ---->
sw $a1, 96($sp)
ifElse_end_label_9:
#<---- END_BLOCK [3, 4] ---->
#<---- GEN_LABEL ifElse_end_label_8: ---->
ifElse_end_label_8:
#<---- END_BLOCK [2, 6] ---->
#<---- GEN_LABEL ifElse_end_label_7: ---->
ifElse_end_label_7:
#<---- SET #T45 := f@<1,4> <= 10 ---->
lw $a2, 92($sp)
sle $a1, $a2, 10
#<---- JUMP_IF #T45 == 1 or_label_11 ---->
#<---- Cancel $a1 for #T45 ---->
sw $a1, 104($sp)
#<---- Cancel $a2 for f ---->
sw $a2, 92($sp)
lw $a1, 104($sp)
beq $a1, 1, or_label_11
#<---- JUMP_IF #T45 == 0 ifElse_end_label_10 ---->
#<---- Cancel $a1 for #T45 ---->
sw $a1, 104($sp)
lw $a1, 104($sp)
beq $a1, 0, ifElse_end_label_10
#<---- GEN_LABEL or_label_11: ---->
#<---- Cancel $a1 for #T45 ---->
sw $a1, 104($sp)
or_label_11:
#<---- NEW_BLOCK [2, 7] ---->
#<---- #T46 = g@<1,4> ADD f@<1,4> ---->
lw $a1, 92($sp)
lw $a2, 96($sp)
addu $a3, $a2, $a1
#<---- ASSIGN g@<1,4> = #T46 ---->
addi $a2, $a3, 0
#<---- END_BLOCK [2, 7] ---->
#<---- GEN_LABEL ifElse_end_label_10: ---->
#<---- Cancel $a1 for f ---->
sw $a1, 92($sp)
#<---- Cancel $a2 for g ---->
sw $a2, 96($sp)
#<---- Cancel $a3 for #T46 ---->
sw $a3, 152($sp)
ifElse_end_label_10:
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- print a_to_the_a@<0,0> ---->
lw $a1, -12($gp)
move $a0, $a1
li $v0, 1
syscall
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- print b@<1,4> ---->
lw $a2, 36($sp)
move $a0, $a2
li $v0, 1
syscall
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- print c@<1,4> ---->
lw $a3, 40($sp)
move $a0, $a3
li $v0, 1
syscall
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- print d@<1,4> ---->
lw $t0, 48($sp)
move $a0, $t0
li $v0, 1
syscall
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- print e@<1,4> ---->
lw $t1, 88($sp)
move $a0, $t1
li $v0, 1
syscall
#<---- print #str14 ---->
la $a0, str14
li $v0, 4
syscall
#<---- print f@<1,4> ---->
lw $t2, 92($sp)
move $a0, $t2
li $v0, 1
syscall
#<---- print #str15 ---->
la $a0, str15
li $v0, 4
syscall
#<---- print g@<1,4> ---->
lw $t3, 96($sp)
move $a0, $t3
li $v0, 1
syscall
#<---- print #str16 ---->
la $a0, str16
li $v0, 4
syscall
#<---- print t@<1,4> ---->
lw $t4, 80($sp)
move $a0, $t4
li $v0, 1
syscall
#<---- print #str17 ---->
la $a0, str17
li $v0, 4
syscall
#<---- PRE_CALL gcd ---->
#<---- PUSH_PARA f@<1,4> #function: gcd #arg: a ---->
sw $t2, -112($sp)
#<---- PUSH_PARA g@<1,4> #function: gcd #arg: b ---->
sw $t3, -108($sp)
#<---- FUNC_CALL gcd ---->
sw $ra, 0($sp)
#<---- Cancel $a1 for a_to_the_a ---->
sw $a1, -12($gp)
#<---- Cancel $a2 for b ---->
sw $a2, 36($sp)
#<---- Cancel $a3 for c ---->
sw $a3, 40($sp)
#<---- Cancel $t0 for d ---->
sw $t0, 48($sp)
#<---- Cancel $t1 for e ---->
sw $t1, 88($sp)
#<---- Cancel $t2 for f ---->
sw $t2, 92($sp)
#<---- Cancel $t3 for g ---->
sw $t3, 96($sp)
#<---- Cancel $t4 for t ---->
sw $t4, 80($sp)
addi $sp, $sp, -116
jal func_label_gcd
addi $sp, $sp, 116
lw $ra, 0($sp)
#<---- ASSIGN #T47 = %RTX ---->
move $a1, $v0
#<---- return #T47 ---->
move $v0, $a1
jr $ra
#<---- END_BLOCK [1, 4] ---->
jr $ra
#<--------------- FUNC main--------------->
func_label_main:
#<---- print #str18 ---->
la $a0, str18
li $v0, 4
syscall
#<---- n@<0,0> = input() ---->
lw $a1, -4($gp)
li $v0, 5
syscall
move $a1, $v0
sw $v0, -4($gp)
#<---- PRE_CALL hanoi ---->
#<---- PUSH_PARA n@<0,0> #function: hanoi #arg: n ---->
sw $a1, -136($sp)
#<---- PUSH_PARA 1 #function: hanoi #arg: a ---->
li $v1, 1
sw $v1, -132($sp)
#<---- PUSH_PARA 2 #function: hanoi #arg: b ---->
li $v1, 2
sw $v1, -128($sp)
#<---- PUSH_PARA 3 #function: hanoi #arg: c ---->
li $v1, 3
sw $v1, -124($sp)
#<---- FUNC_CALL hanoi ---->
#<---- Cancel $a1 for n ---->
sw $a1, -4($gp)
addi $sp, $sp, -140
jal func_label_hanoi
addi $sp, $sp, 140
#<---- ASSIGN #T48 = %RTX ---->
move $a1, $v0
#<---- PRE_CALL testExp ---->
#<---- FUNC_CALL testExp ---->
#<---- Cancel $a1 for #T48 ---->
sw $a1, 4($sp)
addi $sp, $sp, -248
jal func_label_testExp
addi $sp, $sp, 248
#<---- ASSIGN #T49 = %RTX ---->
move $a1, $v0
#<---- print #str19 ---->
la $a0, str19
li $v0, 4
syscall
#<---- print #T49 ---->
move $a0, $a1
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
#<---- END_BLOCK [1, 5] ---->
