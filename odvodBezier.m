function b = odvodBezier(B,r,t)

% Vhodna  podatka:
%   B matrika  velikosti n+1 x d, ki  predstavlja  kontrolne
%to?ke  Bezierjeve  krivulje  stopnje n v
%d-dimenzionalnem  prostoru ,
%   t parameter pri katerem racunamo vrednost  odvoda Bezierjeve  krivulje

A = size(B);
d = A(1,2);
n = A(1,1)-1;
b = zeros(1,d);

for i=1:d
    temp = factorial(n)/factorial(n-r);
    D = decasteljauPosplosen(B(:,i),t,0,1);
    temp = temp * premaDiferenca(r,D(end-r,:));
    b(i) = temp;
end



end

