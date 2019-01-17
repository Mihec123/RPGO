function b = bezier4 (Bx ,By ,Bz, Bt ,U)
% Opis :
% bezier4 izracuna tocke na trikotni Bezierjevi ploskvi
% Definicija:
%   b = bezier3 (Bx ,By ,Bz, Bt ,U)
% Vhodni podatki:
%   Bx , By , Bz, Bt matrike velikosti n+1 x n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjeve krpe
%      // B(1,1,1)=b_n000, B(1,2,1)=b_(n-1)100, ...
%   U matrika , v kateri vrstice predstavljajo
%       baricentricne koordinate tock glede na
%       domenski trikotnik , za katere racunamo
%       tocke na Bezierjevi krpi
% Izhodni podatek :
%   b matrika , v kateri vsaka vrstica predstavlja
%       tocko na Bezierjevi krpi pri istoležnih
%       parametrih iz matrike U


l = length(U(:,1));

b = zeros(l,4);

for i = 1:l
    tmp_u = U(i,:);
    tmp_x = decasteljau4(Bx,tmp_u);
    tmp_y = decasteljau4(By,tmp_u);
    tmp_z = decasteljau4(Bz,tmp_u);
    tmp_t = decasteljau4(Bt,tmp_u);
    b(i,:) = [tmp_x tmp_y tmp_z tmp_t];
end

end
