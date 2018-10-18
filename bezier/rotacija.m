function B1 = rotacija( B,fi )
%rotiramo tocke za kot fi

A = size(B);
B1 = zeros(A(1),A(2));
R = zeros(1,1);
if A(2) == 2
    R = [cosd(fi) -sind(fi); sind(fi) cosd(fi)];
elseif A(2) == 3
    R = rotx(fi);
end

for i = 1:A(1)
    B1(i,:) = (R*B(i,:)')';
end



end

