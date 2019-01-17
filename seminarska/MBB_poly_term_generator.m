function K = MBB_poly_term_generator( n )
% Opis:
%   MBB_poly_term_generator naredi matriko z vrednostmi potrebnimi pri
%   pretvorbi iz BB v MBB obliko. Uporabimo jih tako da mnozimo po
%   komponentah z matriko koeficientov.
%
% Definicija:
%   B_new = MBB_poly_term_generator( n )
%
% Vhodna  podatka:
%   n   stopnja polinoma
% Izhodni  podatek:
%   K   matrika  velikosti n+1 x n+1, ki  predstavlja
%       fakultete  polinoma  dveh  spremenljivk  stopnje n v
%       MBB  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),

K = nan(n+1);

for i = 1:n+1
    for j = 1:n+2-i
        K(i,j) = factorial_divison(n,n+2-i-j,j-1,i-1);
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

