function b = bezier(B,t)
% Opis:
%   bezier  vrne  to?ke  na  Bezierjevi  krivulji  pri  danih
%   parametrih
%
% Definicija:
%   b = bezier(B,t)
%
% Vhodna  podatka:
%   B matrika  velikosti n+1 x d, ki  predstavlja  kontrolne
%to?ke  Bezierjeve  krivulje  stopnje n v
%d-dimenzionalnem  prostoru ,
%   t seznam  parametrov  dol?ine k, pri  katerih  ra?unamo
%vrednost  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   b matrika  velikosti k x d, kjer i-ta  vrstica
%predstavlja  to?ko  na  Bezierjevi  krivulji  pri
%parametru  iz t na i-tem  mestu


k = length(t);
A = size(B);
d = A(1,2);
b = NaN(k,d);

for i=1:k
    tocka = zeros(1,d);
    for j=1:d
        D = decasteljau(B(:,j),t(i));
        tocka(j) = D(end,1);
    end
    b(i,:)= tocka;
end

end

