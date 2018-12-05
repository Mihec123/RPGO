%vaje6
addpath('U:\RPGO\bezier')
addpath('U:\RPGO\Bernsteinovi polinomi')

Bx = [0 3 5 6;1 4 5 7; 0 3 5 6];
By = [-1 -2 -1 -2;1 2 1 2;5 5 6 5];
Bz = [-3 -2 0 -5; 3 6 3 2; -1 4 -2 8];

u = linspace(0,1,50);
v = linspace(0,1,50);
%[bx,by,bz] = bezier2(Bx ,By ,Bz,linspace(0,1),linspace(0,1));
%fajn bi blo optimizirat tko da das vse u-je v eno for zanko

[bx,by,bz] = plotBezier2(Bx,By,Bz,u,v);

m = 5;
n=6;
[x,y,z] = peaks(10);
u = (x(:) + 3)./6;
v = (y(:) + 3)./6;

P = [x(:) y(:) z(:)];

[Bx,By,Bz] = lsqbezier2(m,n,P,u,v);

%resitve
%maks napaka 4.0418
%bz(1:10:end,1:10:end) po diagonali =
%[0.0014,0.7558,-0.3112,3.6594,0.0753];