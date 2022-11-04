.data
str0: .asciiz "Hello world! "
.text
addi $sp, $sp, -24
j func_label_main
#<--------------- FUNC add--------------->
func_label_add:
#<------- FORM_VAR_DEF a@<1,0> add ------->
lw $a1, 4($sp)
#<------- FORM_VAR_DEF b@<1,0> add ------->
lw $a2, 8($sp)
#<---- NEW_BLOCK [1, 0] ---->
#<---- #T0 = a@<1,0> ADD b@<1,0> ---->
addu $a3, $a1, $a2
#<---- return #T0 ---->
move $v0, $a3
jr $ra
#<---- END_BLOCK [1, 0] ---->
jr $ra
#<--------------- FUNC main--------------->
func_label_main:
#<---- NEW_BLOCK [1, 1] ---->
#<---- var a@<1,1> = 1 ---->
addi $a1, $zero, 1
#<---- var b@<1,1> = 2 ---->
addi $a2, $zero, 2
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- PRE_CALL add ---->
addi $sp, $sp, -104
#<---- PRE_CALL add ---->
addi $sp, $sp, -104
#<---- PUSH_PARA a@<1,1> #function: add #arg: a ---->
sw $a1, 4($sp)
#<---- PUSH_PARA b@<1,1> #function: add #arg: b ---->
sw $a2, 8($sp)
#<---- FUNC_CALL add ---->
sw $a1, 92($sp)
sw $a2, 96($sp)
jal func_label_add
lw $a1, 92($sp)
lw $a2, 96($sp)
addi $sp, $sp, 104
#<---- ASSIGN #T1 = %RTX ---->
move $a3, $v0
#<---- PUSH_PARA #T1 #function: add #arg: a ---->
sw $a3, 4($sp)
#<---- PRE_CALL add ---->
addi $sp, $sp, -104
#<---- PUSH_PARA b@<1,1> #function: add #arg: a ---->
sw $a2, 4($sp)
#<---- #T2 = a@<1,1> MUL b@<1,1> ---->
mult $a1, $a2
mflo $t0
#<---- PUSH_PARA #T2 #function: add #arg: b ---->
sw $t0, 8($sp)
#<---- FUNC_CALL add ---->
sw $a1, 92($sp)
sw $a2, 96($sp)
sw $a3, 100($sp)
sw $t0, 16($sp)
jal func_label_add
lw $a1, 92($sp)
lw $a2, 96($sp)
lw $a3, 100($sp)
lw $t0, 16($sp)
addi $sp, $sp, 104
#<---- ASSIGN #T3 = %RTX ---->
move $t1, $v0
#<---- PUSH_PARA #T3 #function: add #arg: b ---->
sw $t1, 8($sp)
#<---- FUNC_CALL add ---->
sw $a1, 92($sp)
sw $a2, 96($sp)
sw $a3, 100($sp)
sw $t0, 16($sp)
sw $t1, 20($sp)
jal func_label_add
lw $a1, 92($sp)
lw $a2, 96($sp)
lw $a3, 100($sp)
lw $t0, 16($sp)
lw $t1, 20($sp)
addi $sp, $sp, 104
#<---- ASSIGN #T4 = %RTX ---->
move $t2, $v0
#<---- print #T4 ---->
move $a0, $t2
li $v0, 1
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK [1, 1] ---->
