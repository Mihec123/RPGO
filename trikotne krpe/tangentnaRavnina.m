function [ Tocke,enacba ] = tangentnaRavnina( Bx,By,Bz,U )
% Opis :
% tangentnaRavnina izracuna tocke ki dolocajo tangentno ravnino glede na
% tocko U podano z baricentricnimi koordinatami
% Definicija:
%   [ Tocke,enacba ] = tangentnaRavnina( Bx,By,Bz,U )
% Vhodni podatki:
%   Bx , By , Bz matrike velikosti n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjeve krpe
%       ( element posamezne matrike na mestu (i,j),
%       j <= n+2-i, doloca koordinato kontrolne
%       tocke z indeksom (n+2-i-j, j -1, i -1)),
%   U baricentricne koordinate tocke v kateri iscemo tangentno ravnino
% Izhodni podatek :
% Tocke matrika 3 x 3 v kateri vsaka vrstica predstavlja eno tocko, ki
%       doloca tangentno ravnino
% enacba matrika 1 x 3 v kateri so koeficienti enacbe ravnine v obliki
%       z = a*x + b*y +c (enacba = [ a, b ,c])

Tocke = zeros(3,3);

[n,m] = size(Bx);
n =n-1;

for h = 1:3
    if h == 1
        B = Bx;
    elseif h == 2
        B = By;
    else
        B = Bz;
    end
    for r=n:-1:1
        for i = 1:r
            for j=1:r+1-i
                B(i,j) = U(1)*B(i,j) + U(2)*B(i,j+1) + U(3)*B(i+1,j);
            end        
        end
    end
    Tocke(1,h) = B(1,1);
    Tocke(2,h) = B(1,2);
    Tocke(3,h) = B(2,1);
end


temp = [ones(3,1), Tocke(:,1:2)] \ Tocke(:,3);
enacba = [temp(2) temp(1) temp(3)];
end

