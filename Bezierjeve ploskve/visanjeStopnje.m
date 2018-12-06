function [Bx1,By1,Bz1] = visanjeStopnje(Bx,By,Bz,param)
% Opis:
%   visanjeStopnje  zvisa stopnjo bezierjeve ploskve v dani smeri doloceni
%   s parametrom param
%
% Definicija:
%   [Bx1,By1,Bz1] = visanjeStopnje(Bx,By,Bz,param)
%
% Vhodni  podatki:
%   Bx , By, Bz    matrike  velikosti n+1 x m+1, ki  dolo?ajo
%       koordinate  kontrolnih  to?k ,
%   param 0/1 pove ali visamo stopnjo v u ali v smeri
%       0... visamo v v smeri
%       1... visamo v u smeri
%
% Izhodni  podatki:
%   Bx1 , By1, Bz1    matrike  velikosti n+1 x m+2 ce param 1 ali n+2 x m+1
%       ce param 0, ki  dolo?ajo koordinate  kontrolnih  to?k

A = size(Bx);
n = A(1)-1;
m = A(2)-1;


if param == 1
    %visamo stopnjo v u smeri
    Bx1 = zeros(n+1,m+2);
    By1 = zeros(n+1,m+2);
    Bz1 = zeros(n+1,m+2);
    
    for j = n+1:-1:1
        B = [Bx(j,:)',By(j,:)',Bz(j,:)'];
        Be = bezierelv(B,1);
        Bx1(j,:) = Be(:,1)';
        By1(j,:) = Be(:,2)';
        Bz1(j,:) = Be(:,3)';
    end
else
    Bx1 = zeros(n+2,m+1);
    By1 = zeros(n+2,m+1);
    Bz1 = zeros(n+2,m+1);
    for j = m+1:-1:1
        B = [Bx(:,j),By(:,j),Bz(:,j)];
        Be = bezierelv(B,1);
        Bx1(:,j) = Be(:,1);
        By1(:,j) = Be(:,2);
        Bz1(:,j) = Be(:,3);
    end
end
        
            



end

