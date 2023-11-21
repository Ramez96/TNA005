function [x] = Avstand(U, V)
b = reshape(U,1,256);
c = reshape(V,1,256);

x = norm(b-c);

end

