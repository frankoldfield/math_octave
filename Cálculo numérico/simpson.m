% Algoritmo para calcular una aproximacion de la integral mediante
% el metodo de Simpson compuesto
%
%  Entrada:    - f es la funcion que queremos integrar
%
%              - a y b son los extremos de integracion.
%             
%              - N es el numero de subintervalos en que se divide [a,b], tiene 
%                que ser un numero par. 
% 
%  Salida:     - int es el valor aproximado de la integral

function int= simpson(f,a,b,N)
if rem(N,2)==0; % rem(a,b) calculo el residuo de la division a/b
  % N par
  x=linspace(a,b,N+1);
  w=ones(1,N+1);
  w(2:2:N)=4*w(2:2:N);
  w(3:2:N)=2*w(3:2:N);
  int=(b-a)/(3*N)*sum(w.*f(x));
else
disp('El valor de N es impar');
end
endfunction
