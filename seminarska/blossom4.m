function b = blossom4( B,U )
%AVTORJA: ANDRA? NAGLI?, JAN GOLOB
% Funkcija blossom4( B,U ) izra?una razcvet 4 dimenzionalne Bezierjeve
% ploskve na to?kah U(i,:).
%   Vhodni podatki:
%      B    3D matrika  velikosti (n+1) x (n+1) x (n+1) koeficientov B. ploskve. B(1,1,1)=b_n000,
%           B(1,2,1)=b_(n-1)100, ...
%      U    matrika velikosti n x 4. Vsaka vrstica U(i,:) je to?ka iz R^3 zapisana z baricentri?nimi koordinatami.
%   Izhodni podatki:
%      b    To?ka na rezcvetu 4D bezierjeve ploskve pri parametrih iz U.

%     for i=1:n+1-r
%        for j=1:n-i
%            B(i,j)=U(r,1)*B(i,j)+U(r,2)*B(i,j+1)+U(r,3)*B(i+1,j);
%        end
%     end
[n,~,~]=size(B); 

for r=1:n-1
    for i=1:(n+2)-r
        for j=1:(n+1-i)
            for k=1:(n+1-i-j)
                B(i,j,k)=U(r,1)*B(i,j,k)+U(r,2)*B(i+1,j,k)+U(r,3)*B(i,j+1,k)+U(r,4)*B(i,j,k+1);
            end
        end
        
        
    end
end
b=B(1,1,1);
end

