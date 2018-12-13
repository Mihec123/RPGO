function [b] = plotbezier3( Bx,By,Bz,T,u,v)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


d = length(u);
d = d-1;
bari = zeros((d+1)*(d+2)/2,3);
koordinate = zeros((d+1)*(d+2)/2,2);
stevilo = 1;
for i =1:d+1
    for j = 1:d+1
        if i+j > d+2
            continue;
        else
            bari(stevilo,:) = [u(j),v(i),1-u(j)-v(i)];
            koordinate(stevilo,:) = u(j)*T(1,:) + v(i)*T(2,:) + (1-u(j)-v(i))*T(3,:);
            stevilo = stevilo +1;
        end
    end
end

b = bezier3(Bx,By,Bz,bari); 
tri = delaunay(koordinate(:,1),koordinate(:,2));

figure;
trisurf(tri,b(:,1),b(:,2),b(:,3));
%trimesh(tri,b(:,1),b(:,2),b(:,3));

end

