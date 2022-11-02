function s=solveCramer(A,b)
  N=size(A);
  if (N(1)~=N(2))
    error('Matriz A no cuadrada');
  elseif (N(1)~=length(b))
    error('dimensiones incompatibles');
  end
  s=zeros(1,N(1));
  denom=determinante(A);
  if (abs(denom)< 1e-12)
    error("Matriz singular");
  end
  for j=1:N(1)
    B=A;
    for i=1:N(1)
      B(i,j)=b(i);
    end
    %
    % Mas eficiente hacer B(:,j)=b;
    %
    s(j)=determinante(B)/denom;
  end
end
