function U = pointbary( tocke,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n,m] = size(tocke);

M = [1 1 1;T(1,1) T(2,1) T(3,1); T(1,2) T(2,2) T(3,2)];

U = zeros(n,3);
for i = 1:n
    b = [1;tocke(i,1);tocke(i,2)];
    U(i,:) = (M\b)';
end

end

