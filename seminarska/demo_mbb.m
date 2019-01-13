%demo_mbb

velikosti = 5:5:200;
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

end

figure;
hold on;
plot(velikosti,casi);
plot(velikosti,decastcasi);
legend('VS','dCas')
hold off;

figure;
hold on;
plot(velikosti,casiskupaj);
plot(velikosti,decastcasi);
legend('VS+pretvorba','dCas')
hold off;