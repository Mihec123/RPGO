function D = razcvet( b,t )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

n = length(b)-1;
tabela = NaN(n+1,n+1);
for i=0:n
    tabela(1,i+1) = b(i+1);
end

for r = 1:n
    for i=0:n-r
        tabela(r+1,i+1) = (1-t(r))*tabela((r-1)+1,i+1) + t(r)*tabela((r-1)+1,i+1+1);%stevilcenje se zacne pri 1 ne pri 0
    end
end

D = tabela;


end

