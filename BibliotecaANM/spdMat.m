function SPD = spdMat(n)
  % codigo para generar una matriz simetrica definida positiva
  % desde una simétrica A
  A=SymmetricMat(n);
  [P,D]=eig(A)
  D=abs(D)
  D=D+norm(D)*eye(size(D))
  SPD= P*D*P'
endfunction