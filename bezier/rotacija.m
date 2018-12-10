function B1 = rotacija( B,fi,os)
%rotiramo tocke za kot fi. Ce smo v 3D izbiramo se os rotacije
% os = 1 x os, os = 2 y os, os = 3 z os
if nargin < 3
    os =1;
end
A = size(B);
B1 = zeros(A(1),A(2));
R = zeros(1,1);
if A(2) == 2
    R = [cosd(fi) -sind(fi); sind(fi) cosd(fi)];
elseif A(2) == 3
    if os == 1
        R = rotx(fi);
    elseif os == 2
        R = roty(fi);
    else
        R = rotz(fi);
    end
end

for i = 1:A(1)
    B1(i,:) = (R*B(i,:)')';
end



end

