function [napaka,B1,B] = kroznica( opcija,fi,t )
%aproksimiramo kroznico z zlepki bezierjeve krivulje pri opcijah
% Vhod:
% opcija = 1 stopnja krivulj je n=2
% opcija = 2 stopnja krivulj je n=3
% opcija = 3 stopnja krivulj je n=3 , ter b(0.5) = (1,0)
% fi je pove kot, tako da se ena krivulja razteza od (-fi,fi)
% t = seznam parametrov pri katerih racunamo krivuljo
% Izhod:
% napaka je razlika med kroznico in krivuljo
% B1 matrika kontrolnih tock vseh krivulj
% B matrika osnovne krivulje

stevilo = floor(180/fi);
tocke = 4;

if opcija == 1
    B = stopnjaDva(fi);
    tocke = 3;
elseif opcija == 2
    B = stopnjaTri(fi);
else
    B = stopnjaTriImproved(fi);
end

B1 = zeros(stevilo*tocke,2);
B1(1:tocke,:) = B;

temp = B;
b = bezier(B,t);

norma = zeros(length(b),1);
for i= 1:length(b)
    norma(i) = norm(b(i,:),2);
end

napaka= max(abs(norma-1));


ang=0:0.01:2*pi; 
xp=cos(ang);
yp=sin(ang);


figure;
hold on;
axis equal
plot(xp,yp,'r');
plot(b(:,1),b(:,2),'b')
plot(B(:,1),B(:,2),'k-o','LineWidth',1)
for i = 1:stevilo-1
    temp = rotacija2D(temp,2*fi);
    B1(tocke*i+1:tocke*(i+1),:) = temp;
    b = bezier(temp,t);
    plot(b(:,1),b(:,2),'b')
    plot(temp(:,1),temp(:,2),'k-o','LineWidth',1)
    
end
hold off;




end

function B = stopnjaDva(fi)
    B = zeros(3,2);
    B(1,1) = cosd(fi);
    B(1,2) = -sind(fi);
    B(2,1) = 1/cosd(fi);
    B(2,2) = 0;
    B(3,1) = cosd(fi);
    B(3,2) = sind(fi);

end

function B = stopnjaTri(fi)
    B = zeros(4,2);
    B(1,1) = cosd(fi);
    B(1,2) = -sind(fi);
    B(4,1) = cosd(fi);
    B(4,2) = sind(fi);
    B(2,1) = cosd(fi) + 1/3*sind(fi);
    B(2,2) = -sind(fi)+1/3*cosd(fi);
    B(3,1) = cosd(fi) + 1/3*sind(fi);
    B(3,2) = sind(fi) - 1/3*cosd(fi);
    
    
end

function B = stopnjaTriImproved(fi)
    B = zeros(4,2);
    B(1,1) = cosd(fi);
    B(1,2) = -sind(fi);
    B(4,1) = cosd(fi);
    B(4,2) = sind(fi);
    B(2,1) = 1/3*(4-cosd(fi));
    B(2,2) = 1/3*(4*cotd(fi)-4/sind(fi)+sind(fi));
    B(3,1) = 1/3*(4-cosd(fi));
    B(3,2) = 1/3*(-4*cotd(fi)+4/sind(fi)-sind(fi));
    
    
end


function M = rotacija2D(B,fi)

R = [cosd(fi) -sind(fi); sind(fi) cosd(fi)];
n = length(B);
M = zeros(n,2);

for i = 1:n
    M(i,:) = (R*B(i,:)')';
end
    
end
