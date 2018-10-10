function y = plotbazneBernstein( stopnja )

D = eye(stopnja+1);
x = linspace(0,1);
figure;
hold on;
for i = 1:stopnja+1
    p = bernstein2power(D(i,:));
    y = polyval(p,x);
    plot(x,y);
end
hold off;
    




end

