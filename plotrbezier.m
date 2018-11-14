function plotrbezier (B,w,t)
% Opis :
% plotrbezier nari?e racionalno Bezierjevo krivuljo za dane kontrolne
% to?ke in seznam parametrov
%
% Definicija :
% plotbezier (B,t)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% t seznam parametrov dol?ine k, pri katerih ra?unamo
% vrednost Bezierjeve krivulje

A = size(B);
n = A(1)-1;
q = zeros(n,2);

for i =0:n-1  

    q(i+1,:) = w(i+1)/(w(i+1)+w(i+1+1)).*B(i+1,:) + w(i+1+1)/(w(i+1)+w(i+1+1)).*B(i+1+1,:);  
end

b = rbezier(B,w,t);

figure;
hold on;
%axis([-2 2 -2 2])
%pbaspect([1 1 1])
plot(B(:,1),B(:,2),'k-o','LineWidth',1)
plot(q(:,1),q(:,2),'ro','LineWidth',1)
plot(b(:,1),b(:,2))
hold off;

end

