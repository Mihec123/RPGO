function  B  = kvadraticenzlepek(u,D)
% Opis:
%   kvadraticenzlepek  izra?una  sestavljeno  Bezierjevo  krivuljo
%   stopnje 2, ki je  enkrat  zvezno  odvedljiva v stikih
%
% Definicija:
%   B = kvadraticenzlepek(u,D)
%
% Vhodna  podatka:
%   u seznam  parametrov  delitve  dol?ine m+1,
%   D matrika , v kateri  vsaka  izmed m+2  vrstic  predstavlja
% eno  kontrolno  to?ko  sestavljene  krivulje
%
% Izhodni  podatek:
%   B seznam  dol?ine m, v kateri  je vsak  element  matrika s
% tremi  vrsticami , ki  dolo?ajo  kontrolne  to?ke  kosa
% sestavljene  krivulje

A = size(D);
n = A(1);
d = A(2);
m = n-2;

B = cell(m,1);

temp = zeros(3,d);
temp(1,:) = D(1,:);
B{1} = temp;
for l = 1:m
    temp = B{l};
    if isempty(temp)
        temp = zeros(3,d);
    end
    temp(2,:) = D(l+1,:);
    B{l} = temp;
    if l ~= m
        temp1 = B{l+1};
        if isempty(temp1)
            temp1 = zeros(3,d);
        end
        temp(3,:) = diff(u(l+1:l+2))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* D(l+1,:) +...
            diff(u(l:l+1))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* D(l+2,:);
        temp1(1,:) = temp(3,:);
        B{l} = temp;
        B{l+1} = temp1;
    end
end
temp = B{m};
temp(3,:) = D(end,:);
B{m} = temp;
    
    

end

