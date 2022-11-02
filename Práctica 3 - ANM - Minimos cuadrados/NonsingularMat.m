function A = NonsingularMat(n)
%
% Creacion de una matriz no singular
%
A=rand(n,n);
A=A+eye(n)*norm(A,'Inf');
end

