clear all
clc
clf

addpath('.../Biblioteca')

format long g

f=@(x) tan(pi*x)-6;
a=0
b=0.48
errorParada=0.5E-8

xa=linspace(a,b,127)
plot(xa,f(xa))
grid on

x0=biseccion(f,a,b, errorParada)
ylim([-5,10])

numMaxIte=200;

x1=secante(f,0.48,0.49,errorParada,numMaxIte)

x2=regulafalsi(f,a,b,errorParada,tol,numMaxIte)

x3=fzero(f,0.3)

[x3,fx3]=fzero(f,[a,b])