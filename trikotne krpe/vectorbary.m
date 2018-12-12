function U = vectorbary( vektor,T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


[n,m] = size(vektor);

M = [1 1 1;T(1,1) T(2,1) T(3,1); T(1,2) T(2,2) T(3,2)];

U = zeros(n,3);
for i = 1:n
    b = [0;vektor(i,1);vektor(i,2)]; %ker je vektor hocmo da u+w+v = 0
    U(i,:) = (M\b)';
end

end

