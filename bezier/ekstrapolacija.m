function K  = ekstrapolacija( B, t)
% Opis:
%   ekstrapolacija vrne kontrolne tocke bezierjeve krivulje glede na
%   interval [1,t]
%
% Definicija:
%   K = ekstrapolacija( B, t)
%
% Vhodna  podatka:
%   B seznam  koordinat  kontrolnih  to?k  Bezierjeve  krivulje
% stopnje n,
%   t parameter ki doloca interval [1,t] parametrizacije 
%
% Izhodni  podatek:
%   K tabela  velikosti n+1 x d, ki  predstavlja 
%   koordinat  kontrolnih  to?k  Bezierjeve  krivulje na intervalu [1,d]


A = size(B);
n = A(1);
d = A(2);
K = zeros(n,d);
for i = 1:d
    D = decasteljau(B(:,i),t);
    K(:,i) = fliplr(D(sqrt(end):sqrt(end)-1:end-1));
    
end


end

