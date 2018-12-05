function vr = decasteljouPloskev(B,u,v)
%B matrika velikosti m+1 x n+1 (za vsako kontrolno tocko mreze povemo izbrano koordinato npr x)
% [1 1 1;0 0 0] bi bila kontorlna mreza 2x3
%u in v parametra pri katerih racunamo

A = size(B);
n = A(1)-1;
m = A(2)-1;
novetocke = zeros(m+1,1);

for i = 0:m
    tocke = B(:,i+1)';
    D = decasteljau(tocke,v);
    novetocke(i+1) = D(end,1);
end

D = decasteljau(novetocke,u);
vr = D(end,1);
    
    




end


