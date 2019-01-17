%demo_tetra

s = rng(123);

iter = 15;

R = zeros(iter,3);


for dim = 2:iter+1
    %U sploh niso baricentriène koordinate
    U = zeros(4,4);
    U(:,1:3) = rand(4,3);
    U(:,4) = 1 - sum(U(:,1:3),2);
    
    seed = randi(1000);
    B = generatePoints_tetra(dim*1,seed);
    Bx = B{1};
    By = B{2};
    Bz = B{3};
    Bt = B{4};
    
    %CASTELJAU
    tic;
    temC = zeros(4,4);
    for a = 1:4
        temC(a,:) = bezier4(Bx,By,Bz,Bt,U(a,:));
    end
    timeC = toc;
    
    %Modified BB
    tic;
    temMBB = zeros(4,4);
    for a = 1:4
        temMBB(a,:) = bezier4_mbb(Bx,By,Bz,Bt,U(a,:));
    end
    timeMBB = toc;
    
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
    
end

figure;
plot(1:iter,R(:,1)');

figure;
hold on;
plot(1:iter,R(:,2)','r');
plot(1:iter,R(:,3)','g');

