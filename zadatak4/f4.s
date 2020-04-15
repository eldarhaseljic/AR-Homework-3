.section .data
a: .word 3

.section .text
.set noreorder
.globl foo
foo:

mtc1 $a2 , $f4
mtc1 $a3 , $f5
la $t0 , a
lw $t0 , ($t0)
mtc1 $t0 , $f7
cvt.s.w $f7 , $f7
mul.s $f14 , $f14 , $f7
add.s $f12 , $f12 , $f14
cvt.d.s $f12 , $f12
sub.d $f0 , $f12 , $f4
jr $ra
nop

