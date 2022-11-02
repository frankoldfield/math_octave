function fibn = fibonacci(n)
  fibn_1 = 0;
  fibn_2 = 1;
  fibn = fibn_1;
  k=1;
  while k <= n
    fibn = fibn_1 + fibn_2;
    fibn_2 = fibn_1;
    fibn_1 = fibn;
    k++;
  endwhile
  endfunction