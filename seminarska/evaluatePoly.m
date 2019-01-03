function p = evaluatePoly( a, u, v )
%evaluatePoly izraèuna toèko polinoma stopnje d v dveh spremenljivkah.
%   a(i,j) je koeficient pred u^i*v^j
%   u,v vrednosti v katerih raèunamo polinom

[d,~] = size(a);
d = d - 1;
p = a(1,d+1);

for i = 1:d
    A = a(i+1,d-i+1);
    for j = 1:i
        A = A * u + a(i-j+1,d-i+1);
    end
    p = p * v + A;
end

end