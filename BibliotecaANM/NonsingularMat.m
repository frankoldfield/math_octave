%%Función para devolver una matriz real no singular nxn
function A = NonsingularMat(n)
  B = rand(n,n);
    while (determinante(B) == 0)
      B = rand(n,n);
    endwhile
     A = B
endfunction