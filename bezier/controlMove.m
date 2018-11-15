function B  = controlMove(B,v)
%funkcija controlMove(B,v) prestavi kontrolni poligon B za vektor v

A = size(B);
n = A(1);

for i = 1:n
    B(i,:) = B(i,:) + v;
end




end

