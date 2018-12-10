function [ b ] = PosplosenaDiff( B,r,s )
% Opis:
%   PosplosenaDiff  izracuna posploseno diferenco \Delta^{r,s}
%   definirano na matriki vrednosti
%   \Delta^{r,s} b_{i,j} = \Delta^{r-1,s-1} b_{i+1,j+1} - \Delta^{r-1,s-1} b_{i+1,j}
%                           - \Delta^{r-1,s-1} b_{i,j+1} + \Delta^{r-1,s-1} b_{i,j}
%   in v posebnih primerih
%   \Delta^{r,0} b_{i,j} = \Delta^{r-1,0} b_{i+1,j} - \Delta^{r-1,0} b_{i,j}
%   \Delta^{0,s} b_{i,j} = \Delta^{0,s-1} b_{i,j+1} - \Delta^{0,s-1} b_{i,j}
%
% Definicija:
%   [ b ] = PosplosenaDiff( B,r,s )
%
% Vhodni  podatki:
%   B matrika velikosti max{r,1} x max{s,1}
%   r, s parametra diference glej definicijo
%
% Izhodni  podatki:
%   b  vrednost diference

if s== 0 && r == 0
    b = B;
elseif s == 0
    b = diff(B,r);
elseif r == 0
    b = diff(B,s);
else
    b = PosplosenaDiff( B(2:end,2:end),r-1,s-1 )-PosplosenaDiff( B(2:end,1:end-1),r-1,s-1 )-...
        PosplosenaDiff( B(1:end-1,2:end),r-1,s-1 )+PosplosenaDiff( B(1:end-1,1:end-1),r-1,s-1 );
end



end

