function [ db ] = PrviOdvodrBezier( B,w,t )
% Opis:
%   PrviOdvodrBezier  vrne  to?ko  na krivulji , ki  predstavlja  prvi odvod
%   dane  Bezierjeve  krivulje
%
% Definicija:
%   db = bezierder(B,r,t)
%
% Vhodni  podatki:
%   B matrika  kontrolnih  to?k  Bezierjeve  krivulje , v
%       kateri  vsaka  vrstica  predstavlja  eno  kontrolno
%       to?ko ,
%   w seznam  ute?i  racionalne  Bezierjeve  krivulje ,
%   t seznam  parameterov , pri  katerih  ra?unamo  odvod
%
% Izhodni  podatek:
%   db    matrika , v kateri  vsaka  vrstica  predstavlja  to?ko
%       prvega  odvoda  pri  istole?nem  parametru  iz  seznama t

[~,d] = size(B);
n = length(w)-1;
k = length(t);
db = zeros(k,d);

for h = 1:k
    wvr = 0;
    for i = 0:n
        wvr = wvr+w(i+1)*Bernstein(n,i,t(h));
    end

    wder = 0;
    for i = 0:n
        wder = wder+w(i+1)*Bernsteinder(n,i,t(h));
    end

    r = rbezier(B,w,t(h));

    pder = 0;
    for i = 0:n
        pder = pder + w(i+1).*B(i+1,:).*Bernsteinder(n,i,t(h));
    end

    db(h,:) = 1/wvr .* (pder - r.*wder);
end
    



end

