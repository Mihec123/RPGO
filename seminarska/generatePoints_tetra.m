function B = generatePoints_tetra( d, seed )
%UNTITLED2 generira kontrolne toèke za polinom v treh spremenljivkah

rng(seed);

B = cell(4,1);

for dim = 1:4
    M = NaN(d,d,d);
    for k = 1:d
        for j = 1:d+1-k
            for i = 1:d+2-j-k
                M(i,j,k) = 100*rand(1) - 50;
            end
        end
    end
    B{dim} = M;
end


end

