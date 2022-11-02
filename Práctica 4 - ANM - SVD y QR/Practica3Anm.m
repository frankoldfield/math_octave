clc
clear
clear all

disp("Práctica 3 análisis numérico matricial parte 1")
n=5;
u=1:n;
u=u';
c2=cos(2*u);
c=cos(u);
s=sin(u);
A=[u,c2,ones(n,1),rand()*c.*c,exp(u),s.*s]
Q=gramschmidt(A)
prod1=Q*Q'
prod2=Q'*Q
Q2=gramschmidt(Q)

B=rand(3);
[Q3,R] = gramschmidt(B)

disp("Práctica 3 análisis numérico matricial parte 2")

disp("Ejercicio 1")

X = logspace(0,3,11)
figure;
for n=4:14
  for j=1:30
    A = rand(fibonacci(n));
    [GSC,~] = gramschmidt(A);
    Y1(n-3,j) = norm(GSC'*GSC-eye(size(GSC)),inf);
    [GSM,~] = modgramschmidt(A);
    Y2(n-3,j) = norm(GSM'*GSM-eye(size(GSM)),inf);
    [GSH,~] = Householdergramschmidt(A);
    Y3(n-3,j) = norm(GSH'*GSH-eye(size(GSH)),inf);
  endfor
endfor
subplot (1, 3, 1);
loglog(X,Y1,'o','MarkerFaceColor','r')
grid on
axis([0 1000 10^(-17) 10^(-7)])
subplot (1, 3, 2);
loglog(X,Y2,'o','MarkerFaceColor','r')
grid on
axis([0 1000 10^(-17) 10^(-9)])
subplot (1, 3, 3);
loglog(X,Y3,'o','MarkerFaceColor','r')
grid on
axis([0 1000 10^(-17) 10^(-12)])
%%loglog(X,X^2)
%%loglog(X,Y2,'s')
%%loglog(X,Y3,'s')