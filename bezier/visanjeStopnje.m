function  Be = visanjeStopnje(B,k)
% Opis:
%   visanjeStopnje  izvede  visanje  stopnje  dane  Bezierjeve  krivulje
%
% Definicija:
%   Be = visanjeStopnje(B,k)
%
% Vhodna  podatka:
%   B matrika  velikosti (n+1) x d, v kateri  vsaka  vrstica
% predstavlja d-dimenzionalno  kontrolno  tocko
% Bezierjeve  krivulje  stopnje n,
%   k stevilo , ki doloca , za  koliko  zelimo  zvisati  stopnjo
% dane  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   Be    matrika  velikosti (n+k+1) x d, v kateri  vsaka
% vrstica  predstavlja d-dimenzionalno  kontrolno  tocko
% Bezierjeve  krvulje  stopnje n+k, ki  ustreza  dani
% Bezierjevi  krivulji

A = size(B);
n = A(1)-1;
d = A(2);
Be = zeros(n+2,d);
Be(1,:) = B(1,:);
Be(end,:) = B(end,:);
for i = 1:n
    Be(i+1,:) = (1-i/(n+1)).*B(i+1,:) + i/(n+1) .* B(i-1+1,:);
end

if k ~= 1
    Be = visanjeStopnje(Be,k-1);
end

end

