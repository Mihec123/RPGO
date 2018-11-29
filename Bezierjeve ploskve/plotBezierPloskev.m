function plotBezierPloskev(X,Y,Z,u,v)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[X1,Y1,Z1] = bezierPloskev(X,Y,Z,u,v);

figure;
hold on;
surf(X1,Y1,Z1)
s = surf(X,Y,Z)
s.FaceColor = 'none';
hold off;

end

