%%PRÁCTICA 2 ANÁLISIS NUMÉRICO MATRICIAL
clear all
clear
clc
disp("Ejercicio 1.c)")

disp("Ahora el caso n=4")

n=4
A=rand(n,n)
R=triu(A)
S=tril(A)
b=rand(n,1)
solveU(R,b)
solveL(S,b)

disp("Ahora el caso n=5")

n=5
A=rand(n,n)
R=triu(A)
S=tril(A)
b=rand(n,1)
solveU(R,b)
solveL(S,b)

disp("Ahora el caso n=6")

n=6
A=rand(n,n)
R=triu(A)
S=tril(A)
b=rand(n,1)
solveU(R,b)
solveL(S,b)

disp("Ejercicio 2.a)")

A2 = rand(4,4)
B2 = rand(4,1)
[L2,U2,x2] = solveLUCompleto(A2,B2)

disp("Ejercicio 2.b)")
[L,U]=lu(A2)
[L,U,P]=lu(A2)

disp("Ejercicio 2.c)")

detL2U2 = det(L2)*det(U2)
detA2 = det(A2)

disp("Ejercicio 2.d)")

n=[4 5 10];
Casos = cell(3,5);
for i=1:3
  D0 = diag(2*ones(1,n(i)));
  D_1 = diag(-ones(1,n(i)-1),-1);
  D1 = diag(-ones(1,n(i)-1),1);
  AD = D0+D_1+D1;
  Casos(i,1) = AD;
  b2 = zeros(n(i),1);
  for j=1:n(i)
    b2(j) = 3*sin(2*pi*((j-1)/(n(i))));
  endfor
  
  [LD,UD]= LUGaussSinPerm(AD);
  Casos(i,2) = LD;
  Casos(i,3) = UD;
  Casos(i,4) = det(LD)*det(UD);
  Casos(i,5) = solveLU(LD,UD,b2);
  clearvars D0 D_1 D1 b2 AD LD UD
endfor
Casos

disp("Ejercicio 3")

A3 = [1 1+0.5*(10^(-15)) 3;2 2 20; 3 6 4]
[L3,U3] = LUGaussSinPerm(A3)
A3 - L3*U3

disp("Ejercicio 4")

disp("Ejercicio 5")
A5=rand(3)
[l5,d5,r5]=LDR(A5)

disp("Ejercicio 6")
##Este ya está hecho de la práctica anterior

disp("Ejercicio 7, 8, 9")
##Hecho en otro fichero
























