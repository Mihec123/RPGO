function d = odvod( B,U,r)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here


[n,m] = size(B);


b = blossom3(B,U);
d = factorial(n)/factorial(n-r) * b;
        



end

