function [ C ] = BBtoMBB_tetra( B )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

d = length(B)-1;

for k=0:d
    for i=0:d-k
        for j=0:d-i-k
            B(i+1,j+1,k+1) = factorial(d)/(factorial(i)*factorial(j)*factorial(k)*factorial(d-i-j-k)) * B(i+1,j+1,k+1);
        end
    end
end

C = B;

end

