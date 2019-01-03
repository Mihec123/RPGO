%test

addpath('../trikotne krpe')

% B = [2 5 -1 0; 1 3 -4 nan;0 0 nan nan; 1 nan nan nan];
% T = [0 0;5 1;3 3];
% 
% %tocka iz regije 1
% P1 = [1 1];
% U1 = pointbary( P1,T );
% 
% %tocka iz regije 2
% P2 = [4,1.5];
% U2 = pointbary( P2,T );
% 
% %tocka iz regije 3
% P3 = [3,2.5];
% U3 = pointbary( P3,T );
% 
% b1 = decasteljou3(B,U1); %resitev 1.0741
% b2 = decasteljou3(B,U2); %resitev -1.0943
% b3 = decasteljou3(B,U3); %resitev 0.5229
% 
% %mormo se preoblikovt koeficiente
% B_mbb = MBB_poly_conv( B );
% 
% 
% vr1 = MBB_alg(B_mbb, U1); % resitev more bit 1.0741
% vr2 = MBB_alg(B_mbb, U2); % resitev more bit -1.0943
% vr3 = MBB_alg(B_mbb, U3); % resitev more bit 0.5229


velikosti = [5:5:200];
razlike = zeros(1,length(velikosti));
casi = zeros(1,length(velikosti));
casipretvorb = zeros(1,length(velikosti));
casiskupaj = zeros(1,length(velikosti));
decastcasi = zeros(1,length(velikosti));

%seed za random generator
rng(10000);
U_test = [1,0,0];

for i = 1:length(velikosti)
    
B_test = rand(velikosti(i));

tic;
B_mbb_test = MBB_poly_conv( B_test );
cas1 = toc;
casipretvorb(i) = cas1;

tic;
B_vr_decast = decasteljou3(B_test,U_test);
cas2 = toc;
decastcasi(i) = cas2;

tic;
B_vr_mbb = MBB_alg(B_mbb_test,U_test);
cas3 = toc;
casi(i) = cas3;

casiskupaj(i) = cas3+cas1;

razlike(i) = abs(B_vr_mbb-B_vr_decast);

end

figure;
hold on;
plot(velikosti,casi);
plot(velikosti,decastcasi);
legend('mbb','decast')
hold off;

figure;
hold on;
plot(velikosti,casiskupaj);
plot(velikosti,decastcasi);
legend('mbb+pretvorba','decast')
hold off;

% Bx = triu(rand(150));
% By = triu(rand(150));
% Bz = triu(rand(150));

Bx = [0 2 6 8;1 3 7 NaN;2 5 NaN NaN; 4 NaN NaN NaN];
By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
Bz = [-2 1 -2 0; 4 -2 3 NaN; 0 5 NaN NaN; 3 NaN NaN NaN];

U = rand(100,3);
tic;
b_mbb = bezier3_mbb(Bx,By,Bz,U);
cas1 = toc;

tic;
b_decast = bezier3_decast(Bx,By,Bz,U);
cas2 = toc;


% %casovni test
% n=200;
% B_test = rand(n);
% 
% U_test = [1,0,0];
% 
% tic;
% B_mbb_test = MBB_poly_conv( B_test );
% cas1 = toc;
% 
% tic;
% B_vr_decast = decasteljou3(B_test,U_test);
% cas2 = toc;
% 
% tic;
% B_vr_mbb = MBB_alg(B_mbb_test,U_test);
% cas3 = toc;

