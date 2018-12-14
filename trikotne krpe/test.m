%test

Bx = [0 2 6 8;1 3 7 NaN;2 5 NaN NaN; 4 NaN NaN NaN];
By = [0 1 0 -1; 2 2 3 NaN; 4 3 NaN NaN; 5 NaN NaN NaN];
Bz = [-2 1 -2 0; 4 -2 3 NaN; 0 5 NaN NaN; 3 NaN NaN NaN];

T = [ 0 1; 1 0; 0 0];

u = linspace(0,1,6);
v = linspace(0,1,6);

[bari,koordinate,tri,b] = plotbezier3( Bx,By,Bz,T,u,v);

figure;
for i = 1: length(tri)
    risemo = tri(i,:);
    tocke = [];
    tocke = [tocke; koordinate(risemo(1),:)];
    tocke = [tocke; koordinate(risemo(2),:)];
    tocke = [tocke; koordinate(risemo(3),:)];
    clf;
    hold on;
    plot(koordinate(:,1),koordinate(:,2),'b*');
    plot(tocke(:,1),tocke(:,2),'r*');
    w = waitforbuttonpress;
    hold off;
end

