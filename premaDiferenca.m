function y = premaDiferenca(stopnja,tocke)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

y = 0;
for j = 0:stopnja
    y = y + nchoosek(stopnja,j)*(-1)^(stopnja-j)*tocke(j+1);
end

end

