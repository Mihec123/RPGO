function b = vrednostZlepka( x,u,B)
% Opis:
%   izracunamo vrednost zlepka pri danem zlepku B, ter parametrizaciji u
%
% Definicija:
%   vr = vrednostZlepka( x,u,B)
%
% Vhod:
%   u seznam  parametrov  delitve  dol?ine m+1,
%   B celica , v kateri  vsaka  izmed matrik predstavlja enega od zlepkov
% 	x vrednost parametrizacije pri kateri racunamo vrednost zlepka
%       umin<x<umax
%
% Izhodni  podatek:
%   b tocka na zlepku krivulj dolocena s parametrom x


%dolocimo na katerem odseku smo
temp = u < x;
indeksi = find(temp == 1);
i = indeksi(end);
%nahajamo se na odesku (u_i,u_i+1) ter na B{i}-ti krivulji

K = B{i};

%reparametriziramo x
x1 = (x-u(i))/diff(u(i:i+1));
b = bezier(K,x1);
end

