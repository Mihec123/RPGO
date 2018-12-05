function [bx,by,bz] =plotBezier2(Bx,By,Bz,u,v)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[bx,by,bz] = bezier2(Bx,By,Bz,u,v);

figure;
hold on;
surf(bx,by,bz)
s = surf(Bx,By,Bz);
set(s,'FaceColor','none')
hold off;

end
