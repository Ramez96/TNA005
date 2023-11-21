load uspsDigits
trainSize = size(testDigits,3);
verifiedCount = 0;
failCount = 0;
testDigitsPos = 0;
testAnsPos = 0;
failTestDigits = 0;
failTestDigitsPos = 0;
failTestDigitsAnsPos = 0;

for i = 1:trainSize
    [match, pos] = Klassi(trainDigits(:,:,i),testDigits,testAns);
    if match == testAns(i)
        verifiedCount = verifiedCount + 1;
        testDigitsPos(1,verifiedCount) = i;
        testAnsPos(1,verifiedCount) = pos;
    else
        failCount = failCount + 1;
        failTestDigits(1,failCount) = testAns(i);
        failTestDigitsPos(1,failCount) = i;
        failTestDigitsAnsPos(1,failCount)=pos;
        failFormat = 'Test Digit %i is %i but matched with %i \n';
        fprintf(failFormat, i,testAns(i,1),match)
    end
end


% for i = 1:trainSize
%     [match, pos] = Klassi(trainDigits(:,i), testDigits,testAns);
%     if match == trainAns(i)
%         verfiedCount = verifiedCount + 1;
%         classifiedpos(1, verfiedCount) = i;
%         classifiedanspos(1, verfiedCount) = pos;
%     else
%         failCount = failCount+1;
%         missClassified(1, failCount) = trainAns(i);
%         missClassifiedpos(1,failCount) = i;
%         missClassifiedanspos(1,failCount) = pos;
%         failFormat = 'Test digit %i is %i but matched with %i.\n';
%         fprintf(failFormat,i,trainAns(i),match)
%     end
% end

        
