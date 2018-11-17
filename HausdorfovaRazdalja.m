function r = HausdorfovaRazdalja(f,g)
% Opis:
%   HausdorfovaRazdalja  vrne  Hausdorfovo razdaljo med dvema parametricno
%   podanima krivuljama ter narise tocke pri katerih je razdalja najvecja
%   z rdeco in tocke pri katerih je razdalja najvecja gledano z vidika
%   krivulje, ki da manjso napako z zeleno
%   d(f,g) = max{max_t min_u ||f(t)-g(u)||,max_u min_t ||f(t)-g(u)||}
%
% Definicija:
%   r = HausdorfovaRazdalja(f,g)
%
% Vhodna  podatka:
%   f matrika  velikosti n x d, ki  predstavlja  vrednosti f pri neki
%   parametrizaciji
%   g matrika  velikosti m x d, ki  predstavlja  vrednosti g pri neki
%   parametrizaciji
%
% Izhodni  podatek:
%   r Hausdorfova razdalja med krivuljama


A = size(f);
B = size(g);
n = A(1);
d = A(2);
m = B(1);
d1 = B(2);

if d ~=d1
    display('error')
end

r1min = zeros(n,2);
for i =1:n
    min = Inf;
    for j = 1:m
        tempmin = norm(f(i,:)-g(j,:));
        if tempmin < min
            min = tempmin;
            r1min(i,2) = j;
        end
    end
    r1min(i,1) = min;
end
[r1,i1] = max(r1min(:,1));

r2min = zeros(m,2);

for i =1:m
    min = Inf;
    for j = 1:n
        tempmin = norm(f(j,:)-g(i,:));
        if tempmin < min
            min = tempmin;
            r2min(i,2) = j;
        end
    end
    r2min(i) = min;
end
[r2,i2] = max(r2min(:,1));

[r,i3] = max([r1,r2]);
if i3==1
    indeks1 = i1;
    indeks2 = r1min(i1,2);
    indeks4 = i2;
    indeks3 = r2min(i2,2);
    
else
    indeks2 = i2;
    indeks1 = r2min(i2,2);
    indeks3 = i1;
    indeks4 = r1min(i1,2);
    
end

figure;
hold on;
plot(f(:,1),f(:,2),'b');
plot(g(:,1),g(:,2),'k');
plot(f(indeks1,1),f(indeks1,2),'ro')
plot(g(indeks2,1),g(indeks2,2),'ro')
plot(f(indeks3,1),f(indeks3,2),'go')
plot(g(indeks4,1),g(indeks4,2),'go')
hold off;




end

