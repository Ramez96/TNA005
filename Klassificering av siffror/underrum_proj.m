load uspsDigits

z0 = zeros(16);
z1 = zeros(16);
z2 = zeros(16);
z3 = zeros(16);
z4 = zeros(16);
z5 = zeros(16);
z6 = zeros(16);
z7 = zeros(16);
z8 = zeros(16);
z9 = zeros(16);

for i = 1:7291
    switch trainAns(i)
        case 0
            z0(:,:,end+1)=trainDigits(:,:,i);
        case 1
            z1(:,:,end+1)=trainDigits(:,:,i);
        case 2
            z2(:,:,end+1)=trainDigits(:,:,i);
        case 3
            z3(:,:,end+1)=trainDigits(:,:,i);
        case 4
            z4(:,:,end+1)=trainDigits(:,:,i);
        case 5
            z5(:,:,end+1)=trainDigits(:,:,i);
        case 6
            z6(:,:,end+1)=trainDigits(:,:,i);
        case 7
            z7(:,:,end+1)=trainDigits(:,:,i);
        case 8
            z8(:,:,end+1)=trainDigits(:,:,i);
        case 9
            z9(:,:,end+1)=trainDigits(:,:,i);
    end
end

for i = 1:size(z0(3))
[U, S, V] = calcSVD(z0(:, :, 3), z0)
end


P1 = U(:,1)*(S(1,1)*V(:,1))';
P1 = P1';



