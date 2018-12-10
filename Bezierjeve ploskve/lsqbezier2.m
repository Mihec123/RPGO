function [Bx,By,Bz] = lsqbezier2(m,n,P,u,v)
% Opis:
%   lsqbezier2  vrne  kontrolne  to?ke  Bezierjeve  ploskve , ki
%   se po  metodi  najmanj?ih  kvadratov  najbolje  prilega  danim
%   podatkom
%
% Definicija:
%   [Bx ,By,Bz] = lsqbezier2(m,n,P,u,v)
%
% Vhodni  podatki:
%   m,n parametra , ki  dolo?ata  stopnji  Bezierjeve
%       ploskve  iz  tenzorskega  produkta ,
%   P matrika , ki v vrsticah  vsebuje  to?ke v prostoru ,
%       za  katere  ?elimo , da jih  Bezierjeva  ploskev
%       ?imbolje  aproksimira ,
%   u,v seznama  parametrov , ki dolo?ata , kateri  to?ki v
%       domeni  pripada  posamezna  to?ka  iz P
%
% Izhodni  podatki:
%   Bx ,By,Bz  matrike  velikosti n+1 x m+1, ki  predstavljajo
%       kontrolne  to?ke  Bezierjeve  ploskve  iz
%       tenzorskega  produkta , ki se po  metodi  najmanj?ih
%       kvadratov  najbolje  prilega  podatkom
addpath('..\Bernsteinovi polinomi')

vel = size(P);
l = vel(1);

for h=1:3
    A = zeros(l,(n+1)*(m+1));
    for k = 1:l
        for i=1:m+1
            for j = 1:n+1
                A(k,(i-1)*(n+1)+j) = Bernstein(m,i-1,u(k)) * Bernstein(n,j-1,v(k));
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
By = reshape(By,[n+1 m+1]);
Bz = reshape(Bz,[n+1 m+1]);

end

