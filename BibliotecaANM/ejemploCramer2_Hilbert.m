clear all;
n=8;
fprintf(' \t n = %d',n);
fprintf('\n');

% Consulta en la documentacion de Octave/Matlab las definiciones 
% de las matrices de Hilbert  hilb(n) y sus inversas invhilb(n)
H=hilb(n);
Hinv=invhilb(n);
fprintf('H(n)* H^(-1)(n) = \n');
H*Hinv
%
b=zeros(1,n);
for i=1:n
  for j=1:n
    b(i)=b(i)+H(i,j);
  end
end
fprintf('\n Solucion Cramer \n \n');
tic;
x=solveCramer(H,b);
toc;
fprintf('solucion x');
x
res=b'- H*x';
fprintf('norma residual || b-Hx|| = %d',norm(res));
fprintf(' \n');
fprintf('\n Solucion Octave/Matlab \n \n');
tic;
xC= H\b';
toc;
x=xC';
fprintf('solucion x');
x
res=b'- H*x';
fprintf('norma residual || b-Hx|| = %d',norm(res));
fprintf(' \n');
% Perturbacion en termino independiente
fprintf("\n *** Perturbacion en termino independiente b1(i)= b(i)+/- epsilon \n ");
epsilon=0.5e-5;
b1=zeros(1,n);
signo=1;
for i=1:n
    b1(i)=b(i)+epsilon *signo;
    signo=-signo;
end

fprintf('\n Solucion Cramer \n \n');
tic;
x1=solveCramer(H,b1);
toc;
fprintf('solucion x1');
x1
res1=b1'- H*x1';
fprintf('norma residual || b1-H x1|| = %d',norm(res1));
fprintf(' \n');
fprintf('\n Solucion Octave/Matlab \n \n');
tic;
x1C= H\b1';
toc;
x1=x1C';
fprintf('solucion x1');
x1
res1=b1'- H*x1';
fprintf('norma residual || b1-Hx1|| = %d',norm(res1));
fprintf(' \n');