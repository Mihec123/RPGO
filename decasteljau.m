function D = decasteljau(b,t)
% Opis:
%   decasteljau  vrne  shemo  de  Casteljaujevega  postopka  za dan
%   seznam  koordinat b pri  danem  parametru t
%
% Definicija:
%   D = decasteljau(b,t)
%
% Vhodna  podatka:
%   b seznam  koordinat  kontrolnih  toèk  Bezierjeve  krivulje
% stopnje n,
%   t parameter , pri  katerem  raèunamo  koordinato
%Bezierjeve  krivulje
%
% Izhodni  podatek:
%   D tabela  velikosti n+1 x n+1, ki  predstavlja  de
%Casteljaujevo  shemo  za  koordinate b pri  parametru t
%(element  na  mestu (1,n+1) je  koordinata  Bezierjeve
%krivulje  pri  parametru t, elementi  na  mestih (i,j)
%za i > n-j+2 so NaN)

n = length(b)-1;
tabela = NaN(n+1,n+1,2);
for i=0:n
    tabela(1,i+1,:) = b(i+1,:);
end

for r = 1:n
    for i=0:n-r
        tabela(r+1,i+1,:) = (1-t)*tabela((r-1)+1,i+1,:) + t*tabela((r-1)+1,i+1+1,:);%stevilcenje se zacne pri 1 ne pri 0
    end
end

y = [tabela(n+1,1,1),tabela(n+1,1,2)];
    


end

