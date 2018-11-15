function b = rdecasteljau(B,w,t)
% Opis:
%   rdecasteljau  vrne  toèko  na  racionalni  Bezierjevi
%   krivulji , ki je  izraèunana z de  Casteljaujevim
%   postopkom , prirejenim  za  racionalni  primer
%
% Definicija:
%   b = rdecasteljau(B,w,t)
%
% Vhodni  podatki:
%   B matrika , katere  vrstica  predstavlja  koordinate
% kontrolne  toèke  racionalne  Bezierjeve  krivulje ,
%   w seznam  uteži  racionalne  Bezierjeve  krivulje ,
%   t število , ki  doloèa  vrednost  delilnega  parametra v
% de  Casteljaujevem  postopku
%
% Izhodni  podatek:
%   b vrstica , ki  predstavlja  toèko  na  racionalni
% Bezierjevi  krivulji  pri  parametru t

A = size(B);
n1 = A(1);
n = n1-1;

B1 = NaN(n1);
W = NaN(n1);

for i=0:n
    B1(1,i+1) = B(i+1);
    W(1,i+1) = w(i+1);
end

for r = 1:n
    for i=0:n-r
        W(r+1,i+1) = (1-t)*W((r-1)+1,i+1) + t*W((r-1)+1,i+1+1);%stevilcenje se zacne pri 1 ne pri 0
    end
end

for r = 1:n
    for i=0:n-r
        B1(r+1,i+1) = (1-t)*W((r-1)+1,i+1)/W(r+1,i+1) * B1((r-1)+1,i+1) + t*W((r-1)+1,i+1+1)/W(r+1,i+1)*B1((r-1)+1,i+1+1);%stevilcenje se zacne pri 1 ne pri 0
    end
end

b = B1(end,1);







end

