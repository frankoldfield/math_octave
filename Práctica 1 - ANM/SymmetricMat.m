%%FUNCIÓN QUE DEVUELVE UNA MATRIZ SIMÉTRICA ALEATORIA

function sim = SymmetricMat(n)
  M = rand(n,n)
  T = tril(M)
  sim= T + T'
endfunction