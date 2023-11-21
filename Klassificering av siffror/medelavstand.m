function [variabel] = medelavstand(siffra)

variabel = zeros(16,16)

for i = 1:size(siffra,3)
    variabel(:,:) = siffra(:,:,i) + variabel(:,:);
end

   variabel = variabel(:,:)./size(siffra,3)

end