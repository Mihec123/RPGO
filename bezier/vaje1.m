%naloga2

t = linspace(0,1);
fi = 60;
B = [0 0; 1 2; 3 3; 4 -1; 0 2];

b = bezier(B,t);
plotbezier(B,t);

B1 = zrcaljenje( B,1);
plotbezier(B1,t);

B2 = rotacija( B,fi );
plotbezier(B2,t);