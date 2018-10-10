function [ bezier ] = risi( kontrolne,stTock )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

t = linspace(0,1,stTock);
bezier = zeros(100,2);
for i = 1:100
    bezier(i,:) = deCasteljou(kontrolne,t(i));
end
figure;
hold on;
plot(kontrolne(:,1),kontrolne(:,2),'k-o','LineWidth',2)
plot(bezier(:,1),bezier(:,2))
hold off;


end

