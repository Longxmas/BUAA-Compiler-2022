.data
str0: .asciiz "a="
str1: .asciiz ", b="
str2: .asciiz "\n"
str3: .asciiz "a>b\n"
str4: .asciiz "a<=b\n"
str5: .asciiz "x="
str6: .asciiz "\n"
str7: .asciiz "input = "
str8: .asciiz "\n"
str9: .asciiz "Illegal input\n"
str10: .asciiz "cur i="
str11: .asciiz "\n"
str12: .asciiz "20373472\n"
str13: .asciiz "\n"
.text
addi $sp, $sp, -40
j func_label_main
#<--------------- FUNC compare--------------->
func_label_compare:
#<------- FORM_VAR_DEF x@<1,0> compare ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF y@<1,0> compare ------->
lw $a2, 8($sp)
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- print x@<1,0> ---->
move $a0, $a1
li $v0, 1
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print y@<1,0> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- SET #T0 := y@<1,0> < x@<1,0> ---->
slt $a3, $a2, $a1
#<---- JUMP_IF #T0 == 1 or_label_0 ---->
#<---- Cancel $a1 for x ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for y ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T0 ---->
sw $a3, 12($sp)
lw $a1, 12($sp)
beq $a1, 1, or_label_0
#<---- JUMP_IF #T0 == 0 Else_start_label_0 ---->
#<---- Cancel $a1 for #T0 ---->
sw $a1, 12($sp)
lw $a1, 12($sp)
beq $a1, 0, Else_start_label_0
#<---- GEN_LABEL or_label_0: ---->
#<---- Cancel $a1 for #T0 ---->
sw $a1, 12($sp)
or_label_0:
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_0 ---->
j ifElse_end_label_0
#<---- GEN_LABEL Else_start_label_0: ---->
Else_start_label_0:
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_end_label_0: ---->
ifElse_end_label_0:
#<---- END_BLOCK [1, 0] ---->
jr $ra
#<--------------- FUNC test--------------->
func_label_test:
#<------- FORM_VAR_DEF x@<1,1> test ------->
lw $a1, 4($sp)
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- print x@<1,1> ---->
move $a0, $a1
li $v0, 1
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- SET #T1 := x@<1,1> < 0 ---->
slti $a2, $a1, 0
#<---- JUMP_IF #T1 == 1 or_label_1 ---->
#<---- Cancel $a1 for x ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for #T1 ---->
sw $a2, 8($sp)
lw $a1, 8($sp)
beq $a1, 1, or_label_1
#<---- JUMP_IF #T1 == 0 Else_start_label_1 ---->
#<---- Cancel $a1 for #T1 ---->
sw $a1, 8($sp)
lw $a1, 8($sp)
beq $a1, 0, Else_start_label_1
#<---- GEN_LABEL or_label_1: ---->
#<---- Cancel $a1 for #T1 ---->
sw $a1, 8($sp)
or_label_1:
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- print x@<1,1> ---->
lw $a1, 4($sp)
move $a0, $a1
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- JUMP ifElse_end_label_1 ---->
#<---- Cancel $a1 for x ---->
sw $a1, 4($sp)
j ifElse_end_label_1
#<---- GEN_LABEL Else_start_label_1: ---->
Else_start_label_1:
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- GEN_LABEL ifElse_end_label_1: ---->
ifElse_end_label_1:
#<---- END_BLOCK [1, 1] ---->
jr $ra
#<--------------- FUNC printI--------------->
func_label_printI:
#<------- FORM_VAR_DEF n@<1,2> printI ------->
lw $a1, 4($sp)
#<---- var i@<1,2> ---->
#<---- ASSIGN i@<1,2> = 0 ---->
move $a2, $zero
#<---- GEN_LABEL while_judge_label_0: ---->
#<---- Cancel $a1 for n ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for i ---->
sw $a2, 8($sp)
while_judge_label_0:
#<---- SET #T2 := i@<1,2> < n@<1,2> ---->
lw $a2, 8($sp)
lw $a3, 4($sp)
slt $a1, $a2, $a3
#<---- JUMP_IF #T2 == 1 or_label_2 ---->
#<---- Cancel $a1 for #T2 ---->
sw $a1, 12($sp)
#<---- Cancel $a2 for i ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for n ---->
sw $a3, 4($sp)
lw $a1, 12($sp)
beq $a1, 1, or_label_2
#<---- JUMP_IF #T2 == 0 while_end_label_0 ---->
#<---- Cancel $a1 for #T2 ---->
sw $a1, 12($sp)
lw $a1, 12($sp)
beq $a1, 0, while_end_label_0
#<---- GEN_LABEL or_label_2: ---->
#<---- Cancel $a1 for #T2 ---->
sw $a1, 12($sp)
or_label_2:
#<---- NEW_BLOCK [2, 0] ---->
#<---- print #str10 ---->
la $a0, str10
li $v0, 4
syscall
#<---- print i@<1,2> ---->
lw $a1, 8($sp)
move $a0, $a1
li $v0, 1
syscall
#<---- print #str11 ---->
la $a0, str11
li $v0, 4
syscall
#<---- #T3 = i@<1,2> ADD 1 ---->
addi $a2, $a1, 1
#<---- ASSIGN i@<1,2> = #T3 ---->
addi $a1, $a2, 0
#<---- SET #T4 := i@<1,2> == n@<1,2> ---->
lw $t0, 4($sp)
seq $a3, $a1, $t0
#<---- JUMP_IF #T4 == 1 or_label_3 ---->
#<---- Cancel $a1 for i ---->
sw $a1, 8($sp)
#<---- Cancel $a2 for #T3 ---->
sw $a2, 16($sp)
#<---- Cancel $a3 for #T4 ---->
sw $a3, 20($sp)
#<---- Cancel $t0 for n ---->
sw $t0, 4($sp)
lw $a1, 20($sp)
beq $a1, 1, or_label_3
#<---- JUMP_IF #T4 == 0 ifElse_end_label_2 ---->
#<---- Cancel $a1 for #T4 ---->
sw $a1, 20($sp)
lw $a1, 20($sp)
beq $a1, 0, ifElse_end_label_2
#<---- GEN_LABEL or_label_3: ---->
#<---- Cancel $a1 for #T4 ---->
sw $a1, 20($sp)
or_label_3:
#<---- NEW_BLOCK [3, 0] ---->
#<---- JUMP while_end_label_0 ---->
j while_end_label_0
#<---- END_BLOCK [3, 0] ---->
#<---- GEN_LABEL ifElse_end_label_2: ---->
ifElse_end_label_2:
#<---- END_BLOCK [2, 0] ---->
#<---- JUMP while_judge_label_0 ---->
j while_judge_label_0
#<---- GEN_LABEL while_end_label_0: ---->
while_end_label_0:
#<---- END_BLOCK [1, 2] ---->
jr $ra
#<--------------- FUNC main--------------->
func_label_main:
#<---- var a@<1,3> = 4 ---->
addi $a1, $zero, 4
#<---- var b@<1,3> = 7 ---->
addi $a2, $zero, 7
#<---- print #str12 ---->
la $a0, str12
li $v0, 4
syscall
#<---- PRE_CALL compare ---->
addi $sp, $sp, -108
#<---- PUSH_PARA a@<1,3> #function: compare #arg: x ---->
sw $a1, 4($sp)
#<---- PUSH_PARA b@<1,3> #function: compare #arg: y ---->
sw $a2, 8($sp)
#<---- FUNC_CALL compare ---->
sw $a1, 96($sp)
sw $a2, 100($sp)
jal func_label_compare
lw $a1, 96($sp)
lw $a2, 100($sp)
addi $sp, $sp, 108
#<---- ASSIGN #T5 = %RTX ---->
move $a3, $v0
#<---- PRE_CALL printI ---->
addi $sp, $sp, -116
#<---- PUSH_PARA 2 #function: printI #arg: n ---->
li $v1, 2
sw $v1, 4($sp)
#<---- FUNC_CALL printI ---->
sw $a1, 104($sp)
sw $a2, 108($sp)
sw $a3, 112($sp)
jal func_label_printI
lw $a1, 104($sp)
lw $a2, 108($sp)
lw $a3, 112($sp)
addi $sp, $sp, 116
#<---- ASSIGN #T6 = %RTX ---->
move $t0, $v0
#<---- #T7 = a@<1,3> SUB b@<1,3> ---->
subu $t1, $a1, $a2
#<---- print #T7 ---->
move $a0, $t1
li $v0, 1
syscall
#<---- print #str13 ---->
la $a0, str13
li $v0, 4
syscall
#<---- #T8 = a@<1,3> ADD b@<1,3> ---->
addu $t2, $a1, $a2
#<---- SET #T9 := 10 < #T8 ---->
sgt $t3, $t2, 10
#<---- JUMP_IF #T9 == 1 or_label_4 ---->
#<---- Cancel $a1 for a ---->
sw $a1, 4($sp)
#<---- Cancel $a2 for b ---->
sw $a2, 8($sp)
#<---- Cancel $a3 for #T5 ---->
sw $a3, 12($sp)
#<---- Cancel $t0 for #T6 ---->
sw $t0, 16($sp)
#<---- Cancel $t1 for #T7 ---->
sw $t1, 20($sp)
#<---- Cancel $t2 for #T8 ---->
sw $t2, 24($sp)
#<---- Cancel $t3 for #T9 ---->
sw $t3, 28($sp)
lw $a1, 28($sp)
beq $a1, 1, or_label_4
#<---- JUMP_IF #T9 == 0 ifElse_end_label_3 ---->
#<---- Cancel $a1 for #T9 ---->
sw $a1, 28($sp)
lw $a1, 28($sp)
beq $a1, 0, ifElse_end_label_3
#<---- GEN_LABEL or_label_4: ---->
#<---- Cancel $a1 for #T9 ---->
sw $a1, 28($sp)
or_label_4:
#<---- PRE_CALL test ---->
addi $sp, $sp, -104
#<---- #T10 = a@<1,3> SUB b@<1,3> ---->
lw $a1, 8($sp)
lw $a2, 4($sp)
subu $a3, $a2, $a1
#<---- PUSH_PARA #T10 #function: test #arg: x ---->
sw $a3, 4($sp)
#<---- FUNC_CALL test ---->
sw $a1, 92($sp)
sw $a2, 96($sp)
sw $a3, 100($sp)
jal func_label_test
lw $a1, 92($sp)
lw $a2, 96($sp)
lw $a3, 100($sp)
addi $sp, $sp, 104
#<---- ASSIGN #T11 = %RTX ---->
move $t0, $v0
#<---- GEN_LABEL ifElse_end_label_3: ---->
#<---- Cancel $a1 for b ---->
sw $a1, 8($sp)
#<---- Cancel $a2 for a ---->
sw $a2, 4($sp)
#<---- Cancel $a3 for #T10 ---->
sw $a3, 32($sp)
#<---- Cancel $t0 for #T11 ---->
sw $t0, 36($sp)
ifElse_end_label_3:
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK [1, 3] ---->
