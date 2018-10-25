function  BS = plotBeziersub( B,t,k,x )
% Opis :
% plotbezier nari?e Bezierjevo krivuljo za dane kontrolne
% to?ke in seznam parametrov, ter subdivizijo kontrolnih tock
%
% Definicija :
% plotbezier (B,t,k,x)
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% x seznam parametrov dol?ine k, pri katerih ra?unamo
% vrednost Bezierjeve krivulje
% t parameter pri katerem izvajamo subdivizijo
% k stevilo korakov subdivizije


hold on;
b = bezier(B,x);
plot(B(:,1),B(:,2),'-ko', 'MarkerFaceColor', 'b');
plot(b(:,1),b(:,2));

BS = beziersub(B,t,k); 

for i = 1:2^k
    temp = BS{k+1,i};
    plot(temp(:,1),temp(:,2),'-ko','MarkerFaceColor', 'r','MarkerEdgeColor', 'k');
end
hold off;

end

