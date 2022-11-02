function [L,x] = solveCholeski(A,b)
  %Comprobar que A es una matriz SPD
  [m,n]=size(A);
  %Construir L y U=L' usando la matriz Aux
  Aux = zeros(n,n)
  %Vamos a ir rellenando Aux por filas y columnas de forma alternada
  %La primera fila:
  Aux(1,1) = sqrt(A(1,1)); %L(1.1)=sqrt(A(1,1)) y U(1,1)=sqrt(A(1,1))
  if abs(Aux(1,1)) < 100*eps
    error("No hay factorización LL'");
  endif
  %Primera columna de L:
  Aux(2:n,1)=A(2:n,1)/Aux(1,1);%Coincide con la de L
  for k=2:n
    Aux(k,k)=A(k,k)-Aux(k,1:k-1)*Aux(k,1:k-1)';%U(k,k)=Aux(k,k)
    if abs(Aux(k,k))<100*eps
      error("No hay factorización LL'")
    endif
    Aux(k,k)=sqrt(Aux(k,k))
    %columna k desde fila k+1 de L):
    for r=k+1:n
      Aux(r,k)=(A(r,k)-Aux(r,1:k-1)*Aux(1:k-1,k))/Aux(k,k);%L(r,k)=Aux(r,k)
    endfor
  endfor
  L=tril(Aux);%L(i,j)=Aux(i,j) si i<=j
  x=linsolve(A,b);
  endfunction