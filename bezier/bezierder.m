function  [db,K] = bezierder(B,r,t)
% Opis:
%   bezierder  vrne  to?ke  na krivulji , ki  predstavlja  odvod
%   dane  Bezierjeve  krivulje
%
% Definicija:
%   db = bezierder(B,r,t)
%
% Vhodni  podatki:
%   B matrika  kontrolnih  to?k  Bezierjeve  krivulje , v
% kateri  vsaka  vrstica  predstavlja  eno  kontrolno
% to?ko ,
%   r stopnja  odvoda , ki ga ra?unamo ,
%   t seznam  parameterov , pri  katerih  ra?unamo  odvod
%
% Izhodni  podatek:
%   db    matrika , v kateri  vsaka  vrstica  predstavlja  to?ko
% r-tega  odvoda  pri  istole?nem  parametru  iz  seznama t

A = size(B);
d = A(1,2);
n = A(1,1)-1;
k = length(t);
db = zeros(k,d);
%poracunamo kontrolne tocke
K = zeros(A(1)-r,A(2));
for i = 1:A(2)
    K(:,i) = factorial(n)/factorial(n-r)*diff(B(:,i),r);
end


for i=1:d
    for j=1:k
        temp = factorial(n)/factorial(n-r);
        D = decasteljau(B(:,i),t(j));
        temp = temp * diff(D(end-r,1:r+1),r);
        db(j,i) = temp;
    end
end

if A(2) == 2
    figure;
    hold on;
    plot(db(:,1),db(:,2))
    plot(K(:,1),K(:,2),'k-o','LineWidth',1)
    hold off;
end


end

