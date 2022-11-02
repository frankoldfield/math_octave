addpath('../biblioteca')
clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Problema 1')
f=@(x) x.^2+10*cos(x);
figure(1)
x=linspace(-10,10,100);
plot(x,f(x))
title('Funcion f(x)=x^2+10*cos(x)')
grid on
##%Aplicamos el metodo de biseccion
global tipoerror
tipoerror='absoluto'
biseccion(f,1.9,2,10^(-4));
%Comprobamos que se cumplen las condiciones para que el algoritmo de Newton sea
%convergente
figure(2)
df=@(x) 2*x-10*sin(x);
d2f=@(x) 2+10*cos(x);
x=linspace(1.9,2,100);
subplot(1,2,1)
plot(x,df(x))
legend('primera derivada')
subplot(1,2,2)
plot(x,d2f(x))
legend('segunda derivada')
f2=f(2)
%Aplicamos el metodo de Newton con x0=2
newton(f,df,2,10^(-4),10);
%Aplicamos el metodo de la secante
secante(f,1.9,2,10^(-4),20);
%Aplicamos el metodo de  regula falsi
regulafalsi(f,1.9,2,10^(-4),10^(-4),20);
%Veamos si podemos aplicar algun algoritmo de punto fijo
g=@(x) sqrt(-10*cos(x));
dg=@(x) sqrt(10/4)*sin(x).*(-cos(x)).^(-1/2);
x=linspace(1.9,2,100);
figure(3)
subplot(1,2,1)
plot(x,x,x,g(x))
legend('y=x','g')
subplot(1,2,2)
plot(x,dg(x))
legend('derivada de g')
puntofijo(g,1.95,10^(-4),30)

g=@(x) acos(-x.^2/10);
dg=@(x) 2*x./sqrt(100-x.^4);
x=linspace(1.9,2,100);
figure(4)
subplot(1,2,1)
plot(x,x,x,g(x))
legend('y=x','g')
subplot(1,2,2)
plot(x,dg(x))
legend('derivada de g')
puntofijo(g,1.95,10^(-4),30)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Problema 6')
f=@(x) exp(x)-100*x.^2;
figure(5)
x=linspace(-0.2,0,100);
plot(x,f(x))
title('Funcion f(x)=exp(x)-100*x^2')
grid on
%Aplicamos el metodo de biseccion
global tipoerror
tipoerror='absoluto'
biseccion(f,-0.1,0,10^(-4));
%Comprobamos que se cumplen las condiciones para que el algoritmo de Newton sea
%convergente
figure(6)
df=@(x) exp(x)-200*x;
d2f=@(x) exp(x)-200;
x=linspace(-0.1,0,100);
subplot(1,2,1)
plot(x,df(x))
legend('primera derivada')
subplot(1,2,2)
plot(x,d2f(x))
legend('segunda derivada')

%Aplicamos el metodo de Newton con x0=-0.1
newton(f,df,-0.1,10^(-4),10);
%Aplicamos el metodo de la secante
secante(f,-0.1,0,10^(-4),20);
%Aplicamos el metodo de  regula falsi
regulafalsi(f,-0.1,0,10^(-4),10^(-4),20);
%Veamos si podemos aplicar algun algoritmo de punto fijo
g1=@(x) -exp(x/2)/10;
dg1=@(x) -exp(x/2)/20;
x=linspace(-0.15,0.05,100);
figure(7)
subplot(1,2,1)
plot(x,x,x,g1(x))
legend('y=x','g1')
subplot(1,2,2)
plot(x,dg1(x))
legend('derivada de g1')
puntofijo(g1,-0.05,10^(-4),30)
## Hallamos las otras raices con los algoritmos de punto fijo correspondientes
g2=@(x) exp(x/2)/10;
dg2=@(x) exp(x/2)/20;
x=linspace(0.05,0.15,100);
figure(8)
subplot(1,2,1)
plot(x,x,x,g2(x))
legend('y=x','g2')
subplot(1,2,2)
plot(x,dg2(x))
legend('derivada de g2')
puntofijo(g2,-0.05,10^(-4),30)

g3=@(x) 2*(log(x)+log(10));
dg3=@(x) 2*x.^(-1);
x=linspace(8.95,9.05,100);
figure(9)
subplot(1,2,1)
plot(x,x,x,g3(x))
legend('y=x','g3')
subplot(1,2,2)
plot(x,dg3(x))
legend('derivada de g3')
puntofijo(g3,9,10^(-4),30);
newton(f,df,9,10^(-4),30);
biseccion(f,8.95,9.05,10^(-4));
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Problema 9')
g=@(x) sqrt(-log(cos(x)));
dg=@(x) sin(x)./(2*cos(x).*sqrt(-log(cos(x))));
figure(10)
x=linspace(1.4,1.5,100);
s(1)=subplot(1,2,1)
plot(x,x,x,g(x))
legend('y=x','g=sqrt(-log(cos(x)))')
s(2)=subplot(1,2,2)
plot(x,dg(x))
legend('derivada de g')
title(s(1),'Estudio Punto fijo Ejercicio 9')
puntofijo(g,1.45,1/2*10^(-3),30);

f=@(x) exp(-x.^2)-cos(x);
figure(11)
x=linspace(-10,10,100);
plot(x,f(x))
title('Funcion f(x)=exp(-x^2)-cos(x)')
grid on
%vamos a calular le primer cero positivo mediante los metodos de biseccion
%newton, secante y regula falsi
biseccion(f,1.4,1.5,1/2*10^(-14));
df=@(x) -2*x*exp(-x^2)+sin(x);
newton(f,df,1.5,1/2*10^(-14),30);
secante(f,1.4,1.5,1/2*10^(-14),30);
regulafalsi(f,1.4,1.5,1/2*10^(-14),10^(-15),30);
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Problema 11')
global tipoerror
tipoerror='relativo'
f=@(x) x^3-5;
df=@(x) 3*x^2;
newton(f,df,2,1/2*10^(-5),30);

f=@(x) x^2-5/x;
df=@(x) 2*x+5/x^2;
newton(f,df,2,1/2*10^(-5),30);
