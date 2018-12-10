function [bx,by,bz] =plotBezier2(Bx,By,Bz,u,v,kontrolni)
% Opis:
%   bezier2  vrne  to?ke  na  Bezierjevi  ploskvi  iz  tenzorskega
%   produkta in narise sliko
%
% Definicija:
%   [bx ,by,bz] = bezier2(Bx,By ,Bz,u,v)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   u, v vrstici  dol?ine M in N, ki  predstavljata
%       parametre v smereh u in v.
%   kontrolni true/false pove ali narisemo kontrolni poligon
%       ce ukaz spustimo narisemo kontrolni poligon
%
% Izhodni  podatki:
%   bx , by, bz    matrike  velikosti N x M, ki  predstavljajo
%       to?ke  na  Bezierjevi  ploskvi:
%       [bx(J,I) by(J,I) bz(J,I)] je  to?ka  pri
%       parametrih u(I) in v(J).

if nargin <6
    kontrolni = true;
end

[bx,by,bz] = bezier2(Bx,By,Bz,u,v);

figure;
hold on;
surf(bx,by,bz)
if kontrolni
    s = surf(Bx,By,Bz);
    set(s,'FaceColor','none')
end
zlabel('z-os')
xlabel('x-os')
ylabel('y-os')
hold off;

end
