%vaje5

%naloga9

B = [0 0;2 3; 5 0; 3 -1; 2 -1];
w = [0.5,0.7,0.8,1,0.6];


%b = rbezier(B,w,linspace(0,1));
plotrbezier (B,w,linspace(0,1))
%w1 = [0.5,2,0.8,1,0.6];
%plotrbezier (B,w1,linspace(0,1))
%w2 = [0.5,0.2,0.8,1,0.6];
%plotrbezier (B,w2,linspace(0,1))

%[Be,we] = rbezierelv(B,w)

B1 = [1 0; 1 4; -3 2; -3 -2; 1 -4; 1 0];
w11 = [1 1/5 1/5 1/5 1/5 1];

N = 10;
A = cell(N,1);
C = cell(N,1);
A{1} = B1;
C{1} = w11;
for i=2:N
    [Betemp,wetemp] = rbezierelv(A{i-1},C{i-1});
    A{i} = Betemp;
    C{i} = wetemp';
end

hold on;
axis equal
for i = 1:N
    btemp = bezier(A{i},linspace(0,1));
    plot(btemp(:,1),btemp(:,2),'b');
end
btemp = rbezier(B1,w11,linspace(0,1));
plot(btemp(:,1),btemp(:,2),'k');
hold off;

%priporocilo asistenta poglej kako bi lahko naredu tko da bi lahko vleku
%samo eno tocko od q tock ne da bi se ostale premikale 




