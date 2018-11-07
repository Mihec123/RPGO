function B = kubicnizlepek( D,u )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = size(D);
n = A(1);
d = A(2);
m = n-3;

B = cell(m,1);

temp = zeros(4,d);
temp(1,:) = D(1,:);
B{1} = temp;

for l = 0:m-1
    temp = B{l+1};
    if isempty(temp)
        temp = zeros(4,d);
    end
    if l == 0
        temp(2,:) = D(l+2,:);

        temp(3,:) = (diff(u(l+2:l+3)))/(diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+2,:) + ...
            (diff(u(l+1:l+2)))/(diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+3,:);
        
    elseif l == m-1
        temp(2,:) = (diff(u(l+1:l+2)))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* D(l+2,:) +...
                (diff(u(l:l+1)))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* D(l+3,:);

        temp(3,:) = (diff(u(l:l+1)))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* D(l+3,:);
        
    else
        temp(2,:) = (diff(u(l+1:l+2))+diff(u(l+2:l+3)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+2,:) +...
                (diff(u(l:l+1)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+3,:);

        temp(3,:) = (diff(u(l+2:l+3)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+2,:) +...
                (diff(u(l:l+1)))/(diff(u(l:l+1)) + diff(u(l+1:l+2)) + diff(u(l+2:l+3))) .* D(l+3,:);
    end
    temp
    B{l+1} = temp;
end

for l = 1:m-1
    temp = B{l};
    temp1 = B{l+1};
    temp(4,:) = diff(u(l+1:l+2))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* temp(3,:) +...
            diff(u(l:l+1))/(diff(u(l:l+1)) + diff(u(l+1:l+2))) .* temp1(2,:);
    temp1(1,:) = temp(4,:);
    B{l} = temp;
    B{l+1} = temp1;
end


temp = B{m};
temp(4,:) = D(end,:);
B{m} = temp;

    
    


end

