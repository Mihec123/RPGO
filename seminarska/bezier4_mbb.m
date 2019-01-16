function b = bezier4_mbb (Bx ,By ,Bz, Bt ,U)
% Opis :
% bezier4 izracuna tocke na Bezierjevim prostorom nad tetraedrom.
% Definicija:
%   b =
% Vhodni podatki:
%   Bx , By , Bz , Bt celice velikosti n+1 x n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjevega prostora
%       ( element posamezne celice na mestu (i,j,k),
%       doloca koordinato kontrolne
%       tocke z indeksom (?,?,?,?),
%   U matrika , v kateri vrstice predstavljajo
%       baricentricne koordinate tock glede na
%       domenski trikotnik , za katere racunamo
%       tocke na Bezierjevi krpi
% Izhodni podatek :
%   b matrika , v kateri vsaka vrstica predstavlja
%       tocko na Bezierjevi krpi pri istole?nih
%       parametrih iz matrike U


[n_tock,~] = size(U);

b = zeros(n_tock,4);

B = cell(4,1);
B{1} = BBtoMBB_tetra( Bx );
B{2} = BBtoMBB_tetra( By );
B{3} = BBtoMBB_tetra( Bz );
B{4} = BBtoMBB_tetra( Bt );

for i = 1:n_tock
    for k = 1:4
        b(i,k) = MBB_tetra(B{k},U(i,:));
    end
end

end

