% Ecuaciones no lineales
% Ejemplos
clear all
clc  %clear console
clf   %clear figure


f=@(x) humps(x); %funcion racional (cociente de polinomios que lleva
                 %octave para hacer pruebas.    
figure (1,"name","humps");   
xa=linspace(-2,2,127);             
plot(xa,f(xa),'r;humps;',[-2,2],[0,0])
grid on
                 
                 
                 
                 
% 1.- ejemplo: funcion humps, "Brackets methods". 
%  fzero       --Bolzano. Regula Falsi, etc...
% Método con convergencia garantizada == LENTO

x0=fzero (f,[-2,0])
%[x, fval, info, output] = fzero (f,[-2,0])
x1=fzero (f,0.5)
[x, fval, info, output] = fzero (f,0.5)

%figure (2,"name","humps=0");   ;
%t=linspace(-2,2,168);
%plot([x0,x1],[0,0],"*",[-2,2],[0,0],t,f(t));
%title("funcion humps(x)");
%legend("raices","cero","humps");
%
%
%% 2.- ejemplo: funcion humps desplazada: "Open methods"
%% fsolve  -- Newton, Secante-Boyren i o varias variables.
%% Punto Fijo...
%% No garantiza convergencia. Con aproximación local == RAPIDO
%%
%g=@(x) humps(x)-11.25715;
%
%x3=fzero(g,[-2,0.5])  
%x4=fzero(g,[1,2])
%
%x5= fzero(g,0.5)         % 1er Intento
%
%
%[x5, fval, info, output, fjac] =fsolve(g,0.5)  % 2do Intento
%
%
%
%figure (3); %,"name","humps-11.25=0");   ;
%addpath('../biblioteca')
%global paso;
%paso=0.01;
%dg=@(x) derivaprox3(g,x);
%
%A=fzero(dg,0.3)
%B=fzero(dg,0.9)
%
%t=linspace(-2,2,257);
%plot([-2,2],[0,0],t,g(t),[x3,x4,x5],[0,0,0],"*",[A,B],[g(A),g(B)],"o");
%text(x3,-3,'x_1')
%text(x4,-3,'x_3')
%text(x5,-3,'x_2')
%text(A+0.1,g(A)+0.1,'A')
%text(B+0.1,g(B)+0.1,'B')
%%title("funcion humps(x) desplazada");
%legend("y=0","y=f(x)");

%% 3.- ejemplo: Sistema de Ecuaciones no lineales
%% fsolve  -- Newton, Secante-Boyren 1 o varias variables.
%% Punto Fijo...
%% METODOS APLICABLES A FUNCIONES VECTORIALES.

%function y = F(x)
%  y = zeros (2, 1);
%  y(1) = -2*x(1)^2 + 3*x(1)*x(2)   + 4*sin(x(2)) - 6;
%  y(2) =  3*x(1)^2 - 2*x(1)*x(2)^2 + 3*cos(x(1)) + 4;
%end
%[x, fval, info] = fsolve (@F, [1; 2])




