.data
str0: .asciiz "20373184\n"
str1: .asciiz "Wow, you will begin test your program!\n"
str2: .asciiz "\n"
str3: .asciiz "\n"
str4: .asciiz "\n"
str5: .asciiz "\n"
str6: .asciiz "\n"
str7: .asciiz "\n"
str8: .asciiz "\n"
str9: .asciiz "-"
str10: .asciiz "\n"
.text
addi $sp, $sp, -148
j func_label_main
#<--------------- FUNC main--------------->
func_label_main:
#<---- NEW_BLOCK [1, 0] ---->
#<---- var a1@<1,0> = 1 ---->
addi $a1, $zero, 1
#<---- var _bc@<1,0> = -2 ---->
addi $a2, $zero, -2
#<---- var _de@<1,0> = 3 ---->
addi $a3, $zero, 3
#<---- var fff@<1,0> = 4 ---->
addi $t0, $zero, 4
#<---- var ggg@<1,0> = 5 ---->
addi $t1, $zero, 5
#<---- var hhh@<1,0> = 6 ---->
addi $t2, $zero, 6
#<---- var x1@<1,0> = 111 ---->
addi $t3, $zero, 111
#<---- var x2@<1,0> = 357 ---->
addi $t4, $zero, 357
#<---- var x3@<1,0> = 38 ---->
addi $t5, $zero, 38
#<---- var x4@<1,0> ---->
#<---- #T0 = x2@<1,0> MUL 3 ---->
addi $v1, $zero, 3
mult $t4, $v1
mflo $t7
#<---- #T1 = x1@<1,0> ADD #T0 ---->
addu $t8, $t3, $t7
#<---- ASSIGN x4@<1,0> = #T1 ---->
addi $t6, $t8, 0
#<---- var x5@<1,0> ---->
#<---- var x6@<1,0> ---->
#<---- var x7@<1,0> ---->
#<---- var x8@<1,0> ---->
#<---- var x9@<1,0> ---->
#<---- var x10@<1,0> ---->
#<---- var y1@<1,0> ---->
#<---- var y2@<1,0> ---->
#<---- var y3@<1,0> ---->
#<---- var y4@<1,0> ---->
#<---- var y5@<1,0> ---->
#<---- Cancel $a1 for a1 ---->
sw $a1, 4($sp)
#<---- var y6@<1,0> ---->
#<---- Cancel $a2 for _bc ---->
sw $a2, 8($sp)
#<---- var y7@<1,0> ---->
#<---- Cancel $a3 for _de ---->
sw $a3, 12($sp)
#<---- var y8@<1,0> ---->
#<---- Cancel $t0 for fff ---->
sw $t0, 16($sp)
#<---- x5@<1,0> = input() ---->
li $v0, 5
syscall
move $t9, $v0
#<---- x6@<1,0> = input() ---->
li $v0, 5
syscall
move $s0, $v0
#<---- x7@<1,0> = input() ---->
li $v0, 5
syscall
move $s1, $v0
#<---- x8@<1,0> = input() ---->
li $v0, 5
syscall
move $s2, $v0
#<---- x9@<1,0> = input() ---->
li $v0, 5
syscall
move $s3, $v0
#<---- x10@<1,0> = input() ---->
li $v0, 5
syscall
move $s4, $v0
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- print #str1 ---->
la $a0, str1
li $v0, 4
syscall
#<---- print 3 ---->
li $a0, 3
li $v0, 1
syscall
#<---- print #str2 ---->
la $a0, str2
li $v0, 4
syscall
#<---- print 30 ---->
li $a0, 30
li $v0, 1
syscall
#<---- print #str3 ---->
la $a0, str3
li $v0, 4
syscall
#<---- ASSIGN y1@<1,0> = -3 ---->
addi $s5, $zero, -3
#<---- #T2 = x2@<1,0> MOD x1@<1,0> ---->
#<---- Cancel $t1 for ggg ---->
sw $t1, 20($sp)
div $t4, $t3
mfhi $t1
#<---- #T3 = #T2 ADD 5 ---->
#<---- Cancel $t2 for hhh ---->
sw $t2, 24($sp)
addi $t2, $t1, 5
#<---- ASSIGN y2@<1,0> = #T3 ---->
addi $s6, $t2, 0
#<---- #T4 = x4@<1,0> MUL x3@<1,0> ---->
#<---- Cancel $t3 for x1 ---->
sw $t3, 28($sp)
mult $t6, $t5
mflo $t3
#<---- #T5 = #T4 SUB 4 ---->
#<---- Cancel $t4 for x2 ---->
sw $t4, 32($sp)
addi $t4, $t3, -4
#<---- ASSIGN y3@<1,0> = #T5 ---->
addi $s7, $t4, 0
#<---- #T6 = x5@<1,0> DIV 2 ---->
#<---- Cancel $t5 for x3 ---->
sw $t5, 36($sp)
addi $v1, $zero, 2
div $t9, $v1
mflo $t5
#<---- #T7 = #T6 MUL 6 ---->
#<---- Cancel $t6 for x4 ---->
sw $t6, 40($sp)
addi $v1, $zero, 6
mult $t5, $v1
mflo $t6
#<---- ASSIGN y4@<1,0> = #T7 ---->
addi $fp, $t6, 0
#<---- #T8 = 1 ADD x7@<1,0> ---->
#<---- Cancel $t7 for #T0 ---->
sw $t7, 44($sp)
addi $t7, $s1, 1
#<---- #T9 = x6@<1,0> MUL #T8 ---->
#<---- Cancel $t8 for #T1 ---->
sw $t8, 48($sp)
mult $s0, $t7
mflo $t8
#<---- #T10 = #T9 MOD 3 ---->
#<---- Cancel $t9 for x5 ---->
sw $t9, 52($sp)
addi $v1, $zero, 3
div $t8, $v1
mfhi $t9
#<---- ASSIGN y5@<1,0> = #T10 ---->
addi $a1, $t9, 0
#<---- #T11 = 0 SUB x8@<1,0> ---->
#<---- Cancel $s0 for x6 ---->
sw $s0, 56($sp)
li $v1, 0
sub $s0, $v1, $s2
#<---- ASSIGN y6@<1,0> = #T11 ---->
addi $a2, $s0, 0
#<---- #T12 = 6 ADD x9@<1,0> ---->
#<---- Cancel $s1 for x7 ---->
sw $s1, 60($sp)
addi $s1, $s3, 6
#<---- ASSIGN y7@<1,0> = #T12 ---->
addi $a3, $s1, 0
#<---- print y1@<1,0> ---->
move $a0, $s5
li $v0, 1
syscall
#<---- print #str4 ---->
la $a0, str4
li $v0, 4
syscall
#<---- print y2@<1,0> ---->
move $a0, $s6
li $v0, 1
syscall
#<---- print #str5 ---->
la $a0, str5
li $v0, 4
syscall
#<---- print y3@<1,0> ---->
move $a0, $s7
li $v0, 1
syscall
#<---- print #str6 ---->
la $a0, str6
li $v0, 4
syscall
#<---- print y4@<1,0> ---->
move $a0, $fp
li $v0, 1
syscall
#<---- print #str7 ---->
la $a0, str7
li $v0, 4
syscall
#<---- print y5@<1,0> ---->
move $a0, $a1
li $v0, 1
syscall
#<---- print #str8 ---->
la $a0, str8
li $v0, 4
syscall
#<---- print y6@<1,0> ---->
move $a0, $a2
li $v0, 1
syscall
#<---- print #str9 ---->
la $a0, str9
li $v0, 4
syscall
#<---- print y7@<1,0> ---->
move $a0, $a3
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
#<---- END_BLOCK [1, 0] ---->
