function U = vectorbary( vektor,T )
% Opis :
% vectorbary izracuna baricentricne koordiante vektorja glede na trikotnik T
% Definicija:
%   U = pointbary( vektor,T )
% Vhodni podatki:
%   vektor matrika velikosti 1 x 2 ([x,y] koordinate)
%   T trikotnik podan z matriko velikosti 3 x 2 kjer vsaka vrstica
%       predstavlja ogljisce trikotnika v R^2
% Izhodni podatek :
%   U baricentricne koordinate vektorja


[n,m] = size(vektor);

M = [1 1 1;T(1,1) T(2,1) T(3,1); T(1,2) T(2,2) T(3,2)];

U = zeros(n,3);
for i = 1:n
    b = [0;vektor(i,1);vektor(i,2)]; %ker je vektor hocmo da u+w+v = 0
    U(i,:) = (M\b)';
end

end

