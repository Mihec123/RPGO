%Bx
Bx = zeros(4,4,4);
Bx(:,:,1)= [0 2 6 8;1 3 7 nan;2 5 nan nan; 4 nan nan nan];
Bx(:,:,2)= [2 4 7.2 nan; 1.7 2.5 nan nan; 3 nan nan nan; nan nan nan nan];
Bx(:,:,3)= [3 5 nan nan; 2 nan nan nan; nan nan nan nan; nan nan nan nan];
Bx(:,:,4)= [4 nan nan nan; nan nan nan nan; nan nan nan nan; nan nan nan nan];

%By
By = zeros(4,4,4);
By(:,:,1)= [0 1 0 -1; 2 2 3 nan; 4 3 nan nan; 5 nan nan nan];
By(:,:,2)= [1 2 0 nan; 3 5 nan nan; 4 nan nan nan; nan nan nan nan];
By(:,:,3)= [1.7 1 nan nan; 4 nan nan nan; nan nan nan nan; nan nan nan nan];
By(:,:,4)= [3 nan nan nan; nan nan nan nan; nan nan nan nan; nan nan nan nan];

%Bz
Bz = zeros(4,4,4);
Bz(:,:,1)= [-2 1 -2 0; 4 -2 3 nan; 0 5 nan nan; 3 nan nan nan];
Bz(:,:,2)= [-1 0 -3 nan; 1 -0.4 nan nan; 2 nan nan nan; nan nan nan nan];
Bz(:,:,3)= [-1.3 -2 nan nan; 1 nan nan nan; nan nan nan nan; nan nan nan nan];
Bz(:,:,4)= [-1 nan nan nan; nan nan nan nan; nan nan nan nan; nan nan nan nan];

%Bt
Bt = zeros(4,4,4);
Bt(:,:,1)= [-4 2 2 0; 1 -2 3 nan; 0 -5 nan nan; -3 nan nan nan];
Bt(:,:,2)= [-1 3 2 nan; 1 -4 nan nan; 2 nan nan nan; nan nan nan nan];
Bt(:,:,3)= [3 -2 nan nan; -1 nan nan nan; nan nan nan nan; nan nan nan nan];
Bt(:,:,4)= [1 nan nan nan; nan nan nan nan; nan nan nan nan; nan nan nan nan];

Kt = zeros(20,4);
k=1;
for i = 1:4
    for j = 1:5-i
        for l = 1:6-i-j
            Kt(k,:)=[Bx(i,j,l) By(i,j,l) Bz(i,j,l) Bt(i,j,l)];
            k=k+1;
        end
    end
end
        
        
        