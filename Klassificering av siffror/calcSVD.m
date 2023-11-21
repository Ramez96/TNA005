function [U, S, V] = calcSVD(trainDigits, trainAns)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:size(trainAns(1))
    [U, S, V] = svd(trainDigits')
end
end