%
% Coste producto de matrices
%
clear all;
%
% Numero de puntos de la secuencia de Fibonacci
%
long= 18;

n=[2,3,ones(1,long-2)];
for i=3:long
  n(i) = n(i-1)+n(i-2);
end
time=zeros(1,long);
for k=1:long  %Bucle para las muestras
    d=n(k);
    a=rand(d,d);
    b=rand(d,d);
    tic;
    x=a*b;
    time(k)=toc;
    disp(['k= ',num2str(k),' Talla ',num2str(d)]);
    
end   
  figure(1);
  subplot(2,1,1)
  plot(n,time,'-+');
  legend('T(n)','Location','Best');
  title(' Tiempos de multiplicacion');
  subplot(2,1,2)
  plot(log(n),log(time),'-+',log(n),2.7*log(n)-20,'.');
  legend('T(n)','Location','Best');
  title(' Tiempos de multiplicacion O(n**2.7) (escala log)');