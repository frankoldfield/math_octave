%
% Se obtiene el determinante de A desarrollando 
% por la fila primera de A.
%
function det=determinante(A)
  N=size(A);
  if (N(1)~=N(2))
    error('Matriz A no cuadrada');
  end
  if (N(1)==1)
    det=A(1,1);
  else 
      % N(1)>1
    det=0;
    B=A;
    B(1,:)=[];% quitamos la fila 1 de A
    for j=1:N(1)
     C=B;
     C(:,j)=[];% quitamos la columna j de C
     det=det + A(1,j)* (-1)^(1+j) * determinante(C);
    end
  end
end
