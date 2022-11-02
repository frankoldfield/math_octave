function [L,U,X] = solveLUCompleto(A,b)
  [L,U] = LUdootlittle(A);
  X = solveLU(L,U,b);