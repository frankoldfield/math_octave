function  x = solveQR(Q,R,b)
  n=size(Q)
  ##Rx=Q'b
  B=Q'*b
  x=zeros(n,1);
  x(n,:)=B(n(1),:)/R(n(1),n(1));
  for k=n(1)-1:-1:1
    x(k,:)= (B(k,:)-R(k,k+1:n)*x(k+1:n(1),:))/R(k,k);
  end
endfunction