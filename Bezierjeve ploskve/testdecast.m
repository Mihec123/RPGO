%test

X = [3 4 5; 2 3 3.8;1 1.5 2; 0 1 2.5];
Y = [3 3.5 3; 2 2.5 2;1 1.5 1; 0 0.5 0];
Z = [0 2 1; 1 -1 1;1 2 1.5; -0.5 2 1];

%vr = decasteljouPloskev(X,0.5,0.5)
%[X1,Y1,Z1] = bezierPloskev(X,Y,Z,linspace(0,1),linspace(0,1));
plotBezierPloskev(X,Y,Z,linspace(0,1),linspace(0,1))


[X1,Y1,Z1] = visanjeStopnje(X,Y,Z,2);

plotBezierPloskev(X1,Y1,Z1,linspace(0,1),linspace(0,1))