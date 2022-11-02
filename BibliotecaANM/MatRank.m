function [A,rA]=MatRank(m,n,r)
s=min(m,n);S=max(m,n);
%
% El rango r no puede ser mayor que s=min(n,m)
%
% Se genera un bloque sxs no singular.
% Se rellena con todas las entradas 1 
% hasta tener una matriz mxn 
% 
% Se reemplazan las columnas o filas desde 
% la r+1 hasta el final con un multiplo aleatorio de
% la fila o columna r. Asi se obtiene un bloque rxr 
% no singular en la matriz mxn y se quitan los 1
%
if r>min(m,n)
    fprintf("El rango no puede ser mayor que %i ",s);
    error("Error en la funcion MatRank ")
else
    %generamos bloque sxs no singular y se rellena 
    % con filas o columnas de 1 para tener una matriz mxn
    % Hay que cambiar filas o columnas de forma que sean 
    % linearmente independientes de la fila o columna r
    % y se mantenga un bloque rxr no singular. 
    % Esto se puede hacer por filas o por columnas, 
    % pero nos cambian los rangos donde se modifica
    %
    %fprintf("Bloque no singular talla min{n,m} \n ");
    A=NonsingularMat(s);% A es sxs no singular con s=min(m,n)
    if m>=n %mas filas que columnas
%         fprintf("Queremos mas filas que columnas \n ");
%         fprintf("Completamos filas con 1 \n ");
        A=[A;ones(S-s,s)]; %rellenamos filas que faltan con 1 (total de mxn)
          % Si r>s=n hemos terminado
         for k=r+1:S % desde la fila r+1 hasta el final las hacemos multiplo
                     % de la fila r
           A(k,:)=rand()*A(r,:);%Fila k, multiplo fila r 
                % Se mantiene las r primeras filas que siguen 
                % dando rango r
                % 
         end     
    else
%           fprintf("Queremos mas columnas que filas \n ");
%           fprintf("Completamos columnas con 1 \n");
        A=[A ones(s,S-s)]; %rellenamos columnas que faltan con 1 (total de mxn)

        for k=r+1:S % modificamos las columnas desde la r+1 hasta la n
                    % para camuflar los 1 manteniedo el rango r
           A(:,k)=rand()*A(:,r);% col k, multiplo col r
        end
    end
    rA=rank(A);
end
