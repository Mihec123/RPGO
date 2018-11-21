function p = bernstein2power(b)
% Opis:
%   bernstein2power  pretvori  polinom , predstavljen s
%   koeficienti v Bernsteinovi  bazi , v polinom , predstavljen
%   v potencni  bazi
%
% Definicija:
%   p = bernstein2power(b)
%
% Vhodni  podatek:
%   b seznam  koeficientov  dol?ine n+1, ki po  vrsti
%pripadajo  razvoju  polinoma  stopnje n v Bernsteinovi
%bazi od 0-tega do n-tega  Bernsteinovega  baznega
%polinoma
%
% Izhodni  podatek:
%   p seznam  koeficientov  dol?ine n+1, ki po  vrsti
%pripadajo  razvoju  polinoma  stopnje n v poten?ni
%bazi od x^n do 1


novi = zeros(1,length(b));
n = length(b)-1;
for i=0:n
    for j=i:n
        novi(j+1) = novi(j+1) + b(i+1)*(-1)^(i+j)*nchoosek(n,j)*nchoosek(j,i);
    end
end

p = fliplr(novi);
    

end

