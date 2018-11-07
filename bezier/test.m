hold on;
button = 0;
vekt = [];
while button ~= 3
[x, y, button] = ginput(1);
vekt = [vekt; x y];
plot(x,y,'o')
end


u = parametrizacija(vekt,0,2);
B = kubicnizlepek( vekt,u );

t = linspace(0,1);

for i = 1:length(B)    
    temp = B{i};
    b = bezier(temp,t);
    plot(temp(:,1),temp(:,2),'-ko', 'MarkerFaceColor', 'b')
    plot(b(:,1),b(:,2),'k');
end




hold off;

