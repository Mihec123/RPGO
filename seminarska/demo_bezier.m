%demonstracija za uporabo mbb pri vec tockah

Bx = triu(rand(101));
By = triu(rand(101));
Bz = triu(rand(101));

% Bx = [0 2 6 8;1 3 7 NaN;2 5 NaN NaN; 4 NaN NaN NaN];
% By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
% Bz = [-2 1 -2 0; 4 -2 3 NaN; 0 5 NaN NaN; 3 NaN NaN NaN];

U = rand(100,3);
v = 1./sum(U,2);
U = diag(v)*U;

tic;
b_mbb = bezier3_mbb(Bx,By,Bz,U);
cas1 = toc;
fprintf('VS algoritem potrebuje %8.3f sekunde.\n',cas1)

tic;
b_decast = bezier3_decast(Bx,By,Bz,U);
cas2 = toc;
fprintf('De Casteljaoujev algoritem potrebuje %8.3f sekunde.\n',cas2)