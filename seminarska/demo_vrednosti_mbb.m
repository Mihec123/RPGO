%preimerjava vrednosti

B = [2 5 -1 0; 1 3 -4 nan;0 0 nan nan; 1 nan nan nan];
T = [0 0;5 1;3 3];

%tocka iz regije 1
P1 = [1 1];
U1 = pointbary( P1,T );

%tocka iz regije 2
P2 = [4,1.5];
U2 = pointbary( P2,T );

%tocka iz regije 3
P3 = [3,2.5];
U3 = pointbary( P3,T );

b1 = decasteljou3(B,U1); %resitev 1.0741
b2 = decasteljou3(B,U2); %resitev -1.0943
b3 = decasteljou3(B,U3); %resitev 0.5229

%mormo se preoblikovt koeficiente
B_mbb = MBB_poly_conv( B );


vr1 = MBB_alg(B_mbb, U1); % resitev more bit 1.0741
vr2 = MBB_alg(B_mbb, U2); % resitev more bit -1.0943
vr3 = MBB_alg(B_mbb, U3); % resitev more bit 0.5229

razlike = [abs(b1-vr1),abs(b2-vr2),abs(b3-vr3)]