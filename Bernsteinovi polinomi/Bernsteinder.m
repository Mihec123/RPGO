function y = Bernsteinder( n,i,x )
% Opis:
%   Bernstein  izracuna vrednost odvoda i tega bernsteinovega polinoma stopnje n
%   pri x
%
% Definicija:
%   y = Bernsteinder( n,i,x )
%
% Vhodni  podatek:
%   n stopnja bersteinovega polinoma
%   i indeks baznega polinoma
%   x vrednosti pri katerih racunamo
%
% Izhodni  podatek:
%   y vrednost odvoda i tega brensteinovega polinoma

if i == 0
    y = n*(-Bernstein(n-1,i,x));
elseif n == 0
    y = zeros(1,length(x));
    
elseif i > n-1
    y = n*Bernstein(n-1,i-1,x);
else
    y = n*(Bernstein(n-1,i-1,x)-Bernstein(n-1,i,x));
end

end

