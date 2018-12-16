function C  = subdivizija( Bx,By,Bz,P4)
% Opis:
%   subdivizija  naredi en korak subdivizije kontrolnega polinoma pri
%   notranji tocki trikotnika podani z baricentricnimi koordinatami P4
%
% Definicija:
%   C  = subdivizija( Bx,By,Bz,P4)
%
% Vhodna  podatka:
%   Bx , By , Bz matrike velikosti n+1 x n+1, ki dolocajo
%       koordinate kontrolnih tock Bezierjeve krpe
%       ( element posamezne matrike na mestu (i,j),
%       j <= n+2-i, doloca koordinato kontrolne
%       tocke z indeksom (n+2-i-j, j -1, i -1)),
%   P4 baricentricne koordinate tocke pri kateri delimo trikotnik
%
% Izhodni  podatek:
%   C   celilca velikosti 3x3 C{i,j} predstavlja kontrolne tocke i-tega
%       trikotnika v dimenziji x,y ali z. Ce je j==1 x, ce j== 2 y, ce j==3 z
%       Trikotniki sopodani na sledec nacin:
%           i = 1: T<P4,P2,P3>
%           i = 2: T<P1,P2,P4>
%           i = 3: T<P1,P4,P3>

C = cell(3,3);

[n,m] = size(Bx);

e1 = [1 0 0];
e2 = [0 1 0];
e3 = [0 0 1];

%trikotnik T<P4,P2,P3>
for k = 1:3
    if k == 1
        Btemp = Bx;
    elseif k== 2
        Btemp = By;
    else
        Btemp = Bz;
    end
    B = NaN(n,m);
    for j = 1:n
        for i = 1:m
            if isnan(Btemp(i,j))
                continue;
            else
                U = [];
                U = [U;repmat(P4,[n+2-1-i-j,1]);repmat(e2,[j-1,1]);repmat(e3,[i-1,1])]; %n+2-1 ker je nas n n+1 ne n
                B(j,i) = blossom3(Btemp,U);
            end
        end
    end
    C{1,k} = B;
    
end

%trikotnik T<P1,P2,P4>
for k = 1:3
    if k == 1
        Btemp = Bx;
    elseif k== 2
        Btemp = By;
    else
        Btemp = Bz;
    end
    B = NaN(n,m);
    for j = 1:n
        for i = 1:m
            if isnan(Btemp(i,j))
                continue;
            else
                U = [];
                U = [U;repmat(e1,[n+2-1-i-j,1]);repmat(e2,[j-1,1]);repmat(P4,[i-1,1])]; %n+2-1 ker je nas n n+1 ne n
                B(j,i) = blossom3(Btemp,U);
            end
        end
    end
    C{2,k} = B;
    
end

%trikotnik T<P1,P4,P3>
for k = 1:3
    if k == 1
        Btemp = Bx;
    elseif k== 2
        Btemp = By;
    else
        Btemp = Bz;
    end
    B = NaN(n,m);
    for j = 1:n
        for i = 1:m
            if isnan(Btemp(i,j))
                continue;
            else
                U = [];
                U = [U;repmat(e1,[n+2-1-i-j,1]);repmat(P4,[j-1,1]);repmat(e3,[i-1,1])]; %n+2-1 ker je nas n n+1 ne n
                B(j,i) = blossom3(Btemp,U);
            end
        end
    end
    C{3,k} = B;
    
end



end

