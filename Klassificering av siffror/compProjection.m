function [X,R,N] = compProjection(A,U)
% X contains solutions to the least squares problem
% R contains residuals when projected on the subspace 
% N contains norms of the residuals


[m n] = size(A);
[k l] = size(U);
X = zeros(l,n);
R = zeros(m,n);
N = zeros(n,1);

X = U'*A;
for i = 1:n
  R(:,i) = A(:,i) - U*X(:,i);
  N(i) = norm(R(:,i));
end