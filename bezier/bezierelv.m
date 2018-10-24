function  Be = bezierelv(B,k)
% Opis:
%   bezierelv  izvede  visanje  stopnje  dane  Bezierjeve  krivulje
%
% Definicija:
%   Be = bezierelv(B,k)
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
Be = zeros(n+1+k,d);

Be(1,:) = B(1,:);
Be(end,:) = B(end,:);

for i = 1:n+k-1
    temp = [0,0];
    for j = 0:n
        if i -j < 0 | i-j > k
            continue
        else
            temp = temp + B(j+1,:) .* nchoosek(n,j).* nchoosek(k,i-j) ./ nchoosek(n+k,i);              
    end
    Be(i+1,:) = temp;
    
end


end

