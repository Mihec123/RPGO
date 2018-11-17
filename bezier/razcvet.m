function D = razcvet( b,t )
% Opis:
%   razcvet  vrne  shemo  de  Casteljaujevega  postopka  za dan
%   seznam  koordinat b pri  danih  parametrih t
%
% Definicija:
%   D = razcvet( b,t )
%
% Vhodna  podatka:
%   b seznam  koordinat  kontrolnih  to?k  Bezierjeve  krivulje
% stopnje n,
%   t tabela 1 x n parameterov , pri  katerih  ra?unamo  koordinato
%Bezierjeve  krivulje
%
% Izhodni  podatek:
%   D tabela  velikosti n+1 x n+1, ki  predstavlja  de
%Casteljaujevo  shemo  za  koordinate b pri  parametru t
%(element  na  mestu (1,n+1) je  koordinata  Bezierjeve
%krivulje  pri  parametru t, elementi  na  mestih (i,j)
%za i > n-j+2 so NaN)

n = length(b)-1;
D = NaN(n+1,n+1);
for i=0:n
    D(1,i+1) = b(i+1);
end

for r = 1:n
    for i=0:n-r
        D(r+1,i+1) = (1-t(r))*D((r-1)+1,i+1) + t(r)*D((r-1)+1,i+1+1);%stevilcenje se zacne pri 1 ne pri 0
    end
end

end

