function r = parametricnaRazdalja( f,g )
% Opis:
%   parametricnaRazdalja  vrne  parametricno razdaljo med dvema parametricno
%   podanima krivuljama ter narise tocke pri katerih je razdalja najvecja
%   z rdeco. 
%   d(f,g) = inf_fi max_t ||f(t)-g(fi(t))||
%   Fi smatramo kot da je ze upostevan pri eni od krivulj g ali f
%   Tako v resnici racunamo le
%   d(f,g) = max_t ||f(t)-g(fi(t))||
%
% Definicija:
%   r = parametricnaRazdalja( f,g )
%
% Vhodna  podatka:
%   f matrika  velikosti n x d, ki  predstavlja  vrednosti f pri neki
%   parametrizaciji
%   g matrika  velikosti n x d, ki  predstavlja  vrednosti g pri isti
%   parametrizaciji (f ali g moramo po potrebi reparametrizirati na isto)
%
% Izhodni  podatek:
%   r parametricna razdalja med krivuljama

A = size(f);
B = size(g);
n = A(1);
d = A(2);
m = B(1);
d1 = B(2);

if d ~=d1 || m~=n
    display('error')
end

max = 0;
for i =1:n
    tempmax = norm(f(i,:)-g(i,:));
    if tempmax > max
        max = tempmax;
        indeks = i;
    end
end

r = max;

figure;
hold on;
plot(f(:,1),f(:,2),'b');
plot(g(:,1),g(:,2),'k');
plot(f(indeks,1),f(indeks,2),'ro')
plot(g(indeks,1),g(indeks,2),'ro')
hold off;




end

