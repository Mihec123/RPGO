%demo N tock

iter = 10;
jump = 2;
s_tock = 20;
smart = 0;

s = rng(123);
R = zeros(iter,4);

for dim = 2:iter+1
    %U sploh niso baricentriène koordinate
    U = rand(s_tock,4);
    v = 1./sum(U,2);
    U = diag(v)*U;
    
    seed = randi(1000);
    B = generatePoints_tetra(dim*jump,seed);
    Bx = B{1};
    By = B{2};
    Bz = B{3};
    Bt = B{4};
    
    %CASTELJAU
    if(smart)
        tic;
        temC = bezier4(Bx,By,Bz,Bt,U);
        timeC = toc;
    else
        tic;
        temC = zeros(s_tock,4);
        for a = 1:s_tock
            temC(a,:) = bezier4(Bx,By,Bz,Bt,U(a,:));
        end
        timeC = toc;
    end
    
    %Modified BB
    if(smart)
        tic;
        temMBB = bezier4_mbb(Bx,By,Bz,Bt,U);
        timeMBB = toc;
    else
        tic;
        temMBB = zeros(s_tock,4);
        for a = 1:s_tock
            temMBB(a,:) = bezier4_mbb(Bx,By,Bz,Bt,U(a,:));
        end
        timeMBB = toc;
    end
    
    %shift index back for saving into matrix
    ii = dim-1;
    
    %calculate norms
    tem = temC - temMBB;
    for a = 1:4
        R(ii,1) = R(ii,1) + norm(tem(a,:));
    end
    R(ii,1) = R(ii,1)/4;
    
    %calculate times
    R(ii,2) = timeC;
    R(ii,3) = timeMBB;
    R(ii,4) = dim*jump;  %to know in which dim we calculated this
    
end

% figure;
% plot(1:iter,R(:,1)');
% legend('De Casteljau');
% xlabel('d') ;
% ylabel('Norma');
% title('Norma razlik izraèuanih vrednosti.');

figure;
hold on;
plot(R(:,4)',R(:,2)','r');
plot(R(:,4)',R(:,3)','g');
legend('De Casteljau', 'modified');
xlabel('d + 1') ;
set(gca, 'XTick', R(:,4)');
%xticks();
ylabel('Èas');
title('Vseh N toèk hkrati.');

