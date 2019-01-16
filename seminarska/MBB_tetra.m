function vr = MBB_tetra( M, U )
%   MBB_tetra  izraèuna  vrednost polinoma treh spremenljivk v modificirani
%   Bernstein-Bezier obliki
% Vhodna  podatka:
%   c   matrika  velikosti n+1 x n+1 x n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  treh  spremenljivk  stopnje n v
%       modificirani Bernstein-Bezier  obliki 
%   U   baricentricne koordinate tocke v kateri racunamo vrednost polinoma
%
%   Izhodni  podatek:
%   vr   vrednost  polinoma v baricentricnih koordinatah U

n = length(M);

% we permutate baricentric koordinates U a litle bit because we sum/multiply
% in sligthly different order than usual/golob.
U = permutateBBtoMBB(U); 

ru = U(1)/U(4);
su = U(2)/U(4);
tu = U(3)/U(4);

A = M(1,1,n);
for k = n-1:-1:1
    B = M(1,n+1-k,k);
    for j = n-k:-1:1
        C = M(n+2-k-j,j,k);
        for i = n+1-k-j:-1:1
            C = C * ru + M(i,j,k);
        end
        B = B * su + C;
    end
    A = A * tu + B;
end

vr = A * U(4)^(n-1);

