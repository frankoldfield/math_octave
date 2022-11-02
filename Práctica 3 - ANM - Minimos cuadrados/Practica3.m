%%PRÁCTICA 3 ANÁLISIS NUMÉRICO MATRICIAL
addpath("~/BibliotecaANM")
clear all
clear
disp("PRIMERA PRÁCTICA")

disp("Ejercicio 1")

A = hilb(25)
A = A(:,1:7)

disp("Ejercicio 2")
x = ones(7,1)
b = A*x
A\b

disp("Ejercicio 3")
[L,x2] = solveCholeski(A,b)
[Q,R]= gramschmidt(A)
solveQR(Q,R,b)