function [c0, U0] = MBB_rotation( c, U )
%   MBB_rotation permutira c in U.
% Vhodna  podatka:
%   c   celica  velikosti n+1 x n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  treh  spremenljivk  stopnje n v
%       modificirani Bernstein-Bezier  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   U   baricentricne koordinate toèke v kateri raèunamo vrednost polinoma
%
%   Izhodni  podatek:
%   c0 in U0 permutirana celica in vektor tako, da na njiju uporabimo
%   osnovno verzijo MMB_tetra


%TODO

end

