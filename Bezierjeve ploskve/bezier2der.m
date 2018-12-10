function [ bx,by,bz,Bxd,Byd,Bzd ] = bezier2der(Bx,By,Bz,r,s,u,v)
% Opis:
%   bezier2der  vrne  to?ke  r-tega parcialnega odvoda po u
%   in s-tega parcialnega odvoda po v Bezierjeve  ploskve  iz  tenzorskega
%   produkta
%
% Definicija:
%   [ bx,by,bz,Bxd,Byd,Bzd ] = bezier2der(Bx,By,Bz,r,s,u,v)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   u, v vrstici  dol?ine M in N, ki  predstavljata
%       parametre v smereh u in v.
%   r stopnja parcialnega odvoda po parametru u
%   s stopnja parcialnega odvoda po parametru v
%
% Izhodni  podatki:
%   bx , by, bz    matrike  velikosti N x M, ki  predstavljajo
%       to?ke  na  Bezierjevi  ploskvi:
%       [bx(J,I) by(J,I) bz(J,I)] je  to?ka  pri
%       parametrih u(I) in v(J).
%   Bxd,Byd,Bzd matrike velikosti n+1-s x m+1-r, ki predstavljajo kontrolne
%   tocke odvoda

[n,m] = size(Bx);
m = m-1;
n = n-1;

Bxd = zeros(n+1-s,m+1-r);
Byd = zeros(n+1-s,m+1-r);
Bzd = zeros(n+1-s,m+1-r);

for i = 0:m-r
    for j = 0:n-s
        Bxd(j+1,i+1) = PosplosenaDiff( Bx(j+1:j+1+s,i+1:i+1+r),r,s );
        Byd(j+1,i+1) = PosplosenaDiff( By(j+1:j+1+s,i+1:i+1+r),r,s );
        Bzd(j+1,i+1) = PosplosenaDiff( Bz(j+1:j+1+s,i+1:i+1+r),r,s );
    end
end

skalar = factorial(m)*factorial(n)/(factorial(m-r)*factorial(n-s));

Bxd = skalar * Bxd;
Byd = skalar * Byd;
Bzd = skalar * Bzd;


[bx,by,bz] = bezier2(Bxd ,Byd ,Bzd,u,v);


end

