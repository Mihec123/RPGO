function [bx,by,bz] = bezier2(Bx ,By ,Bz,u,v)
% Opis:
%   bezier2  vrne  to?ke  na  Bezierjevi  ploskvi  iz  tenzorskega
%   produkta
%
% Definicija:
%   [bx ,by,bz] = bezier2(Bx,By ,Bz,u,v)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   u, v vrstici  dol?ine M in N, ki  predstavljata
%       parametre v smereh u in v.
%
% Izhodni  podatki:
%   bx , by, bz    matrike  velikosti N x M, ki  predstavljajo
%       to?ke  na  Bezierjevi  ploskvi:
%       [bx(J,I) by(J,I) bz(J,I)] je  to?ka  pri
%       parametrih u(I) in v(J).
addpath('..\bezier')

M = length(u);
N = length(v);
bx = zeros(N,M);
by = zeros(N,M);
bz = zeros(N,M);


for i = 1:M
    for j=1:N
        for k = 1:3
            if k== 1
                bx(j,i) = decasteljouPloskev(Bx,u(i),v(j));
            elseif k == 2
                by(j,i) = decasteljouPloskev(By,u(i),v(j));
            else
                bz(j,i) = decasteljouPloskev(Bz,u(i),v(j));
            end
        end
    end
end




end

