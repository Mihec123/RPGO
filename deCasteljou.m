function [ y ] = deCasteljou(kontrolne,t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n = length(kontrolne)-1;
tabela = zeros(n+1,n+1,2);
for i=0:n
    tabela(1,i+1,:) = kontrolne(i+1,:);
end

for r = 1:n
    for i=0:n-r
        tabela(r+1,i+1,:) = (1-t)*tabela((r-1)+1,i+1,:) + t*tabela((r-1)+1,i+1+1,:);%stevilcenje se zacne pri 1 ne pri 0
    end
end

y = [tabela(n+1,1,1),tabela(n+1,1,2)];
    


end

