%%FUNCIÓN PARA CALCULAR UNA MATRIZ TRIANGULAR INFERIOR NO SINGULAR
function lowtri = LowNonsingularMat(n)
  lowtri = tril(NonsingularMat(n))
endfunction