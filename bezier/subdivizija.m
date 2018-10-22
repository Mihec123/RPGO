function [K1,K2] = subdivizija( B,c )
%subdivizija
%c parameter pri katerem delamo subdivizijo
%B kontrolne tocke

A = size(B);
n = A(1);
d = A(2);
K1 = zeros(n,d);
K2 = zeros(n,d);
for i = 1:d
    D = decasteljau(B(:,i),c);
    K1(:,i) = D(:,1);
    K2(:,i) = D(sqrt(end):sqrt(end)-1:end-1); % dobimo nasprotno diagonalo v pravem vrstnem redu
    % za algoritem
end

end

