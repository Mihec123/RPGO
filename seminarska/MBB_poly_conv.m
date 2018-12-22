function B_new = MBB_poly_conv( B )
% Opis:
%   MBB_poly_conv pretvori koeficiente polinoma dvhe spremenljivk iz
%   Bernsteinove v modificirano Bernstein-Bezierjevo obliko
%
% Definicija:
%   B_new = MBB_poly_conv( B )
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       Bezierjevi  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
% Izhodni  podatek:
%   B_new   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       MBB  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),


% Opis:
%   MBB_alg  izra?una  vrednost polinoma dveh spremenljivk v modificirani
%   Bernstein-Bezier obliki
%
% Definicija:
%    vr  = MBB_alg(B, U)
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       modificirani Bernstein-Bezier  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   U   baricentricne koordinate tocke v kateri racunamo vrednost polinoma
%
% Izhodni  podatek:
%   vr   vrednost  polinoma v baricentricnih koordinatah U

[n,m] = size(B);

m = m-1; %m == n

B_new = nan(n);

for i = 1:n
    for j = 1:m+2-i
        B_new(i,j) = factorial(m)/(factorial(m+2-i-j)*factorial(j-1)*factorial(i-1))*B(i,j);
    end
end
        
        







end

