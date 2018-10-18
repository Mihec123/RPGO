function plotbazneBernstein( stopnja )
%stopnja pove katere stopnje bernsteinovih baznih polinomov nari?emo

D = eye(stopnja+1);
x = linspace(0,1);
Y = zeros(stopnja+1,length(x));
for i = 1:stopnja+1
    p = bernstein2power(D(i,:));
    y = polyval(p,x);
    Y(i,:) = y;
end

figure;
plot(x,Y)




end

