%vaje 3

%naloga5

B = [0 0; 2 3; 4 2; 5 -1];
t = 0.5;
k=2;

%BS = beziersub(B,t,k);  

BS = plotBeziersub( B,t,k,linspace(0,1));



%naloga6

B = [0 0; 2 6; 3 0; 5 4; 7 1; 5 5; 10 6];
B3 = bezierelv(B,3);
B10 = bezierelv(B,10);
B30 = bezierelv(B,30);
x = linspace(0,1);

plotBezierlv( B,B3,x )
plotBezierlv( B,B10,x )
plotBezierlv( B,B30,x )
