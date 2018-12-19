function U = pointbary( tocke,T )
% Opis :
% pointbary izracuna baricentricne koordiante tocke glede na trikotnik T
% Definicija:
%   U = pointbary( tocke,T )
% Vhodni podatki:
%   tocke matrika velikosti 1 x 2 ([x,y] koordinate)
%   T trikotnik podan z matriko velikosti 3 x 2 kjer vsaka vrstica
%       predstavlja ogljisce trikotnika v R^2
% Izhodni podatek :
%   U baricentricne koordinate tocke


[n,m] = size(tocke);

M = [1 1 1;T(1,1) T(2,1) T(3,1); T(1,2) T(2,2) T(3,2)];

U = zeros(n,3);
for i = 1:n
    b = [1;tocke(i,1);tocke(i,2)];
    U(i,:) = (M\b)';
end

end

