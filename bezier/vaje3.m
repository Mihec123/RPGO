%vaje 3

%naloga5

% B = [0 0; 2 3; 4 2; 5 -1];
% t = 0.5;
% k=2;
% BS = beziersub(B,t,k);  
% 
% hold on;
% x = linspace(0,1);
% b = bezier(B,x);
% plot(B(:,1),B(:,2),'-o', 'MarkerFaceColor', 'b');
% plot(b(:,1),b(:,2));
% for i = 1:2^k
%     i
%     temp = BS{k+1,i}
%     plot(temp(:,1),temp(:,2),'-o', 'MarkerEdgeColor','k','MarkerFaceColor', 'r');
% end
% hold off;


%naloga6

B = [0 0; 2 6; 3 0; 5 4; 7 1; 5 5; 10 6];
B2 = bezierelv(B,2);
B3 = bezierelv(B,3);
B10 = bezierelv(B,10);
B30 = bezierelv(B,30);
x = linspace(0,1);

plotbezier(B3,x)
plotbezier(B10,x)
plotbezier(B30,x)
