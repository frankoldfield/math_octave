clear all
clc
clf

addpath('.../Biblioteca')

f=@(x) tan(pi*x-6);
a=0
b=0.48
errorParada=0.5E-8

x0=biseccion(f,a,b, errorParada)