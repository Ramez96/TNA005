function [bestMatch, place] = Klassi(S, RefSet, RefAns)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
place = 0;
loopSize = size(RefSet);
maxDiff = 10000;
bestMatch = 0;
for i = 1:loopSize(2)
    S2 = RefSet(:,:,i);
    length = Avstand(S,S2);
    if length < maxDiff
        maxDiff = length;
        bestMatch = RefAns(i,1);
        place = i;
    end
end
end

