function [ B1 ] = visanjeStopnje( B,k)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

A = size(B);
n = A(1)-1;
d = A(2);
B1 = zeros(n+1+k,d);

B1(1,:) = B(1,:);
B1(end,:) = B(end,:);

for i = 1:n+k-1
    temp = [0,0];
    for j = 0:n
        if i -j < 0 | i-j > k
            continue
        else
            temp = temp + B(j+1,:) .* nchoosek(n,j).* nchoosek(k,i-j) ./ nchoosek(n+k,i);              
    end
    B1(i+1,:) = temp;
    
end

end

