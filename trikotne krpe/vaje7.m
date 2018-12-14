%vaje7 12.12.2018


B = [2 5 -1 0; 1 3 -4 NaN; 0 0 NaN NaN; 1 NaN NaN NaN];
%B dimenzije n+1 x n+1

T = [0 0;5 1;3 3];

%tocke % resitve
P1 = [0 0];
U1 = pointbary( P1,T ); % 1     0     0
P2 = [1 1];
U2 = pointbary( P2,T ); % 0.666666666666667                   0   0.333333333333333
P3 = [4 2];
U3 = pointbary( P3,T ); % 0   0.500000000000000   0.500000000000000


%vektor % resitve
x = [1 0];
Ux = vectorbary( x,T ); % -0.166666666666667   0.250000000000000  -0.083333333333333
y = [0 1];
Uy = vectorbary( y,T ); % -0.166666666666667  -0.250000000000000   0.416666666666667

b1 = blossom3(B,[U1;U1;U1]); % resitev 2

b2 = blossom3(B,[U2;U2;U2]);% resitev 2.851852

b3 = blossom3(B,[U3;U3;U3]); % resitev -1.37500

%odvod v x smeri

%odvodom manka fakulteta spredi
dx1 = odvod( B,[Ux],[1],[U1]); %resitev -1.5
dx2 = odvod( B,[Ux],[1],[U2]); %-0.805556
dx3 = odvod( B,[Ux],[1],[U3]); % -1.9neki

%odvod v y smeri
dy1 = odvod( B,[Uy],[1],[U1]);
dy2 = odvod( B,[Uy],[1],[U2]);
dy3 = odvod( B,[Uy],[1],[U3]);

%odvodi visjih stopenj
dxx1 = odvod( B,[Ux],[2],[U1]);
dxx2 = odvod( B,[Ux],[2],[U2]);
dxx3 = odvod( B,[Ux],[2],[U3]);

dyy1 = odvod( B,[Uy],[2],[U1]);
dyy2 = odvod( B,[Uy],[2],[U2]);
dyy3 = odvod( B,[Uy],[2],[U3]);

dxy1 = odvod( B,[Ux;Uy],[1,1],[U1]);
dxy2 = odvod( B,[Ux;Uy],[1,1],[U2]);
dxy3 = odvod( B,[Ux;Uy],[1,1],[U3]);



%za krpo

%u T1 +v T2 + wT3 = T
%0:1 v u smeri npr jih uzams d+1
%0:1 v v smeri uzams jih isto
%pa samo po trikotniku ne ceu kvadrat
%w = 1-u-v
%dobis d+2 nad 2 tock v baricentricnih koord

%za narisat trisurf ali trimesh
%za TRI dobit racunas zravn baricentricnih se tocke x,y tko da uT1+vT2+wT3
%potem pa klices delaunay(X,Y) da dobis triangulacijo


%naloga 14

Bx = [0 2 6 8;1 3 7 NaN;2 5 NaN NaN; 4 NaN NaN NaN];
By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
Bz = [-2 1 -2 0; 4 -2 3 NaN; 0 5 NaN NaN; 3 NaN NaN NaN];

%d je stevilo intervalov na katere razdelimo domenski trikotnik glej
%trimeshgrid

d = 50;
[U,b] = plotbezier3( Bx,By,Bz,d);


