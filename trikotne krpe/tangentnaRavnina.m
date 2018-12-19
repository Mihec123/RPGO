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
% enacba matrika 1 x 4 v kateri so koeficienti enacbe ravnine v obliki
%       ax +by+cz =d (enacba = [ a, b ,c,d])

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

%enacba ravnine

V1 = Tocke(2,:) - Tocke(1,:);
V2 = Tocke(3,:) - Tocke(2,:);
koef = cross(V1,V2);
d = sum(koef.*Tocke(1,:));

enacba = [koef,d];


%narisemo

warning('slika je narisana glede na trikotnik podan s tockami (0,0) (1,0) (0,1)');
z = @(x,y) (enacba(4) - enacba(1)*x - enacba(2)*y)/enacba(3);
[Tri,U] = trimeshgrid(10);
b = bezier3(Bx,By,Bz,U);


figure;
hold on;
trisurf(Tri,b(:,1),b(:,2),b(:,3));
ezmesh(z);
plot3(Tocke(:,1),Tocke(:,2),Tocke(:,3),'ro')
hold off;
end

