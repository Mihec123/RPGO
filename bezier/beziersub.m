function  BS = beziersub(B,t,k)
% Opis: beziersub  izvede  subdivizijo  Bezierjeve  krivulje
%
% Definicija:
%   BS = beziersub(B,t)
%
% Vhodni  podatki:
%   B matrika  kontrolnih  tock  Bezierjeve  krivulje , v
% kateri  vsaka  vrstica  predstavlja  eno  kontrolno
% tocko ,
%   t parameter  subdivizije  Bezierjeve  krivulje
%
% Izhodni  podatek:
%   BS    celica , ki  vsebuje  kontrolne  tocke  dveh  krivulj , ki
% jih  dobimo s subdivizijo  prvotne  Bezierjeve  krivulje

A = size(B);
n = A(1);
d = A(2);
BS = cell(k+1,2^k);
BS{1} = B;
if k == 1
    %BS = zeros(2*n,d);
    temp1 = zeros(A);
    temp2 = zeros(A);
    for i = 1:d
        D = decasteljau(B(:,i),t);
        temp1(:,i) = D(:,1);
        temp2(:,i) = D(sqrt(end):sqrt(end)-1:end-1); % dobimo nasprotno diagonalo v pravem vrstnem redu
        % za algoritem
    end
    BS{2,1} = temp1;
    BS{2,2} = temp2;
else
    for j = 1:k
        for g = 1:2^(j-1)
            temp1 = beziersub(BS{j,g},t,1);
            BS{j+1,2*g-1} = temp1{2,1};
            BS{j+1,2*g} = temp1{2,2};
        end
    end
end

        

end

