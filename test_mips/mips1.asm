.data
str0: .asciiz "Hello World\n"
.text
addi $gp, $gp, 4
#<------- var test@<0,0> ------->
addi $sp, $sp, -12
j func_label_main
#<--------------- FUNC main--------------->
func_label_main:
#<---- NEW_BLOCK [1, 0] ---->
#<---- var x@<1,0> = 1 ---->
addi $a1, $zero, 1
#<---- #T0 = 0 SUB x@<1,0> ---->
li $v1, 0
sub $a2, $v1, $a1
#<---- var y@<1,0> = #T0 ---->
addi $a3, $a2, 0
#<---- print #str0 ---->
la $a0, str0
li $v0, 4
syscall
#<---- print y@<1,0> ---->
move $a0, $a3
li $v0, 1
syscall
#<---- return 0 ---->
li $v0, 0
li $v0, 10
syscall
#<---- END_BLOCK [1, 0] ---->
