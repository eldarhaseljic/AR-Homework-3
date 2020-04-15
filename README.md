# AR-Homework-3
Fakultet elektrotehnike Tuzla - Arhitektura racunara 

# ZADAĆA 3

## Arhitektura računara

## Maj, 2018.

## Sadržaj

## 1 Zadatak 1 2

## 2 Zadatak 2 2

## 3 Zadatak 3 2

## 4 Zadatak 4 3


## Zadatak 1

Date su sljedeće lokacije:
.section .data
bubroj: .byte 178 # unsigned
wbroj: .word 393 # signed
fbroj1: .float 388.444 # sp fp broj
fbroj2: .float -3.625 # sp fp broj
frezultat: .float 0.0 # sp fp broj
Napisati MIPS program koji za gornje podatke računa izraz:
frezultat = |fbroj1*fbroj2 - 10.5| / (bubroj * 32 + wbroj*7*fbroj2)
Na datim lokacijama se mogu nalaziti druge vrijednosti ali su uvijek datog tipa.

## Zadatak 2

Zadana je funkcija:
float stepen(float x, int n);
Funkcija računa n-ti stepen broja x. Napisati cijelu funkciju u MIPS asembleru. Napisati i
kompletan program u kome treba testirati pozivanje tražene funkcije.

## Zadatak 3

Napisati MIPS assembly program koji će biti ekvivalentan sljedećem dijelu C koda:
​double foo(double a, double* p, double b) {
return *p+a+b;
}
Testirati pozivanje tražene funkcije sljedećim programom:
#include <stdio.h>
double foo(double, double*, double);
int main() {
double p = 10.2;
double a = 2.1;
double b = 3.7;


printf("Rezultat = %f\n", foo(a, &p, b));
return 0;
}

## Zadatak 4

Napisati MIPS assembly program koji će biti ekvivalentan sljedećem dijelu C koda:
​ static int a = 3;
double foo(float b, float c, double d) {
c *= a;
return b + c - d;
}
Testirati pozivanje tražene funkcije sljedećim programom:
#include <stdio.h>
double foo(float, float, double);
int main() {
double d = 10.2;
float c = 2.1;
float b = 3.7;
printf("Rezultat = %f\n", foo(b, c, d));
return 0;
}


