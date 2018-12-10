function [Bx1,By1,Bz1] = rotacijaKontrolneMreze( Bx,By,Bz,fi,os )
%rotacija kontrolne mreze za kot fi okoli osi os
%os = 1 okoli osi x, os = 2 y os, os =3 z os


[n,m] = size(Bx);

if os == 1
    R = rotx(fi);
elseif os == 2
    R = roty(fi);
else
    R = rotz(fi);
end

Bx1 = Bx(:);
By1 = By(:);
Bz1 = Bz(:);

tocke = [Bx1';By1';Bz1'];
rotirane = R*tocke;
Bx1 = rotirane(1,:)';
By1 = rotirane(2,:)';
Bz1 = rotirane(3,:)';


Bx1 = reshape(Bx1,[n,m]);
By1 = reshape(By1,[n,m]);
Bz1 = reshape(Bz1,[n,m]);


end

