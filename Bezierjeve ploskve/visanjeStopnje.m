function [X1,Y1,Z1] = visanjeStopnje(X,Y,Z,param)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

A = size(X);
n = A(1)-1;
m = A(2)-1;


if param == 1
    %visamo stopnjo v u smeri
    X1 = zeros(n+1,m+2);
    Y1 = zeros(n+1,m+2);
    Z1 = zeros(n+1,m+2);
    
    for j = n+1:-1:1
        B = [X(j,:)',Y(j,:)',Z(j,:)'];
        Be = bezierelv(B,1);
        X1(j,:) = Be(:,1)';
        Y1(j,:) = Be(:,2)';
        Z1(j,:) = Be(:,3)';
    end
else
    X1 = zeros(n+2,m+1);
    Y1 = zeros(n+2,m+1);
    Z1 = zeros(n+2,m+1);
    for j = m+1:-1:1
        B = [X(:,j),Y(:,j),Z(:,j)];
        Be = bezierelv(B,1);
        X1(:,j) = Be(:,1);
        Y1(:,j) = Be(:,2);
        Z1(:,j) = Be(:,3);
    end
end
        
            



end

