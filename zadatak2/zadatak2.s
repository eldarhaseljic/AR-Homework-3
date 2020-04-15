.section .rodata
A1: .string "%f"
A2: .string " ^ %d = %f\n"

.section .bss
rez: .float

.section .data
x: .float 2.7
n: .word 5

.section .text
.set noreorder
.globl main
main:

la $t0 , x
l.s $f12 , ($t0)
la $a1 , n
lw $a1 , ($a1)

addi $sp , $sp , -24
sw $ra , 16($sp)

jal stepen
nop

lw $ra , 16($sp)
addi $sp , $sp , 24

la $t0 , rez
s.s $f0 , ($t0)

################################
ispis:
la $a0 , A1
cvt.d.s $f12 , $f12
mfc1 $a2 , $f12
mfc1 $a3 , $f13

addi $sp , $sp , -24
sw $ra , 16($sp)

jal printf
nop

lw $ra , 16($sp)
addi $sp , $sp , 24

cvt.s.d $f12 , $f12

la $a0 , A2
la $t0 , n
lw $a1 , ($t0)
la $t1 , rez
l.s $f0 , ($t1)
cvt.d.s $f0 , $f0
mfc1 $a2 , $f0
mfc1 $a3 , $f1

addi $sp , $sp , -24
sw $ra , 16($sp)

jal printf
nop

lw $ra , 16($sp)
addi $sp , $sp , 24

cvt.s.d $f0 , $f0
####################################

kraj:
addi $v0 , $0 , 0
jr $ra
nop

######################################################

.globl stepen
stepen:

beq $a1 , $0 , end
nop

addi $sp , $sp , -24
sw $a1, 8($sp)
sw $ra , 16($sp)

addi $a1 , $a1 , -1
jal stepen
nop

lw $a1 , 8($sp)
lw $ra , 16($sp)
addi $sp , $sp , 24

mul.s $f0 , $f0 , $f12
jr $ra
nop

end:
addi $t8 , $0 , 1
mtc1 $t8 , $f0
cvt.s.w $f0 , $f0
jr $ra 
nop



