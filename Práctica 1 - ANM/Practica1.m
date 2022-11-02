%% PRÁCTICA 1 ANÁLISIS NUMÉRICO MATRICIAL - COSTE DE COMPUTACIÓN
clear all
clear
clc

disp("APARTADO 1.a")
n=3;
i=2;
a=eye(n,n)
u=a(:,i)

%%La función eye(x) nos devuelve la matriz identidad de tamaño x
%% u lo definimos como todas las filas de la columna i, es decir, todos los elementos de la columna i
%% Cuando cogemos u=a(:,i) estamos definiendo u como la columna i de la matriz a

disp("APARTADO 1.b")
u = rand(n,1)
v = rand(n,1)

d = dot(v,u)
w = v - (d/norm(u)^2)*u

s = dot(w,u)

disp("APARTADO 1.C")
A = rand(n,n)
B = 0.5*(A+A')
C = 0.5*(A-A')
x = [1 5 2]'
y = [4 3 7]'
disp("APARTADO 1.C.1")
Cx = dot(C*x, x)
Cy = dot(C*y, y)

disp("Como podemos ver los productos escalares con C son 0, porque la diagonal de C es de ceros")

disp("APARTADO 1.C.2")
Bx = dot(B*x, x)
By = dot(B*y, y)
Ax = dot(A*x, x)
Ay = dot(A*y, y)
disp("La matriz B tiene la misma diagonal que la A y las demás entradas son la media de las entradas con sus traspuestas, por eso el producto escalar sale igual al hacerlo con A y con B")

disp("APARTADO 2")

M = [10 7 8 7 ; 7 5 6 5 ; 8 6 10 9 ; 7 5 9 10]
b = [32;23;33;31]
Mp = [10 7 8.1 7.2 ; 7.08 5.04 6 5 ; 8 5.98 9.89 9 ; 6.99 4.99 9 9.98]
bp = [32.1 ; 22.9 ; 33.1 ; 30.9]

SolAb = [1 ; 1 ; 1 ; 1]
y = linsolve(Mp,b)
z = linsolve(M,bp)

disp("APARTADO 3 HECHO EN FICHEROS SEPARADOS")

disp("APARTADO 4")
n4 = 5
r = 10^(-20)
p = NonsingularMat(n4)
A4 = p * diag([ones(n4-1,1);r])*inv(p)
det(A4)
%% El determinante de la matriz A va a ser el número r, porque se saca de la diagonal y podemos conmutarlo a la izquierda de la operación, lo que resulta en p * I * inv(p), y el determinante sería r * det(I)=r*1=r
%Con el ejemplo del ejercicio se observa que no se cumple lo que hemos dicho, posíblemente por errores de aproximación, ya que el real r es demasiado pequeño

disp("APARTADO 5.a")
r = 3
U = rand(r)
A5 = 0
for i=1:r
A5 = A5 + U(:,i)*U(:,i)'
endfor

disp("APARTADO 6.a")
n=3
r1=rand(n,1)
r2= rand(1,n)
A6 = r1*r2

disp("APARTADO 6.b")
n=3;
a1 = rand(1,n)
A=[a1;a1;a1]
%%ME FALTA HACER LA COMPROBACIÓN

disp("APARTADO 7")
AG(:,:,1,1)=[1 2 3;3 2 1;4 2 1]
AG(:,:,2,1)=[0.75 0 0.25;0 1 0;0.25 0 0.75]
AG(:,:,3,1)=[0.375 0 -0.125;0 0.5 0;-0.125 0 0.375]
AG(:,:,4,1)=[-0.25 0 -0;0 1 0;-0.75 0 -0.25]
n=5
for i=1:4
  for j=2:n
    AG(:,:,i,j)=AG(:,:,i,1)^(j)
  endfor
endfor
disp(AG)

