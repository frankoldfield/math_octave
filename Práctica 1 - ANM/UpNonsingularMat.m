%%FUNCIÓN PARA CALCULAR UNA MATRIZ TRIANGULAR SUPERIOR NO SINGULAR ALEATORIA
function uptri = UpNonsingularMat(n)
  uptri = tril(NonsingularMat(n))';
endfunction