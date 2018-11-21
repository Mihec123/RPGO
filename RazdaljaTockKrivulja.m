function r = RazdaljaTockKrivulja( T,f )
% Opis:
%   RazdaljaTockKrivulja  vrne razdaljo med mnozico tock T in parametricno
%   podano krivuljo f, ter narise tocke pri katerih je razdalja najvecja
%   z rdeco. 
%   d(T,f) = max_i min_t ||T(i,:)-f(t)||
%
% Definicija:
%   r = RazdaljaTockKrivulja( T,f )
%
% Vhodna  podatka:
%   f matrika  velikosti n x d, ki  predstavlja  vrednosti f pri neki
%   parametrizaciji
%   T matrika  velikosti m x d, ki  predstavlja  mnozico tock dimenzije d
%
% Izhodni  podatek:
%   r razdalja med najbolj oddaljeno tocko in krivuljo

A = size(f);
d = A(2);
n = A(1);
B = size(T);
if d ~= B(2)
    msg = 'napacna dimenzija'
    error(msg)
end
m = B(1);
razdalje = zeros(2,m);
for i=1:m
    min = Inf;
    j1 = 1;
    for j = 1:n
        temp = norm(T(i,:)-f(j,:));
        if temp < min
            min = temp;
            j1 = j;
            
        end
    end
    razdalje(1,i) = min;
    razdalje(2,i) = j1;
end

[r,ind] = max(razdalje(1,:));
j2 = razdalje(2,ind);
        
        
figure;
hold on;
plot(f(:,1),f(:,2),'b')
plot(T(:,1),T(:,2),'-o')
plot(T(ind,1),T(ind,2),'r*')
plot(f(j2,1),f(j2,2),'r*')
hold off;


end

