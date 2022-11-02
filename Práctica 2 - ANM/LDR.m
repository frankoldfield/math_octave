function  [L,D,R] = LDR(A)
  [m,n]=size(A);
  if m ~= n
    error('dimensiones incompatibles');
  endif
  [L,R] = LUdootlittle(A);
  D = diag(diag(R));
  for i=1:m
    for j=(i):n
      R(i,j)=R(i,j)/D(i,i);
    endfor
  endfor
endfunction