function [ K ] = ekstrapolacija( B, t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

A = size(B);
n = A(1);
d = A(2);
K = zeros(n,d);
for i = 1:d
    D = decasteljau(B(:,i),t);
    K(:,i) = fliplr(D(sqrt(end):sqrt(end)-1:end-1));
    
end


end

