function [Bx,By,Bz] = lsqbezier2(m,n,P,u,v)
% Opis:
%   lsqbezier2  vrne  kontrolne  toèke  Bezierjeve  ploskve , ki
%   se po  metodi  najmanjših  kvadratov  najbolje  prilega  danim
%   podatkom
%
% Definicija:
%   [Bx ,By,Bz] = lsqbezier2(m,n,P,u,v)
%
% Vhodni  podatki:
%   m,n parametra , ki  doloèata  stopnji  Bezierjeve
%       ploskve  iz  tenzorskega  produkta ,
%   P matrika , ki v vrsticah  vsebuje  toèke v prostoru ,
%       za  katere  želimo , da jih  Bezierjeva  ploskev
%       èimbolje  aproksimira ,
%   u,v seznama  parametrov , ki doloèata , kateri  toèki v
%       domeni  pripada  posamezna  toèka  iz P
%
% Izhodni  podatki:
%   Bx ,By,Bz  matrike  velikosti n+1 x m+1, ki  predstavljajo
%       kontrolne  toèke  Bezierjeve  ploskve  iz
%       tenzorskega  produkta , ki se po  metodi  najmanjših
%       kvadratov  najbolje  prilega  podatkom

vel = size(P);
l = vel(1);

for h=1:3
    A = zeros(l,(n+1)*(m+1));
    for k = 1:l
        for j=1:n+1
            for i = 1:m+1
                A(k,(j-1)*(m+1)+i) = Bernstein(m,i-1,u(k)) * Bernstein(n,j-1,v(k));
            end
        end 
    end
    b = P(:,h);
    if h == 1
        Bx = A\b;
    elseif h == 2
        By = A\b;
    else
        Bz = A\b;
    end
end

Bx = reshape(Bx,[n+1 m+1]);
By = reshape(Bx,[n+1 m+1]);
Bz = reshape(Bx,[n+1 m+1]);

end

