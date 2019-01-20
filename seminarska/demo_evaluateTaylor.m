%demo

%koeficienti taylorja glede na 
a = [1 2 3;
    4 5 NaN;
    6 NaN NaN];

d = 5;
a = NaN(d);

for i = 1:d
    for j = 1:d+1-i
        a(i,j) = mod(i*j*7,d)-d/2;
    end
end
        

u = linspace(-1,1);
v = linspace(-1,1);
p = NaN(100,100);

tic;

for i = 1:100
    for j = 1:100 
        p(i,j) = evaluatePoly(a,u(i),v(j));
    end
end

time = toc

surf(u,v,p);

