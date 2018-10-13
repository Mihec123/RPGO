function b = power2bernstein(p)
% Opis:
%   power2bernstein  pretvori  polinom , predstavljen s
%   koeficienti v poten?ni  bazi , v polinom , predstavljen
%   v Bernsteinovi  bazi
%
% Definicija:
%   b = power2bernstein(p)
%
% Vhodni  podatek:
%   p seznam  koeficientov  dol?ine n+1, ki po  vrsti
%pripadajo  razvoju  polinoma  stopnje n v poten?ni
%bazi od x^n do 1
%
% Izhodni  podatek:
%   b seznam  koeficientov  dol?ine n+1, ki po  vrsti
%pripadajo  razvoju  polinoma  stopnje n v Bernsteinovi
%bazi od 0-tega do n-tega  Bernsteinovega  baznega
%polinoma

n = length(p);
novi = zeros(1,n);
n = n-1;

p1 = fliplr(p);

for i=0:n
    for j=i:n
        novi(j+1) = novi(j+1) +  p1(i+1) * nchoosek(j,i)./nchoosek(n,i);
    end
end
        

b = novi;

end