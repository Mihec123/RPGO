function plotBezierlv( B,Bx,t )
% Opis :
% plotbezier nari?e Bezierjevo krivuljo za dane kontrolne B,Bx
% to?ke in seznam parametrov t
%
% Definicija :
% plotbezier (B,t)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% Bx matrika velikosti n+1+k x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n+k v
% d- dimenzionalnem prostoru , kjer je k umetno povecana stopnja krivulje
% t seznam parametrov dol?ine k, pri katerih ra?unamo
% vrednost Bezierjeve krivulje


b = bezier(B,t);
figure;
hold on;
plot(B(:,1),B(:,2),'k-o','LineWidth',1)
plot(b(:,1),b(:,2))
plot(Bx(:,1),Bx(:,2),'r-o','LineWidth',1)
hold off;

end

