%naloga3

B = [-2/3 -4/5; 1/3 1/5; 0 0; -1/3 1/5; 2/3 -4/5];
t = linspace(0,1);
%krivulja
plotbezier(B,t)
%prvi odvod
[db,K1] = bezierder (B,1,t);
%drugi odvod
[db,K2] = bezierder (B,2,t);


%naloga4
t = linspace(0,1,1000);
[napaka1,B11,B1] = kroznica( 1,30,t );
[napaka2,B12,B2] = kroznica( 2,30,t );
[napaka3,B13,B3] = kroznica( 3,30,t );