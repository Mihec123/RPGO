function B1 = zrcaljenje( B,i)
%zrcalimo kontrolne tocke preko osi dolocene s parametrom
% Vhod:
% B tabela kontrolnih tock
% parameter i pomeni zrcalimo preko osi i (ni cist tko)
% x = 1, y = 2, z = 3, ...(ce smo v visjih dimenzijah)
% Izhod
% B1 tabela prezrcaljenih tock


B1 = B;
B1(:,i) = -B(:,i);


end

