.section .text
.set noreorder
.globl foo
foo:

l.d $f4 , ($a2)
l.d $f6 , 16($sp)
add.d $f0 , $f12 , $f4
add.d $f0 , $f0 , $f6
jr $ra 
nop
