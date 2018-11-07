function B = beziercubspline(u,D)
% Opis:
%   beziercubspline  izraèuna  sestavljeno  Bezierjevo  krivuljo
%   stopnje 3, ki je  dvakrat  zvezno  odvedljiva v stikih
%
% Definicija:
%   B = beziercubspline(u,D)
%
% Vhodna  podatka:
%   u seznam  parametrov  delitve  dolžine m+1,
%   D matrika , v kateri  vsaka  izmed m+3  vrstic  predstavlja
% eno  kontrolno  toèko  sestavljene  krivulje
%
% Izhodni  podatek:
%   B seznam  dolžine m, v kateri  je vsak  element  matrika s
% štirimi  vrsticami , ki  doloèajo  kontrolne  toèke  kosa
% sestavljene  krivulje

A = size(D);
n = A(1);
d = A(2);
m = n-3;
B = cell(m,1);

temp = zeros(4,d);
temp(1,:) = D(1,:); %b_0 = d_-1
temp(2,:) = D(2,:); %b_1 = d_0
temp(3,:) = (diff(u(2:3)))/(diff(u(1:2)) + diff(u(2:3))) .* D(2,:) + ...
            (diff(u(1:2)))/(diff(u(1:2)) + diff(u(2:3))) .* D(3,:);
B{1} = temp;

temp = B{m};
temp(2,:) = (diff(u(m:m+1)))/(diff(u(m-1:m)) + diff(u(m:m+1))) .* D(end-2,:) + ...
            (diff(u(m-1:m)))/(diff(u(m-1:m)) + diff(u(m:m+1))) .* D(end-1,:);
temp(3,:) = D(end-1,:);
temp(4,:) = D(end,:);
B{m} = temp;

for l = 1:m-2
    temp = B{l+1};
    if isempty(temp)
        temp = zeros(4,d);
    end
    
    temp(2,:) = (diff(u(l+1:l+2))+diff(u(l+2:l+3)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+2,:) +...
            (diff(u(l:l+1)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+3,:);
    
    temp(3,:) = (diff(u(l+2:l+3)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+2,:) +...
            (diff(u(l:l+1))+diff(u(l+1:l+2)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+3,:);
    B{l+1} = temp;
end

for l = 1:m-1
    temp = B{l};
    temp1 = B{l+1};
    if isempty(temp1)
        temp1 = zeros(4,d);
    end
    temp(4,:) = diff(u(l+1:l+2))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* temp(3,:) +...
            diff(u(l:l+1))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* temp1(2,:);
    temp1(1,:) = temp(4,:);
    B{l} = temp;
    B{l+1} = temp1;
end




end

