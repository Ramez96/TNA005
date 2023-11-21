function [avstandet] = nearMean(U, V)
b = reshape(U,1,256);
c = reshape(V,1,256);
avstandet = norm(b-c);
%[U,V] = svd(testDigits);

end

