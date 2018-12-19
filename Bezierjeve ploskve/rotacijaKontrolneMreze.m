function [Bx1,By1,Bz1] = rotacijaKontrolneMreze( Bx,By,Bz,fi,os )
%rotacija kontrolne mreze za kot fi okoli osi os
%os = 1 okoli osi x, os = 2 y os, os =3 z os

% Opis:
%   rotacijaKontrolneMreze  vrne  kontrolne tocke mreze zarotirane okoli
%   osi os za kot fi v nasprotni smeri urinega kazalca
%
% Definicija:
%   [Bx1,By1,Bz1] = rotacijaKontrolneMreze( Bx,By,Bz,fi,os )
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   fi kot za katerega rotiramo okoli osi os v smeri urinega kazalca. Kot
%       je podan v stopinjah npr. 45 stopinj
%   os je vrednost 1,2 ali 3. Ce zelimo rotirati okoli osi x izberemo 1,
%       okoli osi y izberemo 2 in okoli osi z 3
%
% Izhodni  podatki:
%   Bx1 , By1, Bz1    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k rotiranih za kot fi


[n,m] = size(Bx);

if os == 1
    R = rotx(fi);
elseif os == 2
    R = roty(fi);
else
    R = rotz(fi);
end

Bx1 = Bx(:);
By1 = By(:);
Bz1 = Bz(:);

tocke = [Bx1';By1';Bz1'];
rotirane = R*tocke;
Bx1 = rotirane(1,:)';
By1 = rotirane(2,:)';
Bz1 = rotirane(3,:)';


Bx1 = reshape(Bx1,[n,m]);
By1 = reshape(By1,[n,m]);
Bz1 = reshape(Bz1,[n,m]);


end

