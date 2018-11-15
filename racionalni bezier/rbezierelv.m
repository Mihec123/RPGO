function [Be,we] = rbezierelv(B,w)
% Opis:
%   rbezierelv  izvede  višanje  stopnje  dane  racionalne
%   Bezierjeve  krivulje
%
% Definicija:
%   [Be ,we] = rbezierelv(B,w)
%
% Vhodna  podatka:
%   B matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  toèko
% racionalne  Bezierjeve  krivulje  stopnje n,
%   w seznam  uteži  racionalne  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   Be    matrika  velikosti n+2 x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  toèko
% racionalne  Bezierjeve  krvulje  stopnje n+1, ki je
% prirejena  dani  racionalni  Bezierjevi  krivulji ,
%   we    seznam  dolžine n+2, v katerem  vsak  element
% predstavlja  utež  racionalne  Bezierjeve  krvulje
% stopnje n+1, ki je  prirejena  dani  racionalni
% Bezierjevi  krivulji

A = size(B);
d = A(2);
tocke = [];
for i=1:d
    tocke = [tocke w'.*B(:,i)];
end

tocke = [tocke w'];

Be1 = bezierelv(tocke,1);

we = Be1(:,end);
Be = [];
for i=1:d
    Be = [Be Be1(:,i)./we];
end




end

