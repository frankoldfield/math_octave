% Algoritmo para calcular una aproximacion de la integral mediante
% el metodo de los trapecios compuesto
%
%  Entrada:    - f es la funcion que queremos integrar
%
%              - a y b son los extremos de integracion.
%             
%              - N es el numero de subintervalos en que se divide [a,b].
% 
%  Salida:     - int es el valor aproximado de la integral

function int = trapecios(f,a,b,N)
  x=linspace(a,b,N+1);
  w=2*ones(1,N-1);
  w=[1 w 1];
  int = (b-a)/(2*N) *sum(w.*f(x)); 
endfunction
