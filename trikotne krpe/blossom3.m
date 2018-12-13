function b = blossom3(B,U)
% Opis:
%   blossom3  izra?una  razcvet  polinoma  dveh  spremenljivk
%
% Definicija:
%   b = blossom3(B,U)
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   u   matrika  velikosti n x 3, v kateri  vrstice
%       predstavljavo  baricentri?ne  koordinate  to?k  glede
%       na  domenski  trikotnik , za  katere  izvajamo  razcvet
%       polinoma
%
% Izhodni  podatek:
%   b   vrednost  razcveta  polinoma , dolo?enega z matriko B,
%       v to?kah , dolo?enih z matriko u

[n,m] = size(B);
n =n-1;

for r=n:-1:1
    for i = 1:r
        for j=1:r+1-i
            B(i,j) = U(r,1)*B(i,j) + U(r,2)*B(i,j+1) + U(r,3)*B(i+1,j);
        end        
    end
end

b = B(1,1);

end

