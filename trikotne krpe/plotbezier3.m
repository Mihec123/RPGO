function [U,b] = plotbezier3( Bx,By,Bz,d)
% Opis:
%  plotbezier3 izracuna in narise tocke bezierjeve krpe glede na trikotnik
%  z oglisci (0,0), (1,0), (0,1) in baricentricnimi koordinatami U
%  dobljenimi z metodo trimeshgrid
%
% Definicija:
%  [b] = plotbezier3( Bx,By,Bz,d)
%
% Vhodni podatek:
%  Bx , By , Bz matrike velikosti n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjeve krpe
%       ( element posamezne matrike na mestu (i,j),
%       j <= n+2-i, doloca koordinato kontrolne
%       tocke z indeksom (n+2-i-j, j -1, i -1)),
%  d    stevilo intervalov, na katere je razdeljena stranica trikotnika
%
% Izhodna podatka:
%  b matrika , v kateri vsaka vrstica predstavlja
%       tocko na Bezierjevi krpi pri istole?nih
%       parametrih iz matrike U
%  U matrika , v kateri vrstice predstavljajo
%       baricentricne koordinate tock glede na
%       domenski trikotnik , za katere racunamo
%       tocke na Bezierjevi krpi


[Tri,U] = trimeshgrid(d);


b = bezier3(Bx,By,Bz,U);

figure;
hold on;
trisurf(Tri,b(:,1),b(:,2),b(:,3));
%s = surf(Bx,By,Bz);
%set(s,'FaceColor','none')
hold off;


end

