%%FUNCIÓN PARA CALCULAR UNA MATRIZ M x N con entradas aleatorias en un intervalo [-p,p]
function chance = ChanceMat(m,n,p)
  if p<0
    p=-p;
  endif
  chance = -(p*ones(m,n)) + 2*p*rand(m,n);
endfunction