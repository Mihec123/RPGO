function d = odvod( B,smeri,stopnje,P)
% Opis:
%   odvod  izra?una  r-ti odvod polinoma dveh spremenljivk podanega 
%   v Bernsteinovi bazi glede na vektorje podane v matriki smeri, 
%   s pripadajocimi stopnjami iz matrike stopnje 
%
% Definicija:
%   d = odvod( B,smeri,stopnje,P)
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   smeri   matrika  velikosti max(1,?) x 3, v kateri  vrstice
%       predstavljavo  baricentri?ne  koordinate  vektorja  glede
%       na  domenski  trikotnik , glede na katerega zelimo racunati odvod
%   stopnje  matrika  velikosti 1 x max(1,?), kjer velja da sta max(1,?) iz
%       smeri in max(1,?) iz stopnje enaka. stopnje(i) pomeni da racunamo
%       odvod glede na vektor smeri(i,:) stopnje(i)-krat
%   P   matrika baricentricnih koordinat velikosti 1 x 3 predstavlja tocko 
%       v kateri zelimo izracunati odvod 
%
% Izhodni  podatek:
%   d   vrednost  odvoda  polinoma , dolo?enega z matriko B,
%       v to?ki P
% Primer:
%   T = [0 0;5 1;3 3];
%   B = [2 1 -1 0; 5 3 -4 NaN; 0 0 NaN NaN; 1 NaN NaN NaN];
%
%   x = [1 0];
%   Ux = vectorbary( x,T );
%
%   y = [0 1];
%   Uy = vectorbary( y,T );
%
%   Tocka = [4 2];
%   P = pointbary( P3,T );
%   dxy = odvod( B,[Ux;Uy],[1,1],[P])
%
%   v zgledu racunamo 1x odvod v smeri x = (1,0) in 1x odvod v smeri y = (0,1)
%   v tocki [4,2]
%

[n,m] = size(B);
n = n-1;
r = sum(stopnje);
[n1,m1] = size(stopnje);
if n1 ~= 1
    napis = 'nepravilna matrika stopenj';
    error(napis);
end
    
if r > n-1
    napis = 'prevelika stopnja odvoda';
    error(napis);
end

[n2,m2] = size(smeri);

if m1 ~= n2 || m2 ~= 3
    napis = 'matriki smeri in stopnje nista konsistentni';
    error(napis);
end




U = [];
for i = 1:length(stopnje)
    U = [U;repmat(smeri(i,:),[stopnje(i),1])];
end

U = [U; repmat(P,[n-r,1])];

b = blossom3(B,U);
d = factorial(n)/factorial(n-r) * b;
        



end

