.section .data
bubroj: .byte 178 # unsigned
wbroj: .word 393 # signed
fbroj1: .float 388.444 # sp fp broj
fbroj2: .float -3.625 # sp fp broj
frezultat: .float 0.0 # sp fp broj

.section .text
.set noreorder
.globl main
main:
la $t0 , fbroj1    		#Ucitavamo adresu od fbroj1
l.s $f5 , ($t0)			#Ucitavamo broj na coprocesor
la $t3 , fbroj2			#Ucitavamo adresu od fbroj2
l.s $f17, ($t3)			#Ucitavamo broj na coprocesor
mul.s $f5 , $f5 , $f17		#Mnozimo dva broja
lui $t2 , 0x4128		#Ucitavamo 10.5 sa lui i ori, te vrsimo move na procesor
ori $t2 , $t2 , 0x0000
mtc1 $t2 , $f9
sub.s $f9 , $f5 , $f9		#(fbroj1*fbroj2)-10.5
abs.s $f9 , $f9			#|(fbroj1*fbroj2)-10.5|

la $t0 , bubroj			#Ucitavamo adresu od bubroj
lbu $t0 , ($t0)			#Ucitavamo unsigned bubroj
sll $t0 , $t0 , 5		#bubroj*32
mtc1 $t0 , $f5			#Pomijeramo rezultat mnozenja na coprocesor
cvt.s.w $f5 , $f5		#Pretvaramo  taj broj iz int u float

la $t1 , wbroj			#Ucitavamo adresu od wbroj
lw $t1 , ($t1)			#Ucitavamo wbroj 
addi $t2 , $0 , 7		
mult $t1 , $t2			#wbroj*7
mflo $t1			
mtc1 $t1 , $f7			#Pomijeramo rezultat mnozenja na coprocesor
cvt.s.w $f7, $f7
mul.s $f7, $f7 , $f17		#fbroj2*7*wbroj
add.s $f7 , $f7 , $f5		#fbroj2*7*wbroj + bubroj*32
div.s $f9 , $f9 , $f7		#dijelimo f9 sa f12
la $t0 , frezultat		#Spremamo rezultat
s.s $f9 , ($t0)

addi $v0 , $0 , 0
jr $ra
nop
