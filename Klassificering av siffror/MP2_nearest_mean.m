clear;
load uspsDigits

z0 = zeros(16);
% z1 = zeros(16);
% z2 = zeros(16);
% z3 = zeros(16);
% z4 = zeros(16);
% z5 = zeros(16);
% z6 = zeros(16);
% z7 = zeros(16);
% z8 = zeros(16);
% z9 = zeros(16);

for i = 1:2007
    switch testAns(i)
%         case 0
%             z0(:,:,end+1)=testAns(:,:,i);
        case 1
            z1(:,:,i)=testDigits(:,:,i);
%         case 2
%             z2(:,:,end+1)=trainDigits(:,:,i);
%         case 3
%             z3(:,:,end+1)=trainDigits(:,:,i);
%         case 4
%             z4(:,:,end+1)=trainDigits(:,:,i);
%         case 5
%             z5(:,:,end+1)=trainDigits(:,:,i);
%         case 6
%             z6(:,:,end+1)=trainDigits(:,:,i);
%         case 7
%             z7(:,:,end+1)=trainDigits(:,:,i);
%         case 8
%             z8(:,:,end+1)=trainDigits(:,:,i);
%         case 9
%             z9(:,:,end+1)=trainDigits(:,:,i);
    end
end

%Medel siffra f�r varje klass
% test0 = medelavstand(z0)
test1 = medelavstand(z1)
% test2 = medelavstand(z2)
% test3 = medelavstand(z3)
% test4 = medelavstand(z4)
% test5 = medelavstand(z5)
% test6 = medelavstand(z6)
% test7 = medelavstand(z7)
% test8 = medelavstand(z8)
% test9 = medelavstand(z9)

%tomma matriser
% answer_0 = zeros(16, 16);
answer_1 = zeros(16, 16);
% answer_2 = zeros(16, 16);
% answer_3 = zeros(16, 16);
% answer_4 = zeros(16, 16);
% answer_5 = zeros(16, 16);
% answer_6 = zeros(16, 16);
% answer_7 = zeros(16, 16);
% answer_8 = zeros(16, 16);
% answer_9 = zeros(16, 16);

for i = 1:size(testDigits, 3)
%     a = Avstand(testDigits(:,:,i), test0)
%     if a <= 5.3
%          answer_0(:,:,i) = testDigits(:,:,i);
%     end
    b = Avstand(testDigits(:,:,i), test1)
        if b <= 4.5
         answer_1(:,:,i) = testDigits(:,:,i);
    end
%     c = Avstand(testDigits(:,:,i), test2)
%         if c <= 5.3
%          answer_2(:,:,i) = testDigits(:,:,i);
%     end
%     d = Avstand(testDigits(:,:,i), test3)
%         if d <= 5.3
%          answer_3(:,:,i) = testDigits(:,:,i);
%     end
%     e = Avstand(testDigits(:,:,i), test4)
%         if e <= 5.3
%          answer_4(:,:,i) = testDigits(:,:,i);
%     end
%     f = Avstand(testDigits(:,:,i), test5)
%         if f <= 5.3
%          answer_5(:,:,i) = testDigits(:,:,i);
%     end
%     g = Avstand(testDigits(:,:,i), test6)
%         if g <= 5.3
%          answer_6(:,:,i) = testDigits(:,:,i);
%     end
%     h = Avstand(testDigits(:,:,i), test7)
%         if h <= 5.3
%          answer_7(:,:,i) = testDigits(:,:,i);
%     end
%     j = Avstand(testDigits(:,:,i), test8)
%         if j <= 5.3
%          answer_8(:,:,i) = testDigits(:,:,i);
%     end
%     k = Avstand(testDigits(:,:,i), test9)
%     if k <= 5.3
%          answer_9(:,:,i) = testDigits(:,:,i);
%     end
end

for i = 1:size(answer_1, 3)
    if mean(mean(answer_1(:,:,i))) > 0
      ima(answer_1(:,:,i));
      pause(0.2);
    end
end

