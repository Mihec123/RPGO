function [bari,koordinate,tri1,b] = plotbezier3( Bx,By,Bz,T,u,v)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


d = length(u);
bari = zeros(d*(d+1)/2,3);
koordinate = zeros(d*(d+1)/2,2);
stevilo = 1;
for j =1:d
    for i = 1:d
        if i+j > d+1
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


%delaunay dela tko da lahko dobis trikotnik k ma prazno ploscino (na isti premici vse tocke)
%mamo mu vidim
%treba filtrirat to vn

n = d;
tri1 = zeros((n-1)^2,3);
indeks = 1;
pricakovana = ((1/(n-1))^2) / 4; % se na pol smo dal zarad numericnih napak k ns v resnic zanima samo ce je blizi 0 k pravi pricakovani ploscini
for i = 1: length(tri)
    x = [koordinate(tri(i,1),1),koordinate(tri(i,2),1),koordinate(tri(i,3),1)];
    y = [koordinate(tri(i,1),2),koordinate(tri(i,2),2),koordinate(tri(i,3),2)];
    ploscina = polyarea(x,y);

    if ploscina < pricakovana
        continue
    else
        tri1(indeks,:) = tri(i,:);
        indeks = indeks+1;
    end
end 


figure;
hold on;
trisurf(tri1,b(:,1),b(:,2),b(:,3));
%s = surf(Bx,By,Bz);
%set(s,'FaceColor','none')
hold off;
end

