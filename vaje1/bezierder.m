function  db = bezierder(B,r,t)
% Opis:
%   bezierder  vrne  toèke  na krivulji , ki  predstavlja  odvod
%   dane  Bezierjeve  krivulje
%
% Definicija:
%   db = bezierder(B,r,t)
%
% Vhodni  podatki:
%   B matrika  kontrolnih  toèk  Bezierjeve  krivulje , v
% kateri  vsaka  vrstica  predstavlja  eno  kontrolno
% toèko ,
%   r stopnja  odvoda , ki ga raèunamo ,
%   t seznam  parameterov , pri  katerih  raèunamo  odvod
%
% Izhodni  podatek:
%   db    matrika , v kateri  vsaka  vrstica  predstavlja  toèko
% r-tega  odvoda  pri  istoležnem  parametru  iz  seznama t

A = size(B);
d = A(1,2);
n = A(1,1)-1;
k = length(t);
db = zeros(k,d);

for i=1:d
    for j=1:k
        temp = factorial(n)/factorial(n-r);
        D = decasteljau(B(:,i),t(j));
        temp = temp * premaDiferenca(r,D(end-r,:));
        db(j,i) = temp;
    end
end



end

