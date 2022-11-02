% Ejemplo: Modelo de Peng-Robinson de ecuacion del estado de gas no ideal
%  P= ((RT)/(V-b))-(a/(V^2+2 b V-b^2))


clc
clear all

clf


a=2.3e6  % cm6 bar mol-2
b=24.7    % cm3 mol-1
P=50      % bar
T=473     % K

R=83.1451 % cm3 · bar  K-1 mol-1
R*T

%% El Volumen en estas condiciones es la solución de la ecuacion no lineal f(x)=0

f=@(V) P-R*T./(V-b)+a./(V.^2+2*b.*V-b^2);

%% para localizar los ceros de los denominadores   V distinto de b=24.7 y
h=@(V) V.^2+2*b.*V-b^2;  % OJO denominador con dos ceros cerca de 10

%% Busqueda de intervalo donde esta la solucion: f cambia de signo
%% usamos la grafica de f
vm= 700%    500    %700
vM= 800%   1000  %800

tV=linspace(vm,vM,128);

figure(1,'Name','F(V)==0  Modelo matematico de Peng-Robinson')
plot([vm,vM],[0,0],tV,f(tV))
hold

%% Una vez localizado el cero lo buscamos con la función fzero
V=fzero(f,[vm,vM])
plot(V,0,'*','Color','k')

