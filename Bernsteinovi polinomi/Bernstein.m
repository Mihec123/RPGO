function y = Bernstein(n,i,x)
% Opis:
%   Bernstein  izracuna vrednost i tega bernsteinovega polinoma stopnje n
%   pri x
%
% Definicija:
%   y = Bernstein(n,i,x)
%
% Vhodni  podatek:
%   n stopnja bersteinovega polinoma
%   i indeks baznega polinoma
%   x vrednosti pri katerih racunamo
%
% Izhodni  podatek:
%   y vrednost i tega brensteinovega polinoma

y = nchoosek(n,i).*x.^i.*(ones(1,length(x))-x).^(n-i);



end

