.data
int_buffer: .space 32

x: .word 0
y: .word 0
ehmaior: .word 0
t0: .word 0
str_0: .asciiz "x é maior que y"
str_1: .asciiz "x não é maior que y"

.text
.globl main
main:
  li $t0, 5
  sw $t0, x
  li $t0, 8
  sw $t0, y
  li $t0, 0
  sw $t0, ehmaior
  lw $t1, x
  lw $t2, y
  sgt $t3, $t1, $t2
  sw $t3, t0
  lw $t0, t0
  sw $t0, ehmaior
  lw $t0, ehmaior
  beq $t0, $zero, L0
  la $a0, str_0
  li $v0, 4
  syscall
  j L1
L0:
  la $a0, str_1
  li $v0, 4
  syscall
L1:
