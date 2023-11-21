clear;
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

test0 = medelavstand(z0)
test1 = medelavstand(z1)
test2 = medelavstand(z2)
test3 = medelavstand(z3)
test4 = medelavstand(z4)
test5 = medelavstand(z5)
test6 = medelavstand(z6)
test7 = medelavstand(z7)
test8 = medelavstand(z8)
test9 = medelavstand(z9)

