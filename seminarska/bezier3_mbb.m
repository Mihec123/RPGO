function b = bezier3_mbb (Bx ,By ,Bz ,U)
% Opis :
% bezier3 izracuna tocke na trikotni Bezierjevi ploskvi
% Definicija:
%   b = bezier3 (Bx ,By ,Bz ,U)
% Vhodni podatki:
%   Bx , By , Bz matrike velikosti n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjeve krpe
%       ( element posamezne matrike na mestu (i,j),
%       j <= n+2-i, doloca koordinato kontrolne
%       tocke z indeksom (n+2-i-j, j -1, i -1)),
%   U matrika , v kateri vrstice predstavljajo
%       baricentricne koordinate tock glede na
%       domenski trikotnik , za katere racunamo
%       tocke na Bezierjevi krpi
% Izhodni podatek :
%   b matrika , v kateri vsaka vrstica predstavlja
%       tocko na Bezierjevi krpi pri istole?nih
%       parametrih iz matrike U


[n1,m1] = size(U);
[n,m] = size(Bx);

n = n-1;

b = zeros(n1,3);

Bx = MBB_poly_conv( Bx );
By = MBB_poly_conv( By );
Bz = MBB_poly_conv( Bz );

for i = 1:n1
    for k = 1:3
        if k == 1
            b(i,k) = MBB_alg(Bx,U(i,:));
        elseif k == 2
            b(i,k) = MBB_alg(By,U(i,:));
        else
            b(i,k) = MBB_alg(Bz,U(i,:));
        end
    end
end

end

