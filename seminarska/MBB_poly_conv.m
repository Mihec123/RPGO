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


[n,m] = size(B);

m = m-1; %m == n

B_new = nan(n);

for i = 1:n
    for j = 1:m+2-i
        B_new(i,j) = factorial_divison(m,m+2-i-j,j-1,i-1)*B(i,j);
    end
end
      


end


function fact = factorial_divison( n,i,j,k )

%poiscemo najvecjo od stevil i,j,k

if i >= j && i >= k
    %i najvecji
    fact = prod([n:-1:i+1])/(factorial(j)*factorial(k));
    
    
elseif j >= i && j >=k 
    %j najvecji
    fact = prod([n:-1:j+1])/(factorial(i)*factorial(k));
    
else
    %k najvecji
    fact = prod([n:-1:k+1])/(factorial(j)*factorial(i));

end

end

