function q = Farin( B,w )
% Opis :
% Farin poracuna farinove tocke glede na dano racionalno bezierjevo krivuljo
%
% Definicija :
% q = Farin( B,w )
%
% Vhodni podatki :
% B matrika velikosti n+1 x d, ki predstavlja kontrolne
% to?ke Bezierjeve krivulje stopnje n v
% d- dimenzionalnem prostoru ,
% w seznam utezi dol?ine n x 1
% Izhod
% q seznam nxd Farinovih tock
A = size(B);
n = A(1)-1;
q = zeros(n,2);

%farinove tocke
for i =0:n-1  

    q(i+1,:) = w(i+1)/(w(i+1)+w(i+1+1)).*B(i+1,:) + w(i+1+1)/(w(i+1)+w(i+1+1)).*B(i+1+1,:);  
end

end

