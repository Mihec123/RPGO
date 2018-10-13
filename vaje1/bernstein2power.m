function p = bernstein2power(b)
% Opis:
%   glej power2bernstein

novi = zeros(1,length(b));
n = length(b)-1;
for i=0:n
    for j=i:n
        novi(j+1) = novi(j+1) + b(i+1)*(-1)^(i+j)*nchoosek(n,j)*nchoosek(j,i);
    end
end

p = fliplr(novi);
    

end

