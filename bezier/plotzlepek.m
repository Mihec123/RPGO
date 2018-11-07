function plotzlepek( B,t)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

figure;
hold on;
for i = 1:length(B)    
    temp = B{i};
    b = bezier(temp,t);
    plot(temp(:,1),temp(:,2),'-ko', 'MarkerFaceColor', 'b')
    plot(b(:,1),b(:,2),'k');
end
hold off;


end

