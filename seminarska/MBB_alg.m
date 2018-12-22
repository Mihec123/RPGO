function  vr  = MBB_alg(B, U)
% Opis:
%   MBB_alg  izra?una  vrednost polinoma dveh spremenljivk v modificirani
%   Bernstein-Bezier obliki
%
% Definicija:
%    vr  = MBB_alg(B, U)
%
% Vhodna  podatka:
%   B   matrika  velikosti n+1 x n+1, ki  predstavlja
%       koeficiente  polinoma  dveh  spremenljivk  stopnje n v
%       modificirani Bernstein-Bezier  obliki (element  matrike  na  mestu (i,j),
%       j  <= n+2-i, dolo?a  koeficient  polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%   U   baricentricne koordinate tocke v kateri racunamo vrednost polinoma
%
% Izhodni  podatek:
%   vr   vrednost  polinoma v baricentricnih koordinatah U

[n,~] = size(B);
n = n-1;


%dolocimo regijo

if U(3) > U(1) && U(3) > U(2)
    %regija 3
    regija = 3;
    a = U(1)/U(3); %rt
    b = U(2)/U(3); %st
elseif U(2) > U(1) && U(2) >= U(3)
    %regija 2
    regija = 2;
    a = U(1)/U(2); %rs
    b = U(3)/U(2); %ts
elseif U(1) >= U(2) && U(1) >= U(3)
    %regija 1
    regija = 1;
    a = U(2)/U(1); %sr
    b = U(3)/U(1); %tr
end
    
if regija == 3
    A = B(1,1);

    for i = 1:n
        C = B(1,i+1);
        for j = 1:i
            C = C*b + B(j+1,i+1-j);
        end
        A = A *a +C;
    end

elseif regija == 2
    
    A = B(1,1);

    for i = 1:n
        C = B(i+1,1);
        for j = i:-1:1
            C = C*b + B(j,i+2-j);
        end
        A = A *a +C;
    end
    
else
    A = B(1,end);
    for i = 1:n
        C = B(i+1,n+1-i);
        for j = i:-1:1
            C = C*b + B(j,n+1-i);
        end
        A = A *a +C;
    end
end

vr = A * U(regija)^n;
    


end

