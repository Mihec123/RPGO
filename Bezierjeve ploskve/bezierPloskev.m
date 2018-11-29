function [X1,Y1,Z1] = bezierPloskev(X,Y,Z,u,v)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

t1 = length(u);
t2 = length(v);
X1 = zeros(t1,t2);
Y1 = zeros(t1,t2);
Z1 = zeros(t1,t2);


for i = 1:t1
    for j=1:t2
        for k = 1:3
            if k== 1
                X1(i,j) = decasteljouPloskev(X,u(i),v(j));
            elseif k == 2
                Y1(i,j) = decasteljouPloskev(Y,u(i),v(j));
            else
                Z1(i,j) = decasteljouPloskev(Z,u(i),v(j));
            end
        end
    end
end
    





end

