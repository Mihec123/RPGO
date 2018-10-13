function plotbezier (B , t)
% Opis :
% plotbezier nari?e Bezierjevo krivuljo za dane kontrolne
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

b = bezier(B,t);
A = size(B);
if A(1,2) == 2
    figure;
    hold on;
    plot(B(:,1),B(:,2),'k-o','LineWidth',1)
    plot(b(:,1),b(:,2))
    hold off;
elseif A(1,2) == 3
    figure;
    hold on;
    plot3(B(:,1),B(:,2),B(:,3),'k-o','LineWidth',1)
    plot3(b(:,1),b(:,2),b(:,3))
    hold off;
end
    



end

