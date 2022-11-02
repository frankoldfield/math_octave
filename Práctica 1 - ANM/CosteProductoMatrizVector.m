%
% Coste producto de matriz vector. 
% Se comprueba usando matrices y vectores con 
% entradas aleatorias.
%
clear all;
%
% Talla de la matriz sigue el crecimiento de la 
% la secuencia de Fibonacci
%
long= 20; % Numero de valores de la secuencia de Fibonacci
%
n=[2,3,ones(1,long-2)];
for i=3:long
  n(i) = n(i-1)+n(i-2);
end
time=zeros(1,long);
for k=1:long  %Bucle para las muestras
    d=n(k);
    a=rand(d,d);
    b=rand(d,1);
    tic;
    x=a*b;
    time(k)=toc;
    disp(['k= ',num2str(k),' Talla ',num2str(d)]);
end 
 
  figure(1);
  subplot(2,1,1)
  plot(n,time,'-+');
  legend('T(n)','Location','Best');
  title(' Tiempos de multiplicacion Matriz-vector');
  subplot(2,1,2)
  plot(log(n),log(time),'-+',log(n),2.0*log(n)-20,'.');
  legend('T(n)','Location','Best');
  title(' Tiempos Matriz*vector O(n**2) (escala log)');