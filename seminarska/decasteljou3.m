function b = decasteljou3(B,u)
% Opis:
%   decasteljou3  izra?una  razcvet  polinoma  dveh  spremenljivk
%
% Definicija:
%   b = decasteljou3(B,U)
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   u   matrika  velikosti 1 x 3, ki
%       predstavlja  baricentri?ne  koordinate  to?ke  glede
%       na  domenski  trikotnik
%
% Izhodni  podatek:
%   b   vrednost polinoma , dolo?enega z matriko B,
%       v to?ki u

[n,~] = size(B);
n =n-1;

for r=n:-1:1
    for i = 1:r
        for j=1:r+1-i
            B(i,j) = u(1)*B(i,j) + u(2)*B(i,j+1) + u(3)*B(i+1,j);
        end        
    end
end

b = B(1,1);

end


