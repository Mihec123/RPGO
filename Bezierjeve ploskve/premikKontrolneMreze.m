function [ Bx1,By1,Bz1 ] = premikKontrolneMreze( Bx,By,Bz,vektor )
% Opis:
%   premikKontrolneMreze  vrne  kontrolne tocke mreze premaknjene za vektor
%
% Definicija:
%   [ Bx1,By1,Bz1 ] = premikKontrolneMreze( Bx,By,Bz,vektor )
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   vektor je matrika velikosti 1 x 3 kjer mesta predstavljajo koordinate
%       vektorja
%
% Izhodni  podatki:
%   Bx1 , By1, Bz1    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k premaknjenih za vektor

[n,m] = size(Bx);

Bx1 = Bx(:);
By1 = By(:);
Bz1 = Bz(:);

tocke = [Bx1';By1';Bz1'];

for i = 1:n*m
    tocke(:,i) = tocke(:,i) + vektor';
end

Bx1 = tocke(1,:)';
By1 = tocke(2,:)';
Bz1 = tocke(3,:)';


Bx1 = reshape(Bx1,[n,m]);
By1 = reshape(By1,[n,m]);
Bz1 = reshape(Bz1,[n,m]);


end

