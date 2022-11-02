function [L,U]=LUGaussSinPerm(A)
  [m,n]=size(A);
  if m ~= n
    error('dimensiones incompatibles');
  endif
  %
  for j=1:n-1
    piv=A(j,j);
    if (abs( piv) <1e-10 )
      warning('Gauss sin permutaciones: elemento nulo en diagonal');
    end
    for i=j+1:n
      A(i,j)=A(i,j)/piv;
      A(i,j+1:n)=A(i,j+1:n)-(A(i,j)*A(j,j+1:n));
    endfor
  endfor
  L=tril(A,-1)+eye(n);
  U=triu(A);
endfunction
